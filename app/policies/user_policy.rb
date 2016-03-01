class UserPolicy
	attr_reader :current_user,:model

	def initialize(current_user,model)
		@current_user=current_user
		@user = model
	end
	def new?
		if @current_user
			@current_user.admin?
		else
			true
		end
	end

	def create?
		if @current_user
			@current_user.admin?
		else
			true
		end
	end

	def index?
		@current_user.admin? or @current_user.moderator?
	end

	def show?
		if @current_user
			@current_user.admin? or @current_user == @user or @current_user.moderator?
		else
			false
		end
	end

	def home?
		@current_user
	end

	def edit?
		@current_user.admin? or @current_user == @user
	end

	def destroy?
		return false if @current_user == @user
		@current_user.admin? or @current_user.moderator?
	end

	def update?
		@current_user.admin? or @current_user == @user
	end

	def verify?
		@current_user.admin? or @current_user.moderator?
	end
end 