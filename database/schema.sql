/*
========================================
SISTEMA DE PRODUTIVIDADE - LK SOLUÇÕES DE T.I
DATABASE SCHEMA
========================================
*/

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";



/*
========================================
USERS
========================================
*/

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    plan VARCHAR(50) DEFAULT 'free',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



/*
========================================
KANBAN TASKS
========================================
*/

CREATE TABLE kanban_tasks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    priority VARCHAR(20),
    status VARCHAR(20) DEFAULT 'todo',
    due_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
PLANNER TASKS
========================================
*/

CREATE TABLE planner_tasks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200),
    description TEXT,
    task_date DATE,
    task_time TIME,
    priority VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
CALENDAR EVENTS
========================================
*/

CREATE TABLE calendar_events (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200),
    description TEXT,
    event_date DATE,
    event_time TIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
SWOT ANALYSIS
========================================
*/

CREATE TABLE swot_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type VARCHAR(20), 
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
5W2H
========================================
*/

CREATE TABLE fivew2h (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    what TEXT,
    why TEXT,
    where TEXT,
    when_date DATE,
    who TEXT,
    how TEXT,
    how_much TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
NOTES
========================================
*/

CREATE TABLE notes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200),
    content TEXT,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
FLASHCARDS
========================================
*/

CREATE TABLE flashcards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    question TEXT,
    answer TEXT,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
POMODORO SESSIONS
========================================
*/

CREATE TABLE pomodoro_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    duration INTEGER,
    type VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);



/*
========================================
NOTIFICATIONS
========================================
*/

CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    message TEXT,
    read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE
);