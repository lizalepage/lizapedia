class DowngradeController < ApplicationController
  def create
    current_user.update_attribute(:role, 'standard')
    flash[:notice] = "You have successfully downgraded your account."
        
    redirect_to root_path
  end
end
