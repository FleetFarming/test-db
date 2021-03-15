DROP TABLE IF EXISTS `useraccount`;

CREATE TABLE `accounts` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `confirmed` TinyInt(1) DEFAULT 0,
  PRIMARY KEY (`user_id`)
);

CREATE TABLE `photos` (
  `photo_id` INT NOT NULL AUTO_INCREMENT,
  `photo_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
);

CREATE TABLE `addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `lat` VARCHAR(20) DEFAULT NULL,
  `lng` VARCHAR(20) DEFAULT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `phone_no` VARCHAR (20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  FOREIGN KEY (`user_id`) REFERENCES `accounts` (`user_id`)
);

CREATE TABLE `farms` (
  `farm_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `farm_name` varchar(40) DEFAULT NULL,
  `start_date` varchar(20) DEFAULT NULL,
  `farm_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`farm_id`)
);

CREATE TABLE `crops` (
  `crop_id` INT NOT NULL AUTO_INCREMENT,
  `crop_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`crop_id`)
);
INSERT INTO crops(crop_name)
  VALUES('Potato');
INSERT INTO crops(crop_name)
  VALUES('Carrots');


CREATE TABLE `farm_crop` (
  `farm_id` INT NOT NULL,
  `crop_id` INT NOT NULL,
  FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`),
  FOREIGN KEY (`crop_id`) REFERENCES `crops` (`crop_id`)
);

CREATE TABLE `profiledata` (
  `profile_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `farm_id`  INT NOT NULL,
  `address_id` INT NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `profile_name` VARCHAR(50) DEFAULT NULL,
  `is_private` TINYINT(1) DEFAULT 1,
  `firstName` VARCHAR(20) DEFAULT NULL,
  `lastName` VARCHAR(30) DEFAULT NULL,
  `account_date` VARCHAR(20) DEFAULT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `accounts` (`user_id`),
  FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`),
  PRIMARY KEY (`profile_id`)
);

CREATE TABLE `messages` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `sender_id` INT NOT NULL,
  `recipient_id` INT NOT NULL,
  `send_date` VARCHAR(50),
  `message` VARCHAR(500),
  `sender_name` VARCHAR(50),
  `recipient_name` VARCHAR(50),
  `conversation_id` INT NOT NULL,
  `subject` VARCHAR(50),
  PRIMARY KEY (`message_id`)
);

CREATE TABLE `conversation` (
  `conversation_id` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(50),
  `sender_name` VARCHAR(50),
  `recipient_name` VARCHAR(50),
  PRIMARY KEY (`conversation_id`)
);

CREATE TABLE `farm_layout` (
  `layout_id` INT NOT NULL AUTO_INCREMENT,
  `farm_id` INT NOT NULL,
  `groupX` VARCHAR(30),
  `groupY` VARCHAR(30),
  `shapeType` VARCHAR(30),
  `shapeX` VARCHAR(30),
  `shapeY` VARCHAR(30),
  `shapeScaleX` VARCHAR(30),
  `shapeScaleY` VARCHAR(30),
  `shapeWidth` VARCHAR(30),
  `shapeHeight` VARCHAR(30),
  `shapeRotation` VARCHAR(30),
  `text` VARCHAR(30),
  `textX` VARCHAR(30),
  `textY` VARCHAR(30),
  `textRotation` VARCHAR(30),
  `textScaleX` VARCHAR(30),
  `textScaleY` VARCHAR(30),
  `radius` VARCHAR(30),
  FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`),
  PRIMARY KEY (`layout_id`)
);
