require_relative 'questions_database'
require_relative 'question'
require_relative 'question_follow'

class User
    attr_accessor :id, :fname, :lname
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT
                * 
            FROM 
                users 
            WHERE 
                users.id = :id
        SQL
        # data is an array, containing a single hash
        # pop the data to obtain standalone hash
        data.empty? ? nil : User.new(data.pop)
    end

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname: fname, lname: lname)
            SELECT * FROM users WHERE users.fname = :fname AND users.lname = :lname
        SQL
        data.empty? ? nil : User.new(data.pop)
    end

    def initialize(options)
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end

    def authored_questions
        Question.find_by_author_id(@id)
    end

    def authored_replies
        Reply.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(@id)
    end
end