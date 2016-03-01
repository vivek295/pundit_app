class RegistrationsController < Devise::RegistrationsController
	prepend_before_action :require_no_authentication, only: [:cancel]
	after_action :verify_authorized ,only:[:new,:create]
	def new
		@user=User.new
		authorize User
	end

	def create
		authorize User
		@user = User.new(user_params)
		otp=(0...6).map{|i| rand ((i==0 ? 1 :0)..9)}.join.to_i
    	@user.otp=otp
		if @user.save
			UserMailer.otp_email(@user).deliver_now
			if current_user
				if current_user.admin?
					redirect_to index_path
				end
			else
				flash[:success] = "Account Created Successfully"
				redirect_to edit_verification_path(@user)
			end
		else
			flash[:danger] = "Error While Creating Account"
			redirect_to root_path
		end
	end

	def edit
		if @current_user.verified
			super
		else
			flash[:danger] = "Verify Your Account"
			redirect_to edit_verification_path(@current_user)
		end
	end

	def update
		super
	end

	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

	def update_resource(resource,params)
		resource.update_without_password(params)
	end

end