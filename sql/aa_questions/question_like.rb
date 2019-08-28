require_relative 'questions_database'

class QuestionLike
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT 
                * 
            FROM 
                question_likes
            WHERE 
            question_likes.id = :id
        SQL
        data.nil? ? nil : QuestionLike.new(data.pop)
    end

    def initialize(options)
        @id = options['id']
        @author_id = options['author_id']
        @question_id = options['question_id']
    end
end