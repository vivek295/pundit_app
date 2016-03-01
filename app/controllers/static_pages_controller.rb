class StaticPagesController < ApplicationController
	before_action :authenticate_user!,only: [:edit,:index,:destroy,:update,:verify]
	after_action :verify_authorized ,only:[:index,:destroy,:edit]
	def index
		@users=User.all
		authorize User
	end

	def home

	end

	def show
		@user=User.find_by(id: params[:id])
	end

	def edit
		@user=User.find_by(id: params[:id])
		authorize User
	end

	def update
		authorize User
		@user=User.find_by(id: params[:id])
		if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
		    params[:user].delete(:password)
		    params[:user].delete(:password_confirmation)
		end
		if @user.update_attributes(user_params)
			redirect_to index_path
		else
			flash[:danger]=@user.errors.messages
			redirect_to index_path
		end
	end

	def destroy
		authorize User
		user=User.find_by(id: params[:id])
		user.destroy
		flash[:success] = "User Deleted"
		respond_to do |format|
			format.js {render layout: false}
		end
		#redirect_to index_path
	end

	def change_role
		user=User.find_by(id: params[:id])
		user.update_attributes(user_update_params)
		render nothing: true

	end

	def verify
		authorize User 
		user = User.find_by(id: params[:id])
		user.activate
		flash[:success] = "User Verified"
		respond_to do |format|
			format.js {render layout: false}
		end
		#redirect_to index_url
	end

	private

	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

	def user_update_params
		params.require(:user).permit(:role)
	end

end
