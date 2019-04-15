USE `627089-yeticave`;


CREATE TABLE categories (
  cat_id INT AUTO_INCREMENT PRIMARY KEY,
  cat_name VARCHAR(64) NOT NULL
);


CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(64) NOT NULL,
  user_email VARCHAR(64) NOT NULL,
  user_password VARCHAR(64) NOT NULL,
  user_contact VARCHAR(256) NOT NULL,
  user_dtreg DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_avatar VARCHAR(64) DEFAULT NULL,

  CONSTRAINT user_unique UNIQUE (user_email)
);


CREATE TABLE lots (
  lot_id INT AUTO_INCREMENT PRIMARY KEY,
  lot_name VARCHAR(64) NOT NULL,
  lot_description VARCHAR(256) NOT NULL,
  lot_image VARCHAR(64) NOT NULL,
  lot_dtstart DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  lot_dtend DATETIME NOT NULL,
  lot_price INT NOT NULL,
  lot_increment INT NOT NULL,

  cat_id INT NOT NULL,
  CONSTRAINT cat_valid
  FOREIGN KEY fk_cat (cat_id)
    REFERENCES categories (cat_id),

  seller INT NOT NULL,
  CONSTRAINT seller_valid
  FOREIGN KEY fk_seller (seller)
    REFERENCES users (user_id),

  winner INT DEFAULT NULL,
  CONSTRAINT winner_valid
  FOREIGN KEY fk_winner (winner)
    REFERENCES users (user_id),

  INDEX (lot_description)
);


CREATE TABLE bids (
  bid_amount INT NOT NULL,
  bid_dt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  lot_id INT NOT NULL,
  CONSTRAINT lot_valid
  FOREIGN KEY fk_lot (lot_id)
    REFERENCES lots (lot_id),

  buyer INT NOT NULL,
  CONSTRAINT buyer_valid
  FOREIGN KEY fk_buyer (buyer)
    REFERENCES users (user_id),

  CONSTRAINT bid_limit UNIQUE (lot_id, buyer)
);

