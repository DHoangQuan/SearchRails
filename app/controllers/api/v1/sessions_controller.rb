class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  # sign in
  def create
    # byebug
    if @user.valid_password?(sign_in_params.dig(:attributes)[:password])
      # sign_in "user", @user
      render json: {
        messages: "Signed In Successfully",
        is_success: true,
        data: {user: @user}
      }, status: :ok
    else
      render json: {
        messages: "Signed In Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  private
  def sign_in_params
    # byebug
    # params.require(:sign_in).permit :email, :password
    params.require(:data).permit(:attributes => [:email, :password, :password_confirmation])
  end

  def load_user
    # byebug
    @user = User.find_for_database_authentication(email: sign_in_params.dig(:attributes)[:email])
    byebug
    if @user
      return @user
    else
      render json: {
        messages: "Cannot get User",
        is_success: false,
        data: {}
      }, status: :failure
    end
  end
end