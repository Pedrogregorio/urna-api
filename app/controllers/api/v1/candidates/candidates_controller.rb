class Api::V1::Candidates::CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
  end

  def create
    candidates = Candidate::Create.call(candidate_params: candidate_params)
  end

  private

  def candidate_params
    params.fetch(:candidate, {})
  end
end
