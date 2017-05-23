class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :registerable
  after_initialize :set_default_role, :if => :new_record?
  has_many :appointments, foreign_key: :employee_id

  enum role: {
    admin: 0,
    employee: 1,
  }

  def set_default_role
    self.role ||= :admin
  end

  def self.new_with_password(attr = {})
    password = Devise.friendly_token.first(8)
    create(attr.merge(password: password, password_confirmation: password))
  end

   def self.get_roles_for_select
    roles_to_use = self.role
    roles_to_use.map { |key, value| [value, key] }
  end


end
