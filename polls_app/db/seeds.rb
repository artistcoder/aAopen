# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    User.destroy_all
    Poll.destroy_all
    Question.destroy_all
    AnswerChoice.destroy_all
    Response.destroy_all

    jenna = User.create!(username: 'jennalee')
    jesse = User.create!(username: 'jessefur')
    henry = User.create!(username: 'hpo')
    sherlock = User.create!(username: 'sherbie') 

    poll1 = Poll.create!(title: "Dinner", author: henry)

    q1 = Question.create!(text: "Where to eat?", poll: poll1)
    ac1 = AnswerChoice.create!(text: "Thai Farmhouse", question: q1)
    ac2 = AnswerChoice.create!(text: "India House", question: q1)
    ac9 = AnswerChoice.create!(text: "Pizza Palace", question: q1)

    poll2 = Poll.create!(title: "San Francisco", author: jenna)
    q2 = Question.create!(text: "Where to live?", poll: poll2)
    ac3 = AnswerChoice.create!(text: "Inner Sunset", question: q2)
    ac4 = AnswerChoice.create!(text: "Albany", question: q2)
    ac5 = AnswerChoice.create!(text: "Cole Valley", question: q2)

    q3 = Question.create!(text: "How to commute?", poll: poll2)
    ac6 = AnswerChoice.create!(text: "Car", question: q3)
    ac7 = AnswerChoice.create!(text: "Bike", question: q3)
    ac8 = AnswerChoice.create!(text: "BART", question: q3)

    r1 = Response.create!(respondent: jenna,  answer_choice: ac3)
    r2 = Response.create!(respondent: jesse,  answer_choice: ac9)
    r3 = Response.create!(respondent: henry,  answer_choice: ac3)
    r4 = Response.create!(respondent: sherlock, answer_choice:ac8 )

end
