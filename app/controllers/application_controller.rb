class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

   include Pundit
    after_action :verify_authorized, except: [:index, :show],  unless: :skip_pundit?
    after_action :verify_policy_scoped, only:  [:show], unless: :skip_pundit?
    #when I add to the line 7, the :index action I have an error,Pundit::PolicyScopingNotPerformedError in ArticlesController#index


   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   def user_not_authorized
     flash[:alert] = "You are not authorized to perform this action."
     redirect_to(root_path)
   end

    private

    def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/



    end

end
