class UserPolicy
	attr_reader :current_user,:model

	def initialize(current_user,model)
		@current_user=current_user
		@user = model
	end

	def index?
		@current_user.admin?
	end

	def show?
		@current_user.admin? or @current_user == @user
	end

	def home?
		@current_user
	end

	def edit?
		@current_user.admin? or @current_user == @user
	end

	def destroy?
		return false if @current_user == @user
		@current_user.admin?
	end
end 