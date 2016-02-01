DeviseTokenAuth.setup do |config|
  # By default the authorization headers will change after each request. The
  # client is responsible for keeping track of the changing tokens. Change
  # this to false to prevent the Authorization header from changing after
  # each request.
  # config.change_headers_on_each_request = true
  config.default_password_reset_url = "http://localhost:3000/"
  # By default, users will need to re-authenticate after 2 weeks. This setting
  # determines how long tokens will remain valid after they are issued.
  # config.token_lifespan = 2.weeks
  # Sets the max number of concurrent devices per user, which is 10 by default.
  # After this limit is reached, the oldest tokens will be removed.
  # config.max_number_of_devices = 10

  # Sometimes it's necessary to make several requests to the API at the same
  # time. In this case, each request in the batch will need to share the same
  # auth token. This setting determines how far apart the requests can be while
  # still using the same auth token.
  # config.batch_request_buffer_throttle = 5.seconds

  # This route will be the prefix for all oauth2 redirect callbacks. For
  # example, using the default '/omniauth', the github oauth2 provider will
  # redirect successful authentications to '/omniauth/github/callback'
  # config.omniauth_prefix = "/omniauth"
  # By default sending current password is not needed for the password update.
  # Uncomment to enforce current_password param to be checked before all
  # attribute updates. Set it to :password if you want it to be checked only if
  # password is updated.
  config.check_current_password_before_update = :password

  # By default, only Bearer Token authentication is implemented out of the box.
  # If, however, you wish to integrate with legacy Devise authentication, you can
  # do so by enabling this flag. NOTE: This feature is highly experimental!
  # enable_standard_devise_support = false
end
DeviseTokenAuth::PasswordsController.class_eval do

    def create
      unless resource_params[:email]
        return render_create_error_missing_email
      end
      # honor devise configuration for case_insensitive_keys
      if resource_class.case_insensitive_keys.include?(:email)
        @email = resource_params[:email].downcase
      else
        @email = resource_params[:email]
      end

      q = "uid = ? AND provider='email'"

      @resource = resource_class.where(q, @email).first

      @errors = nil
      @error_status = 400

      if @resource
        yield if block_given?
          pass = Devise.friendly_token.first(8)
          @resource.update_attributes( { :password => pass, :password_confirmation => pass })
          UserMailer.password_reset(@resource, pass).deliver

        if @resource.errors.empty?
          return render_create_success
        else
          @errors = @resource.errors
        end
      else
        @errors = [I18n.t("devise_token_auth.passwords.user_not_found", email: @email)]
        @error_status = 404
      end

      if @errors
        return render_create_error
      end
    end
    def render_update_success
      render json: {
        success: true,
        data: {
          user: @resource.email,
          message: I18n.t("devise_token_auth.passwords.successfully_updated")
        }
      }
    end

    def render_update_error_unauthorized
      render json: {
        success: false,
        errors: ['Вы не авторизованны']
      }, status: 401
    end

    def render_update_error
      render json: {
        success: false,
        full_messages: @resource.errors.full_messages[0]
      }, status: 422
    end
end

DeviseTokenAuth::RegistrationsController.class_eval do
    def render_create_success
      render_user_as_json
      UserMailer.sucsess_registration(@resource).deliver
    end
    def render_update_success
      render_user_as_json
    end

    def render_user_as_json
      render json: {
        status: 'success',
        data: {
          name:   @resource.name,
          email:  @resource.email,
          avatar: @resource.avatar_id,
          rating: @resource.rating,
          weight: @resource.weight,
          growth: @resource.growth
        }
      }
    end

    def account_update_params
      params.permit([:name, :avatar_id, :rating, :weight, :growth, :password, :current_password])
    end

    def render_create_error
      render json: {
        status: 'error',
        full_messages: @resource.errors.full_messages[0]
      }, status: 403
    end
    def render_update_error
      render json: {
        status: 'error',
        full_messages: @resource.errors.full_messages[0]
      }, status: 403
    end
end


DeviseTokenAuth::SessionsController.class_eval do
    def render_create_success
      render json: {
        data: {
          name:   @resource.name,
          email:  @resource.email,
          avatar: @resource.avatar_id,
          rating: @resource.rating,
          weight: @resource.weight,
          growth: @resource.growth
        }
      }
    end
end