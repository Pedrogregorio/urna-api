class Api::V1::Candidates::CandidatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @candidates = Candidate.all
    render json: { candidates: @candidates }
  end

  def show
  end

  def create
    candidates = Candidate::Create.call(candidate_params: candidate_params)
    return render json: { errors: candidates.result.errors.full_messages }, status: :unprocessable_entity if candidates.result.errors.present?
    render json: candidates.result
  end

  private

  def candidate_params
    params.permit(:name, :code, :city, :state, :category)
  end
end
