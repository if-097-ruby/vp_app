class Account::ProfilesController < ApplicationController
  layout "dashboard"

  def show
  	@user = current_user.id
  end

end
