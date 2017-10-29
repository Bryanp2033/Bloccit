class ApplicationPolicy

  #only reads the user, and the record
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  #policys
  
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
   user.present? && (record.user == user || user.admin?)
 end

 def edit?
  update?
end

def destroy?
  update?
end

def scope
 record.class
end

end
