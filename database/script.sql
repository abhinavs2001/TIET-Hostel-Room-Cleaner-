CREATE TABLE `student` (
	`rollnumber` INT NOT NULL ,
    `password` varchar(40) NOT NULL,
    `room` varchar(8) NOT NULL,
    `floor` TINYINT NOT NULL,
	`hostel` varchar(255) NOT NULL,
	PRIMARY KEY (`rollnumber`)
);

CREATE TABLE `housekeeper` (
	`worker_id` INT NOT NULL ,
    `name` varchar(30) NOT NULL,
    `hostel` varchar(5) NOT NULL,
    `floor` TINYINT NOT NULL,
	`rooms_cleaned` INT NOT NULL,
     `complaints` TINYINT NOT NULL,
	PRIMARY KEY (`worker_id`)
);
CREATE TABLE `feedback` (
	`feedback_id` INT NOT NULL ,
    `rollnumber` INT NOT NULL,
   `request_id` INT NOT NULL,
    `rating` TINYINT NOT NULL,
	`timein` TIME NOT NULL,
    `timeout` TIME NOT NULL,
	PRIMARY KEY (`feedback_id`)
);

CREATE TABLE `complaints` (
	`complaint_id` INT NOT NULL ,
    `feedback_id` INT NOT NULL,
    `rollnumber` INT NOT NULL,
   `complaint` varchar(200) NOT NULL,
	PRIMARY KEY (`complaint_id`)
);
CREATE TABLE `admin` (
	`admin_id` INT NOT NULL ,
    `username` varchar(30) NOT NULL,
    `password` varchar(30) NOT NULL,
	`hostel` varchar(5) NOT NULL,
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE `cleanrequest` (
	`request_id` INT NOT NULL ,
    `rollnumber` INT NOT NULL,
    `worker_id` INT NOT NULL,
    `date` DATE NOT NULL,
	`cleaningtime` TIME NOT NULL,
    `req_status` BOOLEAN NOT NULL,
	PRIMARY KEY (`request_id`)
);

CREATE TABLE `suggestions` (
	`suggestion_id` INT NOT NULL ,
    `feedback_id` INT NOT NULL,
    `rollnumber` INT NOT NULL,
    `suggestion` varchar(200) NOT NULL,
	PRIMARY KEY (`suggestion_id`)
);


ALTER TABLE `feedback` ADD CONSTRAINT `tests_fk0` FOREIGN KEY (`rollnumber`) REFERENCES `student`(`rollnumber`);
ALTER TABLE `feedback` ADD CONSTRAINT `tests_fk1` FOREIGN KEY (`request_id`) REFERENCES `cleanrequest`(`request_id`);
ALTER TABLE `complaints` ADD CONSTRAINT `tests_fk0` FOREIGN KEY (`feedback_id`) REFERENCES `feedback`(`feedback_id`);
ALTER TABLE `complaints` ADD CONSTRAINT `tests_fk1` FOREIGN KEY (`rollnumber`) REFERENCES `student`(`rollnumber`);
ALTER TABLE `cleanrequest` ADD CONSTRAINT `tests_fk0` FOREIGN KEY (`rollnumber`) REFERENCES `student`(`rollnumber`);
ALTER TABLE `cleanrequest` ADD CONSTRAINT `tests_fk1` FOREIGN KEY (`worker_id`) REFERENCES `housekeeper`(`worker_id`);
ALTER TABLE `suggestions` ADD CONSTRAINT `tests_fk0` FOREIGN KEY (`rollnumber`) REFERENCES `student`(`rollnumber`);
ALTER TABLE `suggestions` ADD CONSTRAINT `tests_fk1` FOREIGN KEY (`feedback_id`) REFERENCES `feedback`(`feedback_id`);
