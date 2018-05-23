class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]


  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
