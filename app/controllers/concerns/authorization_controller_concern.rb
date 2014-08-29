module AuthorizationControllerConcern
  extend ActiveSupport::Concern
  include SessionsControllerConcern

  included do

    helper_method :current_user
  end

  module ClassMethods
    # Runs authorization check for current user and restricts access
    # for unauthorized roles.
    def require_authorization(options={})
      self.class_eval("
        before_filter :handle_authorization, #{options}
        def handle_authorization
          not_authorized unless authorized?
        end
      ")
    end
  end

  # Checks if current user is authorized for controller/action.
  def authorized?
    return true
  end

  # Called when access is restricted.
  def not_authorized
    redirect_to login_path
  end

end
