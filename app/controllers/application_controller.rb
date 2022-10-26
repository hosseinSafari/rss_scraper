class ApplicationController < ActionController::API

  # Rescue actions
  #
  #
  rescue_from ::AuthenticationError do |_exception|
    errors_messages = [I18n.t('messages.authentication.unauthorized')]
    render json: errors_messages, status: :unauthorized
  end

  rescue_from ::ArgumentError do |_exception|
    errors_messages = [_exception.message]
    render json: errors_messages, status: :bad_request
  end

  rescue_from ::JWT::VerificationError do |_exception|
    errors_messages = [I18n.t('messages.authentication.unauthorized')]
    render json: errors_messages, status: :unauthorized
  end

  rescue_from ::JWT::DecodeError do |_exception|
    errors_messages = [I18n.t('messages.authentication.unauthorized')]
    render json: errors_messages, status: :unauthorized
  end

  rescue_from ::ActiveRecord::RecordNotUnique do |exception|
    errors_messages = [exception.message.sub(/ \[[^\]]*\]/, '')]
    render json: errors_messages, status: :conflict
  end

  rescue_from ::ActiveRecord::RecordInvalid do |exception|
    errors_messages = [exception.message.sub(/ \[[^\]]*\]/, '')]
    render json: errors_messages, status: :bad_request
  end

  rescue_from ::ActiveRecord::RecordNotFound do |exception|
    errors_messages = [exception.message.sub(/ \[[^\]]*\]/, '')]
    render json: errors_messages, status: :not_found
  end

  protected

  def authenticate_me

  end

  private

  def auth
    # JwtAuthorization.decode(token) if token.present?
  end

  def token
    request.env['HTTP_AUTHORIZATION']&.split(' ')&.flatten&.last
  end
end
