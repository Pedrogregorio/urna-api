class Candidate::Create < BusinessProcess::Base
  needs :candidate_params

  steps :create_candidate_on_db

  def call
    process_steps
    @candidate
  end

  private

  def create_candidate_on_db
    @candidate = Candidate.create(candidate)
  end

  def candidate
    name_image = candidate_params[:name].split(' ')[0]  
    {
      name: candidate_params[:name],
      code: candidate_params[:code],
      category: candidate_params[:category],
      city: candidate_params[:city],
      state: candidate_params[:state],
      photo: "https://avatars.dicebear.com/api/open-peeps/#{name_image}.svg"
    }
  end
end