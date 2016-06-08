class CommentPolicy < ApplicationPolicy

	#policys for whom can create, and destroy comments
	def create?
		user.present? || user.admin?
	end

	def new?
		create?
	end

	def destroy?
		user.present? && (record.user == user || user.admin? || user.moderator?)
	end
	
end