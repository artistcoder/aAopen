class Question < ApplicationRecord
    validates :text, presence: true, uniqueness: true

    belongs_to :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id

    has_many :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id

    has_many :responses,
    through: :answer_choices,
    source: :responses

    def results
        # returns a hash of choices and counts

        results = self.answer_choices.includes(:responses)
        result_hash = {}

        results.each do |result|
            result_hash[result.text] = result.responses.length
        end
        result_hash
        # result_hash = {}
        # answer_choices.each do |answer_choice|
        #     result_hash[answer_choice.text] = answer_choice.responses.length
        # end
        # result_hash
    end

    def result_sql
        Question.find_by_sql(<<-SQL)
            SELECT
                answer_choices.text, COUNT(responses.id)
            FROM
                answer_choices
            LEFT OUTER JOIN
                responses ON 
            LEFT OUTER JOIN
                question ON question.id = answer_choices.question_id
            GROUP BY
                answer_choice.id
            WHERE
                question.id = ?

        SQL
    end


end