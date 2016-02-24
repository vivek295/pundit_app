class StaticPagesController < ApplicationController
	before_action :authenticate_user!,only: [:edit,:index,:destroy]
	after_action :verify_authorized ,only:[:index,:destroy,:edit]
	def index
		@users=User.all
		authorize User
	end

	def home

	end

	def edit
		authorize User
		user = User.find_by(id: params[:id])
		user.activate
		flash[:success] = "User Verified"
		redirect_to index_url
	end

	def destroy
		authorize User
		user=User.find_by(id: params[:id])
		user.destroy
		flash[:success] = "User Deleted"
		redirect_to index_path
	end
end
