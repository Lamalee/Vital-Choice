CREATE DATABASE quiz_game 
USE quiz_game;
CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role TINYINT DEFAULT 0, -- 0:user, 1:teacher, 2:admin
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    type TINYINT NOT NULL, -- 0: ABCD, 1: TRUE/FALSE
    created_by INT NULL,
    tag TINYINT NOT NULL, -- 0:dễ, 1:tb, 2:khó

    CONSTRAINT fk_questions_creator
        FOREIGN KEY (created_by)
        REFERENCES players(id)
        ON DELETE SET NULL
);
CREATE TABLE answers (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    choice VARCHAR(5) NOT NULL, -- A,B,C,D hoặc T,F
    content TEXT,
    is_correct TINYINT(1) NOT NULL,
    explanation TEXT,

    CONSTRAINT fk_answers_question
        FOREIGN KEY (question_id)
        REFERENCES questions(question_id)
        ON DELETE CASCADE
);
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    question_id INT,

    CONSTRAINT fk_event_question
        FOREIGN KEY (question_id)
        REFERENCES questions(question_id)
        ON DELETE CASCADE
);
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_code VARCHAR(50) UNIQUE,
    teacher_id INT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_exam_teacher
        FOREIGN KEY (teacher_id)
        REFERENCES players(id)
        ON DELETE SET NULL
);
CREATE TABLE exam_questions (
    exam_id INT,
    question_id INT,
    PRIMARY KEY (exam_id, question_id),
    CONSTRAINT fk_eq_exam
        FOREIGN KEY (exam_id)
        REFERENCES exams(exam_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_eq_question
        FOREIGN KEY (question_id)
        REFERENCES questions(question_id)
        ON DELETE CASCADE
);
CREATE TABLE game_sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    current_day INT DEFAULT 1,
    health INT DEFAULT 20,
    status TINYINT DEFAULT 0,
    score INT DEFAULT 0,
    mode TINYINT DEFAULT 0,
    exam_id INT NULL,
    CONSTRAINT fk_sessions_player
        FOREIGN KEY (player_id)
        REFERENCES players(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_sessions_exam
        FOREIGN KEY (exam_id)
        REFERENCES exams(exam_id)
        ON DELETE SET NULL
);
CREATE TABLE player_status (
    session_id INT PRIMARY KEY,
    hunger INT DEFAULT 15,
    thirst INT DEFAULT 5,
    sickness INT DEFAULT 15,
    cold INT DEFAULT 20,
    hallucination INT DEFAULT 20,
    radio_count INT DEFAULT 0,

    CONSTRAINT fk_status_session
        FOREIGN KEY (session_id)
        REFERENCES game_sessions(session_id)
        ON DELETE CASCADE
);

CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
);
CREATE TABLE session_items (
    session_id INT,
    item_id INT,
    spawn_rate INT DEFAULT 0,
    is_available TINYINT(1) DEFAULT 0,
    PRIMARY KEY (session_id, item_id),

    CONSTRAINT fk_si_session
        FOREIGN KEY (session_id)
        REFERENCES game_sessions(session_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_si_item
        FOREIGN KEY (item_id)
        REFERENCES items(item_id)
);
CREATE TABLE history_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT NOT NULL,
    question_id INT NOT NULL,
    answer_id INT NOT NULL,
    is_correct TINYINT(1) NOT NULL,
    day INT NOT NULL,
    exam_id INT NULL,

    CONSTRAINT fk_history_session
        FOREIGN KEY (session_id)
        REFERENCES game_sessions(session_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_history_question
        FOREIGN KEY (question_id)
        REFERENCES questions(question_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_history_answer
        FOREIGN KEY (answer_id)
        REFERENCES answers(answer_id),

    CONSTRAINT fk_history_exam
        FOREIGN KEY (exam_id)
        REFERENCES exams(exam_id)
        ON DELETE SET NULL
);
CREATE TABLE summary_status (
    player_id INT PRIMARY KEY,
    total_games INT DEFAULT 0,
    best_score INT DEFAULT 0,
    longest_survival INT DEFAULT 0,
    wrong_answers INT DEFAULT 0,

    CONSTRAINT fk_summary_player
        FOREIGN KEY (player_id)
        REFERENCES players(id)
        ON DELETE CASCADE
);
ALTER TABLE questions 
ADD is_active TINYINT DEFAULT 1;
ALTER TABLE questions 
ADD deleted_at DATETIME NULL;
--UPDATE questions 
--SET is_active = 0, deleted_at = NOW()
--WHERE question_id = 1; //lenh xoa