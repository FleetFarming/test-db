DROP TABLE IF EXISTS `useraccount`;

CREATE TABLE `accounts` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
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
  `farm_name` varchar(100) DEFAULT NULL,
  `start_date` varchar(10) DEFAULT NULL,
  `farm_type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`farm_id`)
);

CREATE TABLE `crops` (
  `crop_id` INT NOT NULL AUTO_INCREMENT,
  `crop_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`crop_id`)
);

CREATE TABLE `farm_crop` (
  `farm_id` INT NOT NULL,
  `crop_id` INT NOT NULL,
  FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`),
  FOREIGN KEY (`crop_id`) REFERENCES `crops` (`crop_id`)
);

CREATE TABLE `profiledata` (
  `profile_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `profile_name` VARCHAR(50) DEFAULT NULL,
  `is_private` TINYINT(1) DEFAULT 1,
  `firstName` VARCHAR(20) DEFAULT NULL,
  `lastName` VARCHAR(30) DEFAULT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `accounts` (`user_id`),
  FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  PRIMARY KEY (`profile_id`)
);