class Permission < ActiveRecord::Base
  has_and_belongs_to_many :roles, :join_table => "role_permissions"
end
