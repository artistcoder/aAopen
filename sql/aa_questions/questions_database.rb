require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results
    end

end

class User
    def self.find_by_id(lookup_id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE id = lookup_id")
        Question.new(data)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
end

class Question
    def self.find_by_id(lookup_id)
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE id = lookup_id")
        Question.new(data)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

end

class QuestionFollow
end

class Reply
end

class QuestionLike
end