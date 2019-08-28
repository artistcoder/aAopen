require_relative 'questions_database'

class Reply
    attr_accessor :id, :subject_question_id, :parent_reply, :reply_author_id, :body

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT 
                * 
            FROM 
                replies
            WHERE 
                replies.id = :id
        SQL
        data.nil? ? nil : Reply.new(data.pop)
    end

    def self.find_by_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, reply_author_id: user_id)
            SELECT * FROM replies WHERE replies.reply_author_id = :reply_author_id
        SQL
        data.nil? ? nil : data.map{|datum| Reply.new(datum)}
    end

    def self.find_by_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, subject_question_id: question_id)
            SELECT * FROM replies WHERE replies.subject_question_id = :subject_question_id
        SQL
        data.nil? ? nil : data.map{|datum| Reply.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @subject_question_id = options['subject_question_id']
        @parent_reply = options['parent_reply']
        @reply_author_id = options['reply_author_id']
        @body = options['body']
    end

    def author
        User.find_by_user_id(@reply_author_id)
    end

    def question
        Question.find_by_id(@subject_question_id)
    end

    def parent_reply
        @parent_reply.nil? ? nil : Reply.find_by_id(@parent_reply)
    end

    def child_replies
        #need to look for all replys where parent reply id = current id
        data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT * FROM replies WHERE replies.parent_reply = :id
        SQL

        data.empty? ? nil : data.map{|datum| Reply.new(datum)}

    end

end
