class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: "mice3", password: "Topniska45"
  respond_to :html

  include SessionsControllerConcern

    def autocomplete
      @return_objects = []
      if defined?(params[:type]) && defined?(params[:term])
        @return_objects = params[:type].camelize.constantize.autocomplete_scope(params[:term], nil).limit(20)
      end

      render json: @return_objects.to_json
    end


  # Returns currently authenticated user.
  def current_user
    @current_user ||= User.authenticatable.find_by_id(session[:user_id]) if session[:user_id]
    #unauthenticate unless @current_user
    @current_user
  end
end
