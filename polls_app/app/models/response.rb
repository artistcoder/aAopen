class Response < ApplicationRecord
    validate :not_duplicate_response, :poll_creator_cannot_answer

    belongs_to :respondent,
    class_name: :User,
    foreign_key: :respondent_id,
    primary_key: :id

    belongs_to :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id

    has_one :question,
    through: :answer_choice,
    source: :question

    def sibling_responses
        question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
        sibling_responses.exists?(respondent_id: self.respondent_id)
    end

    private
    def not_duplicate_response
        if respondent_id != nil && respondent_already_answered?
            errors[:response] << 'is a duplicate response'
        end
    end

    def poll_creator_cannot_answer
        if respondent_id != nil && answer_choice.question.poll.author.id == respondent_id
            errors[:author] << 'cannot answer the poll'
        end

    end



end
