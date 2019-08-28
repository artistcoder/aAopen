DROP TABLE IF EXISTS question_tags;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users
(
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Jenna', 'Lumarie'),
    ('Jesse', 'Lumarie'),
    ('Patrick', 'Walker'),
    ('Siena', 'Harper'),
    ('Megan','Walker');

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('What is Life', 'How do we know if life is real?', 1),
    ('Hand Foot Mouth', 'When is this virus no longer contagious?', 1),
    ('Dinner', 'What is for dinner?', 4),
    ('Vacation', 'Will we be able to visit Chicago in January?', 2);

CREATE TABLE question_follows
(
    id INTEGER PRIMARY KEY,
    author_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO question_follows (author_id, question_id) VALUES (1, 1);
INSERT INTO question_follows (author_id, question_id) VALUES (1, 2);
INSERT INTO question_follows (author_id, question_id) VALUES (4, 3);


CREATE TABLE replies (
    id  INTEGER PRIMARY KEY,
    subject_question_id INTEGER,
    parent_reply INTEGER,
    reply_author_id INTEGER,
    body TEXT,
    FOREIGN KEY (subject_question_id) REFERENCES questions(id),
    FOREIGN KEY (reply_author_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id)
);

INSERT INTO replies (subject_question_id, parent_reply, reply_author_id, body) VALUES (1, NULL,2, "Jenna, go to bed");
INSERT INTO replies (subject_question_id, parent_reply, reply_author_id, body) VALUES (1, 1, 1, "I MUST KNOW!");


CREATE TABLE question_likes (
   id INTEGER PRIMARY KEY,
    author_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO question_likes (author_id, question_id) VALUES (3,1),(4,4);
