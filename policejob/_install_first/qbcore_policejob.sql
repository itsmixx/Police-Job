CREATE TABLE IF NOT EXISTS `policejob_arrests` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `citizenid` VARCHAR(255) NOT NULL,
  `arrested_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `released_at` DATETIME DEFAULT NULL,
  `arrest_duration` INT NOT NULL,
  `status` ENUM('arrested', 'released') NOT NULL DEFAULT 'arrested'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Example for inserting an arrest record
-- INSERT INTO `policejob_arrests` (citizenid, arrest_duration) VALUES ('steam:1234567890', 300);
