class User::Create < BusinessProcess::Base
  needs :user_params

  steps :create_user_on_db

  def call
    process_steps
    @user
  end

  private

  def create_user_on_db
    @user = User.create(user)
  end

  def user
    {
      name: user_params[:name],
      age: user_params[:age],
      voter_registration: user_params[:voter_registration],
      cpf: user_params[:cpf],
      city: user_params[:city],
      state: user_params[:state],
      voted: false
    }
  end
end