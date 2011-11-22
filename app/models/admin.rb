class Admin < ActiveRecord::Base
  # devise configure
  devise :database_authenticatable, :trackable, :timeoutable, :lockable, :recoverable, :validatable
  attr_accessible :username, :email, :password, :password_confirmation, :first_name, :last_name, :role_ids 
  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username

  # relationships
  has_and_belongs_to_many :roles, :join_table => "admin_roles"

  def full_name
    first_name + " " + last_name
  end

  def flatten_permissions
    permissions = []
    self.roles.each do |role|
      permissions << role.permissions
    end
    permissions.flatten.uniq
  end

  def flatten_roles
    self.roles.map { |r| r.name }
  end

  def super_admin?
    flatten_roles.include?(Role::SUPER_ADMIN)
  end
end
