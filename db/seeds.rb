# populate permission
permissions = Permission.create!([
  { :action => 'read', :object_type => 'Admin', :non_model => false },
  { :action => 'create', :object_type => 'Admin', :non_model => false },
  { :action => 'update', :object_type => 'Admin', :non_model => false },
  { :action => 'destroy', :object_type => 'Admin', :non_model => false },
  { :action => 'read', :object_type => 'Role', :non_model => false },
  { :action => 'create', :object_type => 'Role', :non_model => false },
  { :action => 'update', :object_type => 'Role', :non_model => false },
  { :action => 'destroy', :object_type => 'Role', :non_model => false },
  { :action => 'read', :object_type => 'User', :non_model => false },
  { :action => 'create', :object_type => 'User', :non_model => false },
  { :action => 'update', :object_type => 'User', :non_model => false },
  { :action => 'destroy', :object_type => 'User', :non_model => false },
  { :action => 'read', :object_type => 'Page', :non_model => false },
  { :action => 'create', :object_type => 'Page', :non_model => false },
  { :action => 'update', :object_type => 'Page', :non_model => false },
  { :action => 'destroy', :object_type => 'Page', :non_model => false },
  { :action => 'read', :object_type => 'Section', :non_model => false },
  { :action => 'create', :object_type => 'Section', :non_model => false },
  { :action => 'update', :object_type => 'Section', :non_model => false },
  { :action => 'destroy', :object_type => 'Section', :non_model => false }
#{ :action => 'read', :object_type => 'Dashboard', :non_model => true}
])

# populate roles
role = Role.create!({ :name => Role::SUPER_ADMIN, :description => "Manage system with full rights." })
role.permissions << permissions
role.save!

# populate admin account
admin = Admin.create!(:username => 'hnghiem', :first_name => 'Hoang', :last_name => 'Nghiem', :email => 'admin@mine.com', :password => '123456')
admin.roles << role
admin.save!
