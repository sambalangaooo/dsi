CREATE TABLE tbl_users (
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_username VARCHAR(60) NOT NULL,
    user_password CHAR(60) NOT NULL,
    user_email VARCHAR(60) NOT NULL,
    user_firstname VARCHAR(60) NOT NULL,
    user_lastname VARCHAR(60) NOT NULL,
    user_birthdate DATE NOT NULL,
    user_token VARCHAR(64) NOT NULL,
    user_medical_info TEXT NOT NULL,
    user_emergency_contacts TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tbl_recommendation (
    recommendation_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    recommendation_range ENUM("0-23%", "23-100%", "Above 100%") NOT NULL,
    medconditions_status ENUM("No", "Yes") NOT NULL,
    recommendation_status ENUM("Insufficient", "Normal", "Dangerous") NOT NULL,
    advice TEXT NOT NULL
);

CREATE TABLE tbl_beverage (
    beverage_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    beverage_name ENUM("Powdered Juice", "Natural Juice", "Sugar-Water Concentration") NOT NULL
);

CREATE TABLE tbl_consumption (
    consumption_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) UNSIGNED NOT NULL,
    beverage_id TINYINT UNSIGNED NOT NULL,
    measured_sugar FLOAT NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES tbl_users(user_id),
    FOREIGN KEY (beverage_id) REFERENCES tbl_beverage(beverage_id)
);
