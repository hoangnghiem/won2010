class Role < ActiveRecord::Base
  # relation ship
  has_and_belongs_to_many :admins, :join_table => "admin_roles"
  has_and_belongs_to_many :permissions, :join_table => "role_permissions"

  # validation
  validates_presence_of :name, :description
  validates_uniqueness_of :name
  SUPER_ADMIN = "Super Administator"

  def permit?(permission)
    return false if permission.blank?
    if permission.is_a?(Permission)
      return self.permissions.include?(permission)
    elsif permission.is_a?(Array)
      permission.each do |p|
        return false unless self.permissions.include?(p)
      end
    end
    return true
  end
end
