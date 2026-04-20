
CREATE DATABASE IF NOT EXISTS vital_choice;
USE vital_choice;
CREATE TABLE players (
    id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role TINYINT DEFAULT 0, -- 0=student,1=teacher,2=admin
    PRIMARY KEY (id)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
);
CREATE TABLE summary_status (
    player_id INT,
    total_games INT DEFAULT 0,
    best_score INT DEFAULT 0,
    longest_survival INT DEFAULT 0,
    wrong_answers INT DEFAULT 0,
    PRIMARY KEY (player_id),
    CONSTRAINT fk_summary_player
    FOREIGN KEY (player_id) REFERENCES players(id)
);
CREATE TABLE game_sessions (
    session_id INT AUTO_INCREMENT,
    player_id INT NOT NULL,
    current_day INT DEFAULT 1,
    health INT DEFAULT 20,
    status TINYINT DEFAULT 0, -- 0=playing,1=win,2=lose
    score INT DEFAULT 0,
    mode TINYINT DEFAULT 0, -- 0=random,1=exam
    exam_id INT NULL,
    PRIMARY KEY (session_id),
    CONSTRAINT fk_sessions_player
    FOREIGN KEY (player_id) REFERENCES players(id)
);
CREATE TABLE player_status (
    session_id INT,
    hunger INT DEFAULT 10,
    thirst INT DEFAULT 10,
    sickness INT DEFAULT 10,
    cold INT DEFAULT 10,
    hallucination INT DEFAULT 10,
    radio_count INT DEFAULT 0,
    PRIMARY KEY (session_id),
    CONSTRAINT fk_status_session
    FOREIGN KEY (session_id) REFERENCES game_sessions(session_id)
);

CREATE TABLE questions (
    question_id INT AUTO_INCREMENT,
    content TEXT NOT NULL,
    type TINYINT NOT NULL, -- 0=ABCD,1=TRUE_FALSE
    created_by INT,
    PRIMARY KEY (question_id),
    CONSTRAINT fk_questions_creator
    FOREIGN KEY (created_by) REFERENCES players(id)
);
CREATE TABLE answers (
    answer_id INT AUTO_INCREMENT,
    question_id INT NOT NULL,
    choice VARCHAR(5) NOT NULL, -- A/B/C/D hoặc T/F
    content TEXT NULL,
    is_correct BOOLEAN NOT NULL,
    explanation TEXT,
    PRIMARY KEY (answer_id),

    CONSTRAINT fk_answers_question
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT,
    exam_code VARCHAR(50) UNIQUE,
    teacher_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (exam_id),

    CONSTRAINT fk_exam_teacher
    FOREIGN KEY (teacher_id) REFERENCES players(id)
);
CREATE TABLE exam_questions (
    exam_id INT,
    question_id INT,
    PRIMARY KEY (exam_id, question_id),

    CONSTRAINT fk_eq_exam
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id),

    CONSTRAINT fk_eq_question
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);
CREATE TABLE history_answers (
    id INT AUTO_INCREMENT,
    session_id INT NOT NULL,
    question_id INT NOT NULL,
    answer_id INT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    day INT NOT NULL,
    exam_id INT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_history_session
    FOREIGN KEY (session_id) REFERENCES game_sessions(session_id),
    CONSTRAINT fk_history_question
    FOREIGN KEY (question_id) REFERENCES questions(question_id),
    CONSTRAINT fk_history_answer
    FOREIGN KEY (answer_id) REFERENCES answers(answer_id)
);
CREATE TABLE items (
    item_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (item_id)
);
CREATE TABLE session_items (
    session_id INT,
    item_id INT,
    quantity INT DEFAULT 0,
    PRIMARY KEY (session_id, item_id),

    CONSTRAINT fk_si_session
    FOREIGN KEY (session_id) REFERENCES game_sessions(session_id),

    CONSTRAINT fk_si_item
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);
CREATE TABLE events (
    event_id INT AUTO_INCREMENT,
    description TEXT,
    question_id INT,
    PRIMARY KEY (event_id),
    CONSTRAINT fk_event_question
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);
ALTER TABLE summary_status
DROP FOREIGN KEY fk_summary_player;

ALTER TABLE summary_status
ADD CONSTRAINT fk_summary_player
FOREIGN KEY (player_id) REFERENCES players(id)
ON DELETE CASCADE;

ALTER TABLE game_sessions
DROP FOREIGN KEY fk_sessions_player;

ALTER TABLE game_sessions
ADD CONSTRAINT fk_sessions_player
FOREIGN KEY (player_id)
REFERENCES players(id)
ON DELETE CASCADE;

ALTER TABLE player_status
DROP FOREIGN KEY fk_status_session;

ALTER TABLE player_status
ADD CONSTRAINT fk_status_session
FOREIGN KEY (session_id)
REFERENCES game_sessions(session_id)
ON DELETE CASCADE;

ALTER TABLE history_answers
DROP FOREIGN KEY fk_history_session;

ALTER TABLE history_answers
ADD CONSTRAINT fk_history_session
FOREIGN KEY (session_id)
REFERENCES game_sessions(session_id)
ON DELETE CASCADE;

ALTER TABLE session_items
DROP FOREIGN KEY fk_si_session;

ALTER TABLE session_items
ADD CONSTRAINT fk_si_session
FOREIGN KEY (session_id)
REFERENCES game_sessions(session_id)
ON DELETE CASCADE;

ALTER TABLE exam_questions
DROP FOREIGN KEY fk_eq_exam;

ALTER TABLE exam_questions
ADD CONSTRAINT fk_eq_exam
FOREIGN KEY (exam_id)
REFERENCES exams(exam_id)
ON DELETE CASCADE;
--Thay đổi các trường
ALTER TABLE session_items
DROP COLUMN quantity;

ALTER TABLE session_items
CHANGE x spawn_rate INT DEFAULT 0;

ALTER TABLE session_items
ADD is_available BOOLEAN DEFAULT FALSE;
ALTER TABLE answers
DROP FOREIGN KEY fk_answers_question;

ALTER TABLE answers
ADD CONSTRAINT fk_answers_question
FOREIGN KEY (question_id)
REFERENCES questions(question_id)
ON DELETE CASCADE;
ALTER TABLE answers
DROP FOREIGN KEY fk_answers_question;

ALTER TABLE answers
ADD CONSTRAINT fk_answers_question
FOREIGN KEY (question_id)
REFERENCES questions(question_id)
ON DELETE CASCADE;

ALTER TABLE exam_questions
DROP FOREIGN KEY fk_eq_question;

ALTER TABLE exam_questions
ADD CONSTRAINT fk_eq_question
FOREIGN KEY (question_id)
REFERENCES questions(question_id)
ON DELETE CASCADE;

ALTER TABLE events
DROP FOREIGN KEY fk_event_question;

ALTER TABLE events
ADD CONSTRAINT fk_event_question
FOREIGN KEY (question_id)
REFERENCES questions(question_id)
ON DELETE CASCADE;

ALTER TABLE history_answers
DROP FOREIGN KEY fk_history_question;

ALTER TABLE history_answers
ADD CONSTRAINT fk_history_question
FOREIGN KEY (question_id)
REFERENCES questions(question_id)
ON DELETE CASCADE;
