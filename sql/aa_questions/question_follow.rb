require_relative 'questions_database'

class QuestionFollow
    attr_accessor :id, :author_id, :question_id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT 
                * 
            FROM 
                question_follows 
            WHERE 
                question_follows.id = :id
        SQL
        data.nil? ? nil : QuestionFollow.new(data.pop)
    end

    def initialize(options)
        @id = options['id']
        @author_id = options['author_id']
        @question_id = options['question_id']
    end
end