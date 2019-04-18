CREATE SCHEMA `627089-yeticave` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `627089-yeticave`;


CREATE TABLE category (
  id INT AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,

  PRIMARY KEY (id)
);


CREATE TABLE user (
  id INT AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,
  email VARCHAR(64) NOT NULL,
  password VARCHAR(64) NOT NULL,
  contact VARCHAR(256) NOT NULL,
  dt_reg DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  avatar VARCHAR(64) DEFAULT NULL,

  PRIMARY KEY (id),
  CONSTRAINT user_unique UNIQUE (email)
);


CREATE TABLE lot (
  id INT AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL,
  description VARCHAR(256) NOT NULL,
  image VARCHAR(64) NOT NULL,
  dt_start DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_end DATETIME NOT NULL,
  price INT NOT NULL,
  increment INT NOT NULL,

  category_id INT NOT NULL,
  CONSTRAINT category_valid
  FOREIGN KEY fk_category (category_id)
    REFERENCES category (id),

  seller INT NOT NULL,
  CONSTRAINT seller_valid
  FOREIGN KEY fk_seller (seller)
    REFERENCES user (id),

  winner INT DEFAULT NULL,
  CONSTRAINT winner_valid
  FOREIGN KEY fk_winner (winner)
    REFERENCES user (id),

  PRIMARY KEY (id),
  INDEX (name, description)
);


CREATE TABLE bid (
  id INT AUTO_INCREMENT,
  amount INT NOT NULL,
  dt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  lot_id INT NOT NULL,
  CONSTRAINT lot_valid
  FOREIGN KEY fk_lot (lot_id)
    REFERENCES lot (id),

  buyer INT NOT NULL,
  CONSTRAINT buyer_valid
  FOREIGN KEY fk_buyer (buyer)
    REFERENCES user (id),

  PRIMARY KEY (id),
  CONSTRAINT bid_limit UNIQUE (lot_id, buyer)
);

