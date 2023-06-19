class ApplicationPolicy
  attr_reader :user
  attr_reader :record

def initialize(user, record)
  @user   = user
  @record = record
end

def new?
  false
end

def create?
  new?
end

def show?
  false
end

def edit?
  update?
end

def update?
  false
end

def destroy?
  false
end

def index?
  false
end

end
