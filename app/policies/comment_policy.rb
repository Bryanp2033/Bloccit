class CommentPolicy < ApplicationPolicy

	def create
		user.present? || user.admin?
	end

	def new
		create?
	end
end