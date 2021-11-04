class Api::V1::Votes::VotesController < Api::ApiController
  def create
    user = User.find_by(cpf: user_params[:cpf], voter_registration: user_params[:voter_registration])
    return render json: { errors: ["Usuario não emcontrado"] }, status: :unauthorized unless user.present?
    service_vote = Vote::Create.call(user: user, votes: vote_params)
    json: { errors: [service_vote.error] }, status: :unprocessable_entity if service_vote.error.present?
    render json: {}, status: :ok
  end

  def user_params
    params.fetch(:user)
  end

  def vote_params
    params.fetch(:votes)
  end
end
