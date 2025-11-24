CREATE DATABASE IF NOT EXISTS virtual_icu; 
USE virtual_icu; 

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    user_type ENUM('family', 'staff', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reset_token VARCHAR(64) NULL,
    reset_expires DATETIME NULL
);

CREATE TABLE patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    bed_number VARCHAR(20) NOT NULL,
    admission_date DATE NOT NULL,
    status ENUM('active', 'discharged') DEFAULT 'active',
    notes TEXT
);

CREATE TABLE visits (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visitor_id INT,
    visit_date DATETIME NOT NULL,
    status ENUM('scheduled', 'completed', 'cancelled') DEFAULT 'scheduled',
    meeting_link VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    FOREIGN KEY (visitor_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE daily_updates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    sender VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert sample data after all tables are created
INSERT INTO users (full_name, email, password, user_type) VALUES 
('Admin User', 'admin@hospital.com', '$2y$10$examplehash', 'admin'),
('Doctor Smith', 'doctor@hospital.com', '$2y$10$examplehash', 'staff'),
('Nurse Jane', 'nurse@hospital.com', '$2y$10$examplehash', 'staff');

INSERT INTO patients (full_name, bed_number, admission_date, status, notes) VALUES
('John Smith', 'ICU-101', '2024-01-15', 'active', 'Stable condition'),
('Mary Johnson', 'ICU-102', '2024-01-16', 'active', 'Recovering well');

INSERT INTO daily_updates (user_id, content) VALUES
(1, 'Patient is stable and recovering well.'),
(2, 'New medication prescribed.');

INSERT INTO messages (user_id, sender, content) VALUES
(1, 'Doctor Smith', 'Patient is responding well to treatment.'),
(2, 'Nurse Jane', 'Vitals are stable.');