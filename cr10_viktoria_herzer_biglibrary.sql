-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2018 at 09:22 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_viktoria_herzer_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `first_name`, `last_name`) VALUES
(1, 'Coldplay', ''),
(2, 'Michael ', 'Jackson'),
(3, 'AC/DC', ''),
(4, 'Pink', 'Floyd'),
(5, 'Whitney', 'Houston'),
(6, 'Eagles', ''),
(7, 'Shania', 'Twain'),
(8, 'Led', 'Zeppelin'),
(9, 'Celine', 'Dion'),
(10, 'The Beatles', '');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'Leo ', 'Tolstoy'),
(2, 'Gustave ', 'Flaubert'),
(3, 'F. Scott', 'Fitzgerald'),
(4, 'Vladimir', 'Nabokov'),
(5, 'George', 'Eliot'),
(6, 'Mark', 'Twain'),
(7, 'Marcel', 'Proust'),
(8, 'Bernhard', 'Schlink'),
(9, 'Herman', 'Melville');

-- --------------------------------------------------------

--
-- Table structure for table `big_library`
--

CREATE TABLE `big_library` (
  `big_library_id` int(11) NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_cds_id` int(11) DEFAULT NULL,
  `fk_books_id` int(11) DEFAULT NULL,
  `fk_dvds_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `books_id` int(11) NOT NULL,
  `fk_author_id` int(11) NOT NULL,
  `fk_publisher_id` int(11) NOT NULL,
  `ISBN_code` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `publish_date` date DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`books_id`, `fk_author_id`, `fk_publisher_id`, `ISBN_code`, `title`, `publish_date`, `type`, `image`, `description`) VALUES
(1, 1, 8, '098a0980', 'Anna Karenina', '1877-00-00', 'Book', 'anna.jpg', 'Realist Novel'),
(2, 2, 9, '09s80809', 'Madame Bovary', '1856-00-00', 'Book', 'bovary.jpg', 'Realist Novel'),
(3, 1, 8, '098098s0980', 'War and Peace', '1865-00-00', 'Book', 'warandpeace.jpg', 'Novel'),
(4, 3, 7, '098098s0898', 'The Great Gatsby', '1925-04-10', 'Book', 'gatsby.jpg', 'Novel'),
(5, 4, 6, '98908s098', 'Lolita', '1955-00-00', 'Book', 'lolita.jpg', 'Novel'),
(6, 5, 5, '7978s9879', 'Middlemarch', '1871-00-00', 'Book', 'eliot.jpg', 'Novel'),
(7, 6, 4, '98790s7078', 'Huckleberry Finn', '1884-12-10', 'Book', 'finn.jpg', 'Novel'),
(8, 7, 3, '234234d234', 'In Search of Lost Time', '1922-00-00', 'Book', 'proust.jpg', 'Modernist'),
(9, 8, 2, '09890v09809', 'The Reader', '1995-00-00', 'Book', 'reader.jpg', 'Novel'),
(10, 9, 1, '9790s90809', 'Moby Dick', '1851-10-18', 'Book', 'moby.jpg', 'Novel');

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE `cds` (
  `cds_id` int(11) NOT NULL,
  `fk_artist_id` int(11) NOT NULL,
  `fk_record_label_id` int(11) NOT NULL,
  `ISBN_code` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `release_date` date DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`cds_id`, `fk_artist_id`, `fk_record_label_id`, `ISBN_code`, `title`, `release_date`, `type`, `image`, `description`) VALUES
