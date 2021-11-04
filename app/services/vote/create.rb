class Vote::Create < BusinessProcess::Base
  needs :user
  needs :votes

  steps :has_voted_all_category,
        :seach_candidates,
        :validate_vote_user,
        :validate_local,
        :create_vote
        
  def call
    process_steps
    @vote
  end

  def has_voted_all_category
    return fail("Usuario já votou em todas as categorias") if user.votes.length >= 6
  end

  def seach_candidates
    @candidate = Candidate.find_by(code: votes[:code], category: votes[:category])
    return fail("Candidato nao encontrado") unless @candidate.present? 
  end

  def validate_vote_user
    all_categorys_voted = user.votes.map { | vote | vote.candidate.category }
    return fail("Usuario ja votou nessa categoria") if all_categorys_voted.include?(@candidate.category)
  end

  def validate_local
    if @candidate.category === "governor"
      return fail("Candidato de um estado diferente") if @candidate.state != user.state  
    end
    if @candidate.category === "mayor"
      return fail("Candidato de uma cidade diferente") if @candidate.city != user.city
    end
  end

  def create_vote
    Vote.create(candidate: @candidate, user: user)
  end
end