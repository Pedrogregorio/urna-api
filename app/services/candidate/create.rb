class Candidate::Create < BusinessProcess::Base
  needs :candidate_params

  steps :create_candidate_on_db

  def call
    process_steps
    @candidate
  end

  private

  def create_candidate_on_db
    @candidate = candidate.create(candidate)
  end

  def candidate
    {
      name: candidate_params[:name],
      code: candidate_params[:code],
      category: candidate_params[:category],
      city: candidate_params[:city],
      state: candidate_params[:state],
      photo: `https://avatars.dicebear.com/api/open-peeps/#{candidate_params[:name]}.svg`
    }
  end
end