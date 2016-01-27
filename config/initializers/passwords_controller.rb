DeviseTokenAuth::PasswordsController.class_eval do

    def render_update_success
      render json: {
        success: true,
        data: {
          user: @resource.email,
          message: I18n.t("devise_token_auth.passwords.successfully_updated")
        }
      }
    end
end
