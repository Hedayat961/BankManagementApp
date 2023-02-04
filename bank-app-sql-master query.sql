CREATE TABLE `assignment1`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`role_id`));
  
  
  CREATE TABLE `assignment1`.`user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(256) NOT NULL,
  `password` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE
);

CREATE TABLE `assignment1`.user_role (
  user_id BIGINT NOT NULL,
  role_id INT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE TABLE `assignment1`.`log` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NULL,
  `operation` VARCHAR(256) NOT NULL,
  `user_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `assignment1`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `assignment1`.`employee` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  `salary` FLOAT NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `user_id` BIGINT NOT NULL,
  `username` varchar(100),
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_idd`
    FOREIGN KEY (`user_id`)
    REFERENCES `assignment1`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	
CREATE TABLE `assignment1`.`client` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
   `cnp` varchar(100) NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(500) NULL,
  PRIMARY KEY (`id`)
  );

CREATE TABLE `assignment1`.`account` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NOT NULL,
  `balance` FLOAT NULL,
  `date` DATE,
  `owner_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `owner`
    FOREIGN KEY (`owner_id`)
    REFERENCES `assignment1`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);  

insert into assignment1.role(role)values('ADMIN');
insert into assignment1.role(role)values('USER');

insert into assignment1.user(username,password) 
value('ali','$2a$10$3tdYU9ENJ8lS0peS3N267uxUmex4vJyUeHakFRPMYOdvZuDI7aDlO');

insert into assignment1.user_role(user_id,role_id) values(1,1);
