CREATE TABLE Specialization(
  name VARCHAR(50) PRIMARY KEY
);
 
CREATE TABLE Student (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  native_language varchar(5),
  takes VARCHAR(50) REFERENCES Specialization(name)
);

CREATE TABLE Course (
  name VARCHAR(50) PRIMARY KEY,
  credits INTEGER
);

CREATE TABLE Enrol (
  id INTEGER Not NULL, 
  name VARCHAR(50) Not NULL,
  PRIMARY KEY(id, name),
  FOREIGN KEY(id) references Student(id),
  FOREIGN KEY (name) references Course(name)
);

INSERT INTO `Specialization` (`name`) VALUES
  ('Robotics'),
  ('Computer science');
 
INSERT INTO `Student` (`id`, `name`, `native_language`, `takes`) VALUES
  ('1', 'Anatoliy', 'RU', 'Computer science'),
  ('2', 'Oleg', 'RU', 'Computer science'),
  ('3', 'Semen', 'RU', 'Computer science'),
  ('4', 'Evgeniy', 'RU', 'Computer science'),
  ('5', 'Kein', 'EN', 'Computer science'),
  ('6', 'Sovet', 'FR', 'Robotics'),
  ('7', 'Colett', 'EN', 'Robotics'),
  ('8', 'Greg', 'RU', 'Robotics'),
  ('9', 'Tim', 'FR', 'Robotics'),
  ('10', 'Sergey', 'RU', 'Robotics'),
  ('11', 'Stas', 'EN', 'Robotics');
  
INSERT INTO `Course` (`name`, `credits`) VALUES
  ('Introduction to AI', '3'),
  ('Netvorks', '3'),
  ('System and network administration', '5');

INSERT INTO `Enrol`(`id`, `name`) VALUES 
  (1, 'Introduction to AI'), 
  (2, 'System and network administration'), 
  (11, 'Networks');


#a
SELECT `id`, `name`
  FROM `Student`
  WHERE `id` <= 10

#b
SELECT `name`
  FROM `Student`
  WHERE `native_language` != 'RU'

#c
SELECT `name`
  FROM `Student`
  WHERE `takes` = 'Robotics'