(1, 1, 1, '123d123d', 'X & Y', '2005-06-06', 'CD', 'x&y.jpg', 'Alternative Rock'),
(2, 2, 2, '2342j3342j', 'Thriller', '1982-11-30', 'CD', 'thriller.jpg', 'Pop'),
(3, 3, 3, '98098s89808', 'Back in Black', '1980-07-25', 'CD', 'back_in_black.jpg', 'Hard Rock'),
(4, 6, 6, '9879s987', 'Their Greatest Hits', '1976-02-17', 'CD', 'eagles.jpg', 'Rock'),
(5, 4, 4, '97987s8987', 'The Dark Side of the Moon', '1973-03-01', 'CD', 'floyd.jpg', 'Progressive Rock'),
(6, 5, 5, '98787s9879', 'The Bodyguard: Soundtrack', '1992-11-17', 'CD', 'houston.jpg', 'Pop'),
(7, 7, 7, '089w098', 'Come on Over', '1997-11-04', 'CD', 'twain.jpg', 'Country'),
(8, 8, 8, '09899s09809', 'Led Zeppelin IV', '1971-11-08', 'CD', 'zeppelin.jpg', 'Hard Rock'),
(9, 9, 9, '876786s768', 'Falling into You', '1996-03-08', 'CD', 'celine.jpg', 'Pop'),
(10, 10, 1, '97s00979', 'Help!', '1965-08-06', 'CD', 'beatles.jpg', 'Pop Rock');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `director_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`director_id`, `first_name`, `last_name`) VALUES
(1, 'Francis Ford ', 'Coppola'),
(2, 'Frank', 'Darabont'),
(3, 'Steven ', 'Spielberg'),
(4, 'Martin', 'Scorsese'),
(5, 'Michael ', 'Curtiz'),
(6, 'Orson', ' Welles'),
(7, 'Victor', 'Fleming'),
(8, 'Aaron', 'Sorkin'),
(9, 'George', 'Lucas');

-- --------------------------------------------------------

--
-- Table structure for table `dvds`
--

CREATE TABLE `dvds` (
  `dvds_id` int(11) NOT NULL,
  `fk_director_id` int(11) NOT NULL,
  `fk_production_company_id` int(11) NOT NULL,
  `ISBN_code` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `release_date` date DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dvds`
--

INSERT INTO `dvds` (`dvds_id`, `fk_director_id`, `fk_production_company_id`, `ISBN_code`, `title`, `release_date`, `type`, `image`, `description`) VALUES
(1, 9, 9, '264524k334', 'Star Wars Episode III', '2005-05-15', 'DVD', 'starwars.jpg', 'Sci-Fi'),
(2, 8, 8, '08787s0887', 'Molly\'s Game', '2017-09-08', 'DVD', 'molly.jpg', 'Thriller'),
(3, 7, 7, '09808s9009', 'The Wizard of Oz', '1939-08-25', 'DVD', 'oz.jpg', 'Fantasy'),
(4, 7, 7, '098098s080', 'Gone with the Wind', '1939-12-15', 'DVD', 'wind.jpg', 'Drama'),
(5, 6, 6, '9809s8098', 'Citizen Kane', '1941-04-01', 'DVD', 'kane.jpg', 'Drama'),
(6, 5, 5, '09890f09809', 'Casablanca', '1942-11-26', 'DVD', 'casablanca.jpg', 'Drama'),
(7, 4, 4, '0988b082', 'Raging Bull', '1980-11-14', 'DVD', 'bull.jpg', 'Drama'),
(8, 3, 3, '098098n098', 'Schindlers List', '1993-11-30', 'DVD', 'schindler.jpg', 'Drama'),
(9, 2, 2, '09809r098', 'The Shawshank Redemption', '1994-09-10', 'DVD', 'redemption.jpg', 'Drama'),
(10, 1, 1, '098098w089', 'The Godfather', '1972-03-15', 'DVD', 'godfather.jpg', 'Crime');

-- --------------------------------------------------------

--
-- Table structure for table `production_company`
--

