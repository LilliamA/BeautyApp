class Appointment < ActiveRecord::Base
  belongs_to :employee, class_name: 'User'
end
