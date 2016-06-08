class TopicPolicy < ApplicationPolicy

	#topic policys for whom can see topics, create, update them
	def index?
		true
	end

	def create?
		user.present? && user.admin?
	end

	def update?
		create?
	end

	def show?
		record.public? || user.present?
end
end