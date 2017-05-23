class AppointmentPolicy
attr_reader :current_user, :appointment
  def initialize(current_user, appointment)
    @current_user = current_user
    @appointment = appointment
  end

  def index?
    true
  end

  def show?
    current_user.admin?
  end

  def create?
    current_user.admin?
  end

  def new?
    current_user.admin?
  end

  def update?
  current_user.admin?
  end

  def edit?
    current_user.admin?
  end

  def destroy?
    current_user.admin?
  end

end
