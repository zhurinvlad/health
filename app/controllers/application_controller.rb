class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }


  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:account_update).push(:name, :id_avatar, :rating, :weight, :growth)
end


end
