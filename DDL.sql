DROP TABLE IF EXISTS 
    user, 
    follow, 
    user_tier, 
    portfolio, 
    stock, 
    portfolio_reply, 
    bookmark, 
    stock_reply, 
    portfolio_reply_likes, 
    stock_reply_likes, 
    interested_stock, 
    acquisition, 
    badge,
    reward;
CREATE TABLE `user_tier` (
	`idx`	INT PRIMARY KEY AUTO_INCREMENT,
	`grade`	VARCHAR(10)	NOT NULL
);

CREATE TABLE `user` (
	`idx`	INT PRIMARY KEY AUTO_INCREMENT,
	`name`	VARCHAR(30)	NOT NULL,
	`email`	VARCHAR(50)	NOT NULL,
	`password`	VARCHAR(256)	NULL,
	`created_at`	DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	`updated_at`	DATETIME DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	`tier_grade`	INT	NOT NULL DEFAULT 1,
	`profile_image`	TEXT	NULL,
    `auth_provider` INT NOT NULL,
    FOREIGN KEY (tier_grade) REFERENCES user_tier(idx)
);

CREATE TABLE `follow` (
	`idx`	INT	PRIMARY KEY AUTO_INCREMENT,
	`follower`	INT	NOT NULL,
	`followee`	INT	NOT NULL,
	`created_at`	DATETIME NOT NULL,
    FOREIGN KEY (follower) REFERENCES user(idx),
    FOREIGN KEY (followee) REFERENCES user(idx)
);

CREATE TABLE portfolio (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL NOT NULL,
	user_id INT NOT NULL,
    is_public BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY (user_id) REFERENCES user(idx)
);

CREATE TABLE bookmark (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	portfolio_id INT NOT NULL,
	user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (user_id) REFERENCES user(idx)
);

CREATE TABLE portfolio_reply (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contents VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    parent_reply_id INT NULL,
    user_id INT NOT NULL,
    portfolio_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(idx),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (parent_reply_id) REFERENCES portfolio_reply(idx)
);

CREATE TABLE portfolio_reply_likes (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    reply_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reply_id) REFERENCES portfolio_reply(idx),
    FOREIGN KEY (user_id) REFERENCES user(idx)
    
);

CREATE TABLE stock(
    idx        INT AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(100) NOT NULL,
    market    VARCHAR(100) NOT NULL,
    code    VARCHAR(10) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);
delete from stock;

CREATE TABLE acquisition(
    idx INT AUTO_INCREMENT PRIMARY KEY,
    order_at    DATETIME NOT NULL,
    portfolio_id    INT NOT NULL,
    stock_id    INT NOT NULL,
    quantity    INT NOT NULL,
    price    INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (stock_id) REFERENCES stock(idx)
); 


CREATE TABLE stock_reply (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	stock_id INT NOT NULL,
	user_id INT NOT NULL,
	comment VARCHAR(200) NOT NULL,
    parent_reply_id INT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL NOT NULL,
	FOREIGN KEY (stock_id) REFERENCES stock(idx),
	FOREIGN KEY (user_id) REFERENCES user(idx),
	FOREIGN KEY (parent_reply_id) REFERENCES stock_reply(idx)
);


CREATE TABLE stock_reply_likes (
    idx INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    reply_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reply_id) REFERENCES stock_reply(idx),
    FOREIGN KEY (user_id) REFERENCES user(idx)
);

CREATE TABLE interested_stock(
    idx            INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT NOT NULL,
    stock_id    INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(idx),
    FOREIGN KEY (stock_id) REFERENCES stock(idx)
);


CREATE TABLE badge (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
DROP TABLE reward;
DROP TABLE badge;
CREATE TABLE reward (
	idx INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	portfolio_id INT NOT NULL,
    badge_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(idx),
    FOREIGN KEY (badge_id) REFERENCES badge(idx)
);
