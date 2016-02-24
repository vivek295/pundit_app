class VerificationsController < ApplicationController
	def edit
		@user=User.find_by(id: params[:id])
	end

	def update
		@user=User.find_by(id: params[:id])
		puts @user.otp
		puts (params[:user][:id]).to_i
		if @user && !@user.verified && (@user.otp).to_i==(params[:user][:otp]).to_i
			@user.activate
			flash[:success] = "Account Verified"
			sign_in @user
			redirect_to root_path
		else
			flash[:danger] = "Invalid OTP"
			redirect_to root_path
		end
	end
end
