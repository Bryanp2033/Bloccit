class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    user.present? && (record.user == user || user.admin?)
  end

  def destroy?
    update?
  end

  def scope
   record.class
  end
    
end