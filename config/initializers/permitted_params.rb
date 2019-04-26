PermittedParams.setup do |config|
    config.user do
      # We always permit username and password to be mass-assigned
      scalar :username, :password
  
      # email can be mass-assigned from create (but not from update)
      scalar :email if action_is(:create)
  
      # Only admins can change the is_admin flag.  Note that we can call
      # any controller methods (including current_user) from this scope.
      scalar :is_admin if current_user.admin?
  
      # We permit job_ids to be an array of scalar values
      array :job_ids
  
      # We permit person_attributes containing the whitelisted attributes
      # of person (see definition below)
      nested :person
    end
  
    config.person do
      # Inheritance!
      inherits :thing_with_name
    end
  
    config.thing_with_name do
      scalar :name
    end
  end