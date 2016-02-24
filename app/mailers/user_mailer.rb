class UserMailer < ApplicationMailer
	def otp_email(user)
		@user=user
		mail(to: @user.email,subject: 'Verify Mail')
	end

end