CREATE TABLE `production_company` (
  `production_company_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `size` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `production_company`
--

INSERT INTO `production_company` (`production_company_id`, `name`, `address`, `size`) VALUES
(1, 'Afran Productions', 'USA', 'Small'),
(2, 'Castle Rock Entertainment', 'USA', 'Large'),
(3, 'Amblin Entertainment', 'USA', 'Large'),
(4, 'United Artists', 'USA', 'Large'),
(5, 'Warner Bros', 'USA', 'Large'),
(6, 'Mercury Productions ', 'USA', 'Large'),
(7, 'Metro Goldwyn Mayer', 'USA', 'Large'),
(8, 'The Mark Gordon Company', 'USA', 'Medium'),
(9, 'LucasFilm', 'USA', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `size` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `address`, `size`) VALUES
(1, 'Richard Bentley', 'UK', 'Small'),
(2, 'Vintage International', 'Germany', 'Small'),
(3, 'Graddet And Gallimard', 'France', 'Small'),
(4, 'Chatto & Windus', 'USA', 'Medium'),
(5, 'William Blackwood and Sons', 'UK', 'Large'),
(6, 'Olympia Press', 'France', 'Small'),
(7, 'Charles Scribner\'s Sons', 'USA', 'Large'),
(8, 'The Russian Messanger', 'Russia', 'Small'),
(9, 'Revue de Paris', 'France', 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `record_label`
--

CREATE TABLE `record_label` (
  `record_label_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `size` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `record_label`
--

INSERT INTO `record_label` (`record_label_id`, `name`, `address`, `size`) VALUES
(1, 'Parlophone', '123, internetstreet World', 'Large'),
(2, 'Epic', '23432 Internetstreet', 'Large'),
(3, 'Albert', '23123 Internetstreet', 'Large'),
(4, 'Harvest', '24532 internetstreet', 'Large'),
(5, 'Arista', '342332 internetstreet', 'Small'),
(6, 'Asylum', '24234 internetstreet', 'Medium'),
(7, 'Mercury', '87982 internetstreet', 'Small'),
(8, 'Atlantic', '98273 internetstreet', 'Large'),
(9, 'Columbia', '8092843 internetstreet', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `password`) VALUES
(1, 'Viki', 'v@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(2, 'vikkii', 'viki@gmail.com', '8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414'),
(3, 'Connor', 'con@gmail.com', '8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `big_library`
--
ALTER TABLE `big_library`
  ADD PRIMARY KEY (`big_library_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_cds_id` (`fk_cds_id`),
  ADD KEY `fk_books_id` (`fk_books_id`),
  ADD KEY `fk_dvds_id` (`fk_dvds_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`books_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`);

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
  ADD PRIMARY KEY (`cds_id`),
  ADD KEY `fk_artist_id` (`fk_artist_id`),
  ADD KEY `fk_record_label_id` (`fk_record_label_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`director_id`);

--
-- Indexes for table `dvds`
--
ALTER TABLE `dvds`
  ADD PRIMARY KEY (`dvds_id`),
  ADD KEY `fk_director_id` (`fk_director_id`),
  ADD KEY `fk_production_company_id` (`fk_production_company_id`);

--
-- Indexes for table `production_company`
--
ALTER TABLE `production_company`
  ADD PRIMARY KEY (`production_company_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `record_label`
--
ALTER TABLE `record_label`
  ADD PRIMARY KEY (`record_label_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `userEmail` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `big_library`
--
ALTER TABLE `big_library`
  MODIFY `big_library_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `books_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cds`
--
ALTER TABLE `cds`
  MODIFY `cds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `dvds`
--
ALTER TABLE `dvds`
  MODIFY `dvds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `production_company`
--
ALTER TABLE `production_company`
  MODIFY `production_company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `record_label`
--
ALTER TABLE `record_label`
  MODIFY `record_label_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `big_library`
--
ALTER TABLE `big_library`
  ADD CONSTRAINT `big_library_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `big_library_ibfk_2` FOREIGN KEY (`fk_cds_id`) REFERENCES `cds` (`cds_id`),
  ADD CONSTRAINT `big_library_ibfk_3` FOREIGN KEY (`fk_books_id`) REFERENCES `books` (`books_id`),
  ADD CONSTRAINT `big_library_ibfk_4` FOREIGN KEY (`fk_dvds_id`) REFERENCES `dvds` (`dvds_id`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Constraints for table `cds`
--
ALTER TABLE `cds`
  ADD CONSTRAINT `cds_ibfk_1` FOREIGN KEY (`fk_artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `cds_ibfk_2` FOREIGN KEY (`fk_record_label_id`) REFERENCES `record_label` (`record_label_id`);

--
-- Constraints for table `dvds`
--
ALTER TABLE `dvds`
  ADD CONSTRAINT `dvds_ibfk_1` FOREIGN KEY (`fk_director_id`) REFERENCES `director` (`director_id`),
  ADD CONSTRAINT `dvds_ibfk_2` FOREIGN KEY (`fk_production_company_id`) REFERENCES `production_company` (`production_company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
