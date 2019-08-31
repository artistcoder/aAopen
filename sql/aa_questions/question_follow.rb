require_relative 'questions_database'
require_relative 'user'

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

    def self.followers_for_question_id(question_id)
        followers = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)
            SELECT users.* FROM question_follows
            JOIN users ON question_follows.author_id = users.id 
            WHERE 
                question_follows.question_id = :question_id
        SQL
        followers.empty? ? nil : followers.map{|user_data| User.new(user_data)}
    end

    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id: user_id)
            SELECT questions.* FROM question_follows
            JOIN questions ON question_follows.question_id = questions.id 
            WHERE 
                question_follows.author_id = :author_id
        SQL
        questions.empty? ? nil : questions.map{|question_data| Question.new(question_data)}
    end

    def self.most_followed_questions(n)
        n_questions = QuestionsDatabase.instance.execute(<<-SQL, n: n)
            SELECT question_id, COUNT(author_id) AS num_of_followers
            FROM question_follows
            JOIN users ON question_follows.author_id = users.id 
            GROUP BY question_id
            ORDER BY num_of_followers DESC
            LIMIT n
        SQL
    end



    def initialize(options)
        @id = options['id']
        @author_id = options['author_id']
        @question_id = options['question_id']
    end
end