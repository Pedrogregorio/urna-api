class Api::V1::Users::UsersController < Api::ApiController
  def create
    user = User::Create.call(user_params: user_params)
    return render json: { errors: user.result.errors.full_messages }, status: :unprocessable_entity if user.result.errors.present?
    render json: user.result
  end

  def user_params
    params.permit(:name, :age, :cpf)
  end
end
