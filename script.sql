-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 19, 2020 at 10:26 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE IF NOT EXISTS `board` (
                                       `board_id` int NOT NULL AUTO_INCREMENT,
                                       `name` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`board_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`board_id`, `name`) VALUES
(1, 'CSM'),
(2, 'CSMB');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
                                       `grade_id` int NOT NULL AUTO_INCREMENT,
                                       `student` int NOT NULL,
                                       `grade` tinyint UNSIGNED NOT NULL,
                                       PRIMARY KEY (`grade_id`),
    KEY `student_idx` (`student`)
    ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`grade_id`, `student`, `grade`) VALUES
(1, 1, 6),
(2, 1, 7),
(3, 1, 8),
(4, 1, 9),
(5, 2, 7),
(6, 2, 7),
(7, 2, 8),
(8, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
                                         `student_id` int NOT NULL AUTO_INCREMENT,
                                         `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `board` int NOT NULL,
    PRIMARY KEY (`student_id`),
    KEY `board_idx` (`board`)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `first_name`, `last_name`, `board`) VALUES
(1, 'Pera', 'Perić', 1),
(2, 'Jovan', 'Jovanović', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
    ADD CONSTRAINT `student` FOREIGN KEY (`student`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
    ADD CONSTRAINT `board` FOREIGN KEY (`board`) REFERENCES `board` (`board_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
