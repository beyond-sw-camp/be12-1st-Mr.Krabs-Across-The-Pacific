-- 프로시저 생성할때 DROP을 #DROP으로 전체 변경해서 작성







-- SET profiling=1;

-- SHOW PROFILES;
-- SELECT * FROM user;


-- 회원가입	USER_001
	-- 최적화가 가능할까? 프로시저 만드는 정도
	-- 유저를 DB에 추가
	-- EXPLAIN INSERT INTO user (name, email, password, profile_image) 
    --  value ("userName", "userEmail", "userPassword", "userProfileImage");
	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_INSERT_USER(IN userName VARCHAR(30), userEmail VARCHAR(50), 
		userPassword VARCHAR(256), userProfileImage TEXT)
	BEGIN
		INSERT INTO user (name, email, password, profile_image) 
		value (userName, userEmail, userPassword, userProfileImage);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_USER;
    
-- 이메일 인증	USER_002
	-- 이메일이 있는지 확인
	-- EXPLAIN SELECT count(idx) FROM user WHERE email = "jgladdishog@nba.com";
	-- EXPLAIN SELECT count(idx) FROM user WHERE idx=600;
	-- USER를 이메일을 기준으로 인덱싱한다.
	-- SELECT * FROM user;
	-- CREATE INDEX user_index_email ON user(email);
	-- DROP INDEX user_index_email ON user;

	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_COUNT_USER_WITH_EMAIL(IN userEmail VARCHAR(50))
	BEGIN
		SELECT count(idx) FROM user WHERE email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_COUNT_USER_WITH_EMAIL;


-- 일반 로그인	USER_003
	-- 이메일이 있는지 확인
	-- EXPLAIN SELECT count(idx) FROM user WHERE email = "jgladdishog@nba.com";
	-- EXPLAIN SELECT password FROM user WHERE email = "jgladdishog@nba.com";
	-- USER를 이메일을 기준으로 인덱싱한다.
	-- USER_002와 동일

	-- 프로시저 제작
    -- USER_002와 동일
	DELIMITER $$
	CREATE PROCEDURE SP_SELECT_PASSWORD_WITH_EMAIL(IN userEmail VARCHAR(50))
	BEGIN
		SELECT password FROM user WHERE email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_PASSWORD_WITH_EMAIL;

-- 소셜 로그인	USER_004
	-- 소셜에서 로그인이 확인되면 EMAIL을 기준으로 저장된 멤버를 가져온다.
	-- USER_002, 003와 동일

-- 회원정보 수정	USER_005
	-- EXPLAIN UPDATE user SET name = ?, password = ?, profile_image = ? WHERE email = ?;

	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_UPDATE_USER_WITH_EMAIL(IN userName VARCHAR(30), 
		userPassword VARCHAR(256), userProfileImage TEXT, userEmail VARCHAR(50))
	BEGIN
		UPDATE user SET name = userName, password = userPassword, 
        profile_image = userProfileImage WHERE email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_UPDATE_USER_WITH_EMAIL;
    
-- 회원 탈퇴	USER_006
	-- EXPLAIN DELETE FROM user WHERE email = ?;

	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_DELETE_USER_WITH_EMAIL(IN userEmail VARCHAR(50))
	BEGIN
		DELETE FROM user WHERE email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_USER_WITH_EMAIL;

--  SELECT * FROM user_tier;


-- -- 유저 정보 확인	USER_007
	-- EXPLAIN SELECT user.idx, user.name, user.email, 
	-- 	user_tier.grade as tier, 
	-- 	count(portfolio.idx) as portfolio_count FROM user 
    --     LEFT JOIN user_tier ON user_tier.idx = user.tier_grade
	-- 	LEFT JOIN portfolio ON portfolio.user_id = user.idx
	-- 	WHERE email = "jgladdishog@nba.com";
	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_SELECT_USER_INFO_WITH_EMAIL(IN userEmail VARCHAR(50))
	BEGIN
		SELECT user.idx, user.name, user.email, 
			user_tier.grade as tier, 
			count(portfolio.idx) as portfolio_count FROM user 
			LEFT JOIN user_tier ON user_tier.idx = user.tier_grade
			LEFT JOIN portfolio ON portfolio.user_id = user.idx
			WHERE email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_USER_INFO_WITH_EMAIL;
	
-- 북마크 포트폴리오 확인	USER_008
	-- EXPLAIN SELECT count(bookmark.idx) FROM bookmark
	-- 	INNER JOIN user ON bookmark.user_id = user.idx
	-- 	WHERE user.email = "jgladdishog@nba.com"
    
	-- EXPLAIN SELECT portfolio.name FROM bookmark
    --     INNER JOIN portfolio ON bookmark.portfolio_id = portfolio.idx
	-- 	INNER JOIN user ON bookmark.user_id = user.idx
	-- 	WHERE user.email = "jgladdishog@nba.com"
	-- 	ORDER BY bookmark.created_at DESC;
        
	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_COUNT_BOOKMARK_WITH_EMAIL(IN userEmail VARCHAR(50))
	BEGIN
		SELECT count(bookmark.idx) FROM bookmark
		INNER JOIN user ON bookmark.user_id = user.idx
		WHERE user.email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_COUNT_BOOKMARK_WITH_EMAIL;
    
	DELIMITER $$
	CREATE PROCEDURE SP_SELECT_PORFOLIO_WITH_EMAIL(IN userEmail VARCHAR(50))
	BEGIN
		SELECT portfolio.name FROM bookmark
        INNER JOIN portfolio ON bookmark.portfolio_id = portfolio.idx
		INNER JOIN user ON bookmark.user_id = user.idx
		WHERE user.email = userEmail
		ORDER BY bookmark.created_at DESC;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_PORFOLIO_WITH_EMAIL;
        
-- 등급 변경	USER_009
	-- EXPLAIN UPDATE user SET tier_grade = 1 WHERE email = "jgladdishog@nba.com";
	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_UPDATE_USER_TIER_WITH_EMAIL(IN userTier INT, userEmail VARCHAR(50))
	BEGIN
		UPDATE user SET tier_grade = userTier WHERE email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_UPDATE_USER_TIER_WITH_EMAIL;

-- 관심 종목 확인	USER_010
	-- SELECT count(interested_stock.idx) FROM interested_stock
	-- 	INNER JOIN user ON interested_stock.user_id = user.idx
	-- 	WHERE user.email = "jgladdishog@nba.com";
	
	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_COUNT_STOCK_WITH_EMAIL(userEmail VARCHAR(50))
	BEGIN
		SELECT count(interested_stock.idx) FROM interested_stock
			INNER JOIN user ON interested_stock.user_id = user.idx
			WHERE user.email = userEmail;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_COUNT_STOCK_WITH_EMAIL;
    
	--  SELECT * FROM stock;
--  		SELECT stock.name FROM interested_stock
--  		INNER JOIN stock ON interested_stock.stock_id = stock.idx
--  		INNER JOIN user ON interested_stock.user_id = user.idx
--  		WHERE user.email = "jgladdishog@nba.com"
--  		ORDER BY interested_stock.created_at DESC;
--          
	-- 프로시저 제작
	DELIMITER $$
	CREATE PROCEDURE SP_SELECT_STOCK_WITH_EMAIL(userEmail VARCHAR(50))
	BEGIN
		SELECT stock.name FROM interested_stock
			INNER JOIN stock ON interested_stock.stock_id = stock.idx
			INNER JOIN user ON interested_stock.user_id = user.idx
			WHERE user.email = userEmail
			ORDER BY interested_stock.created_at DESC;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_STOCK_WITH_EMAIL;
-- 팔로우 추가	FOLLOW_001
	-- EXPLAIN INSERT INTO follow (follower, followee) VALUES(100,20);
    
	DELIMITER $$
    CREATE PROCEDURE SP_INSERT_FOLLOW(userFollower INT, userFollowee INT)
	BEGIN
		INSERT INTO follow(follower, followee) VALUES(userFollower, userFollowee);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_FOLLOW;
-- 팔로우 삭제	FOLLOW_002
	-- EXPLAIN DELETE FROM follow WHERE follower = 100 AND followee =20;
    
    -- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_FOLLOW(userFollower INT, userFollowee INT)
	BEGIN
		DELETE FROM follow WHERE follower = userFollower AND followee =userFollowee;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_FOLLOW;
-- 팔로잉 확인	FOLLOW_003 
	-- EXPLAIN SELECT count(follow.idx) FROM follow
	-- 	INNER JOIN user ON user.idx = follow.follower
	-- 	WHERE user.email = "jgladdishog@nba.com";
	
	-- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_COUNT_FOLLOWEE_WITH_FOLLOWER(userFollower INT)
	BEGIN
		SELECT count(follow.idx) FROM follow
			INNER JOIN user ON user.idx = follow.follower
			WHERE user.email = userFollower;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_COUNT_FOLLOWEE_WITH_FOLLOWER;
    
	--  SELECT followee.name FROM follow
--          INNER JOIN user as follower ON follower.idx = follow.follower
--          INNER JOIN user as followee ON followee.idx = follow.followee
--  		WHERE follower.email = "jgladdishog@nba.com";
--  	
    -- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_SELECT_FOLLOWEE_WITH_FOLLOWER(userFollower INT)
	BEGIN
		SELECT followee.name FROM follow
			INNER JOIN user as follower ON follower.idx = follow.follower
			INNER JOIN user as followee ON followee.idx = follow.followee
			WHERE follower.email = userFollower;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_FOLLOWEE_WITH_FOLLOWER;
	
-- 팔로워 확인	FOLLOW_004
	-- EXPLAIN SELECT count(follow.idx) FROM follow
	-- 		INNER JOIN user ON user.idx = follow.followee
	-- 		WHERE user.email = "jgladdishog@nba.com";
		
    -- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_COUNT_FOLLOWER_WITH_FOLLOWEE(userFollowee INT)
	BEGIN
		SELECT count(follow.idx) FROM follow
			INNER JOIN user ON user.idx = follow.followee
			WHERE user.email = userFollowee;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_COUNT_FOLLOWER_WITH_FOLLOWEE;
    
	-- EXPLAIN SELECT follower.name FROM follow
    --     INNER JOIN user as follower ON follower.idx = follow.follower
    --     INNER JOIN user as followee ON followee.idx = follow.followee
	-- 	WHERE followee.email = "jgladdishog@nba.com";
	
    -- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_SELECT_FOLLOWER_WITH_FOLLOWEE(userFollowee INT)
	BEGIN
		SELECT follower.name FROM follow
			INNER JOIN user as follower ON follower.idx = follow.follower
			INNER JOIN user as followee ON followee.idx = follow.followee
			WHERE followee.email = userFollowee;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_FOLLOWER_WITH_FOLLOWEE;
	
-- 알림보내기	ALERT_001


-- 포트폴리오 생성	PORTFOLIO_001
	-- EXPLAIN INSERT INTO portfolio(name, created_at, updated_at, user_idx) value (?,?,?,?,?);
    
	-- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_INSERT_PORTFOLIO(portfolioName VARCHAR(255), userId INT)
	BEGIN
		INSERT INTO portfolio(name, user_id) value 
			(portfolioName,userId);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_PORTFOLIO;
    
	-- EXPLAIN INSERT INTO acquisition(order_at, portfolio_id,stock_id,quantity,price) value (?,?,?,?);
    
    -- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_INSERT_ACQUISITION(acquisitionOrderAt DATETIME, portfolioId INT , stockId INT, 
		acquisitionQuantity INT, acquisitionPrice INT )
	BEGIN
		INSERT INTO acquisition(order_at, portfolio_id,stock_id,quantity,price) VALUES
			(acquisitionOrderAt, portfolioId, stockId, acquisitionQuantity, acquisitionPrice);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_ACQUISITION;
    
    
-- 소유 포트폴리오 조회	PORTFOLIO_002

	-- SELECT * FROM user WHERE email = "ebatten42@ycombinator.com";
    -- SELECT * FROM portfolio where user_id = 147;
    -- SELECT count(*) , portfolio_id FROM acquisition where portfolio_id = 881;
    
    
    -- SELECT * FROM badge;
    
    
    -- set profiling=1;
    -- show profiles;
    
	-- CALL SP_SELECT_PORFOLIO_WITH_USER_ID(3, 0);
    
	-- SELECT portfolio.idx, portfolio.name, portfolio.created_at,portfolio.updated_at, count(badge.idx)
	-- 	FROM portfolio
	-- 	LEFT JOIN reward ON portfolio.idx = reward.portfolio_id
	-- 	LEFT JOIN badge ON reward.badge_id = badge.idx
	-- 	WHERE portfolio.user_id = 3
    --     GROUP BY portfolio.idx
    --     LIMIT 0, 30;
	-- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_SELECT_PORTFOLIO_WITH_USER_ID(userId INT, idx INT)
	BEGIN
		SELECT portfolio.idx, portfolio.name, portfolio.created_at,portfolio.updated_at, count( badge.idx)
			FROM portfolio
			LEFT JOIN reward ON portfolio.idx = reward.portfolio_id
			LEFT JOIN badge ON reward.badge_id = badge.idx
			WHERE portfolio.user_id = userId
            ORDER BY portfolio.created_at DESC
            LIMIT idx, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_PORTFOLIO_WITH_USER_ID;
    
    -- SELECT acquisition.order_at, stock.name,stock.code, acquisition.quantity, 
	-- 	acquisition.price, acquisition.created_at, acquisition.updated_at
	-- 	FROM acquisition
	-- INNER JOIN stock ON stock.idx = acquisition.stock_id
    --     WHERE acquisition.portfolio_id = 881
    --     ORDER BY acquisition.created_at
    --     LIMIT ?, 30;
        
	-- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_SELECT_ACQUISITION_WITH_PORTFOLIO_ID(portfolioId INT, idx INT)
	BEGIN
		SELECT acquisition.order_at, stock.name,stock.code, acquisition.quantity, 
			acquisition.price, acquisition.created_at, acquisition.updated_at
			FROM acquisition
			INNER JOIN stock ON stock.idx = acquisition.stock_id
			WHERE acquisition.portfolio_id = portfolio_id
			ORDER BY acquisition.created_at DESC
            LIMIT idx, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_ACQUISITION_WITH_PORTFOLIO_ID;
-- 포트폴리오 변경	PORTFOLIO_003
	-- select * from portfolio;
	-- UPDATE portfolio SET portfolio.name=? WHERE portfolio.idx =portfolioId;
    
    -- 프로시저 생성
    DELIMITER $$
    CREATE PROCEDURE SP_UPDATE_PORTFOLIO_WITH_IDX(portfolioName VARCHAR(255), portfolioId INT)
	BEGIN
		UPDATE portfolio SET portfolio.name=portfoloName WHERE idx = portfolioId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_UPDATE_PORTFOLIO_WITH_IDX;
    
    -- acquisition 생성은 포트폴리오 생성과 동일
    -- DELETE FROM acquisition WHERE idx = acquisitionId;
    
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_ACQUISITION_WITH_IDX(acquisitionId INT)
	BEGIN
		DELETE FROM acquisition WHERE idx = acquisitionId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_ACQUISITION_WITH_IDX;
-- 포트폴리오 삭제	PORTFOLIO_004
	-- DELETE FROM portfolio WHERE idx = portfolioId;
    
    -- 프로시저
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_PORTFOLIO_WITH_IDX(portfolioId INT)
	BEGIN
		DELETE FROM portfolio WHERE idx = portfolioId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_PORTFOLIO_WITH_IDX;
    
    -- 포트폴리오 뷰
    --  CREATE VIEW AcquiredStock AS
--  		SELECT user.idx AS user_id, acquisition.price as price, acquisition.order_at AS ordertime, 
--          acquisition.quantity AS quantity, acquisition.stock_id AS stock_id
--  		FROM acquisition JOIN portfolio ON acquisition.portfolio_id = portfolio.idx
--  			JOIN user ON portfolio.user_id = user.idx;
--          
        
-- 북마크 추가	STATS_006
-- EXPLAIN INSERT INTO bookmark (portfolio_id, user_id) VALUES (portfolioId, userId);


	DELIMITER $$
    CREATE PROCEDURE SP_INSERT_BOOKMARK(portfolioId INT, userId INT)
	BEGIN
		INSERT INTO bookmark (portfolio_id, user_id) VALUES (portfolioId, userId);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_BOOKMARK;
-- 북마크 삭제	STATS_007
-- EXPLAIN 
	-- DELETE FROM bookmark 
	-- WHERE portfolio_id = ? AND user_id = ?;
    
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_BOOKMARK(portfolioId INT, userId INT)
	BEGIN
		DELETE FROM bookmark WHERE portfolio_id = portfolioId AND user_id = userId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_BOOKMARK;


-- 신규 등록 순 차트 조회
-- SELECT portfolio.idx AS id, portfolio.name AS name, user.name AS author, 
-- 	portfolio.created_at AS created_at, COUNT(bookmark.idx) AS bookmarkNumber
-- 	FROM portfolio 
--     INNER JOIN bookmark ON portfolio.idx = bookmark.portfolio_id 
--     INNER JOIN user ON user.idx = portfolio.user_id
-- 	GROUP BY portfolio.idx
-- 	ORDER BY created_at DESC
-- 	LIMIT 0, 30;
    
    DELIMITER $$
    CREATE PROCEDURE SP_SELECT_PORTFOLIO_ORDER_CREATED(firstIndex INT)
	BEGIN
		SELECT portfolio.idx AS id, portfolio.name AS name, user.name AS author, 
			portfolio.created_at AS created_at, COUNT(bookmark.idx) AS bookmarkNumber
			FROM portfolio 
			INNER JOIN bookmark ON portfolio.idx = bookmark.portfolio_id 
			INNER JOIN user ON user.idx = portfolio.user_id
			GROUP BY portfolio.idx
			ORDER BY created_at DESC
			LIMIT firstIndex, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_PORTFOLIO_ORDER_CREATED;

-- 누적 북마크 수 차트 조회
-- SELECT portfolio.idx AS id, portfolio.name AS name, user.name AS author, 
-- 	portfolio.created_at AS created_at, COUNT(bookmark.idx) AS bookmarkNumber
-- 	FROM portfolio 
--    INNER JOIN bookmark ON portfolio.idx = bookmark.portfolio_id 
--     INNER JOIN user ON user.idx = portfolio.user_id
-- 	GROUP BY portfolio.idx
-- 	ORDER BY bookmarkNumber DESC, created_at DESC
-- 	LIMIT 0, 30;

	DELIMITER $$
    CREATE PROCEDURE SP_SELECT_PORTFOLIO_ORDER_BOOKMARK(firstIndex INT)
	BEGIN
		SELECT portfolio.idx AS id, portfolio.name AS name, user.name AS author, 
			portfolio.created_at AS created_at, COUNT(bookmark.idx) AS bookmarkNumber
			FROM portfolio 
			INNER JOIN bookmark ON portfolio.idx = bookmark.portfolio_id 
			INNER JOIN user ON user.idx = portfolio.user_id
			GROUP BY portfolio.idx
			ORDER BY bookmarkNumber DESC, created_at DESC
			LIMIT firstIndex, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_PORTFOLIO_ORDER_BOOKMARK;
    
-- 인기 장기투자 포트폴리오 
-- 	SELECT portfolio.idx AS id, portfolio.name AS name, user.name AS author, 
-- 		portfolio.created_at AS created_at, COUNT(bookmark.idx) AS bookmarkNumber
-- 		FROM portfolio 
-- 		INNER JOIN bookmark ON portfolio.idx = bookmark.portfolio_id 
 --        INNER JOIN user ON user.idx = portfolio.user_id
-- 		WHERE portfolio.created_at >= portfirst AND portfolio.created_at < portlast 
 --        AND NOT portfolio.updated_at = portfolio.created_at
	-- 	GROUP BY portfolio.idx
	-- 	ORDER BY bookmarkNumber DESC, created_at ASC
	-- 	LIMIT firstIndex, 30;
	DELIMITER $$
    CREATE PROCEDURE SP_SELECT_PORTFOLIO_IN_TIME_ORDER_BOOKMARK(portfirst DATETIME, portlast DATETIME, firstIndex INT)
	BEGIN
		SELECT portfolio.idx AS id, portfolio.name AS name, user.name AS author, 
			portfolio.created_at AS created_at, COUNT(bookmark.idx) AS bookmarkNumber
			FROM portfolio 
			INNER JOIN bookmark ON portfolio.idx = bookmark.portfolio_id 
			INNER JOIN user ON user.idx = portfolio.user_id
			GROUP BY portfolio.idx
			ORDER BY bookmarkNumber DESC, created_at ASC
			LIMIT firstIndex, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_PORTFOLIO_IN_TIME_ORDER_BOOKMARK;

-- 댓글 작성
--  INSERT INTO portfolio_reply (user_id, portfolio_id, contents) VALUES (userId, portfolioId, contents);

	DELIMITER $$
    CREATE PROCEDURE SP_INSERT_PORTFOLIO_REPLY(userId INT, portfolioId INT, contentsText VARCHAR (255))
	BEGIN
		INSERT INTO portfolio_reply (user_id, portfolio_id, contents) VALUES (userId, portfolioId, contentsText);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_PORTFOLIO_REPLY;
-- 포트폴리오 댓글 조회
	--  SELECT portfolio_reply.idx AS id, user.name AS author, portfolio_reply.created_at AS created_at, 
--  		portfolio_reply.updated_at AS updated_at, portfolio_reply.contents AS contents
--  		FROM portfolio_reply 
--          INNER JOIN user ON portfolio_reply.user_id = user.idx
--  		WHERE portfolio_reply.portfolio_id = 881
--  		ORDER BY created_at DESC
--  		LIMIT 0, 30;
--          
	DELIMITER $$
    CREATE PROCEDURE SP_SELECT_PORTFOLIO_REPLY_WITH_PORTFOLIO(portfolioId INT, firstIndex INT)
	BEGIN
		SELECT portfolio_reply.idx AS id, user.name AS author, portfolio_reply.created_at AS created_at, 
			portfolio_reply.updated_at AS updated_at, portfolio_reply.contents AS contents
			FROM portfolio_reply 
			INNER JOIN user ON portfolio_reply.user_id = user.idx
			WHERE portfolio_reply.portfolio_id = portfolioId
			ORDER BY created_at DESC
			LIMIT firstIndex, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_PORTFOLIO_REPLY_WITH_PORTFOLIO;

-- 댓글 수정
--  	UPDATE portfolio_reply SET contents = "Apink" WHERE portfolio_reply.idx = 2;
--  	SELECT * FROM portfolio_reply;
--      
    
    DELIMITER $$
    CREATE PROCEDURE SP_UPDATE_PORTFOLIO_REPLY_WITH_IDX(contentsText VARCHAR(255), portfolioReplyId INT)
	BEGIN
		UPDATE portfolio_reply SET contents = contentsText WHERE portfolio_reply.idx = portfolioReplyId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_UPDATE_PORTFOLIO_REPLY_WITH_IDX;
-- 댓글 삭제
--  	DELETE FROM portfolio_reply WHERE portfolio_reply.idx = ?;
--      
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_PORTFOLIO_REPLY( portfolioReplyId INT)
	BEGIN
		DELETE FROM portfolio_reply WHERE portfolio_reply.idx = portfolioReplyId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_PORTFOLIO_REPLY;
-- 댓글 좋아요
	--  INSERT INTO portfolio_reply_likes (reply_id, user_id) VALUES (?, ?);
--      
    DELIMITER $$
    CREATE PROCEDURE SP_INSERT_PORTFOLIO_REPLY_LIKES(replyId INT, userId INT)
	BEGIN
		INSERT INTO portfolio_reply_likes (reply_id, user_id) VALUES (replyId, userId);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_PORTFOLIO_REPLY_LIKES;
-- 댓글 좋아요 제거

	--  DELETE FROM portfolio_reply_likes WHERE (reply_id = ? AND user_id = ?) ;
--      
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_PORTFOLIO_REPLY_LIKES(replyId INT, userId INT)
	BEGIN
		DELETE FROM portfolio_reply_likes WHERE (relpy_id = replyId AND user_id = userId);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_PORTFOLIO_REPLY_LIKES;
    
-- 종목 검색	STOCK_001
-- 종목 조회	STOCK_002

--  SELECT stock.name, stock.code, stock.market FROM stock 
--  	INNER JOIN interested_stock ON interested_stock.idx = stock.idx
--  	GROUP BY interested_stock.stock_id
--  	ORDER BY interested_stock.created_at DESC
--      LIMIT 0, 30;
    
	DELIMITER $$
    CREATE PROCEDURE SP_SELECT_INTERESTED_STOCK(firstIndex INT)
	BEGIN
		SELECT stock.idx, stock.name, stock.code, stock.market FROM stock 
			INNER JOIN interested_stock ON interested_stock.idx = stock.idx
			GROUP BY interested_stock.stock_id
			ORDER BY interested_stock.created_at DESC
			LIMIT firstIndex, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_INTERESTED_STOCK;
    
-- 종목 상세보기	STOCK_003
--  	SELECT stock.name, stock.code, stock.market FROM stock
--  		WHERE stock.idx = 20;
        
	DELIMITER $$
    CREATE PROCEDURE SP_SELECT_STOCK_WITH_IDX(stockId INT)
	BEGIN
		SELECT stock.name, stock.code, stock.market FROM stock
			WHERE stock.idx = stockId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_STOCK_WITH_IDX;
-- 종목 추가(자동)	STOCK_004
--  	INSERT INTO stock(stock.name, stock.market, stock.code) VALUES("hello","my","sql");
    
    DELIMITER $$
    CREATE PROCEDURE SP_INSERT_STOCK(stockName VARCHAR(100), stockMarket VARCHAR(100), stockCode VARCHAR(10)  )
	BEGIN
		INSERT INTO stock(stock.name, stock.market, stock.code) VALUES(stockName,stockMarket,stockCode);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_STOCK;
    
-- 종목 폐지(자동)	STOCK_005
--      DELETE FROM stock WHERE stock.idx = 101;
    
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_STOCK_WITH_IDX(stockId INT)
	BEGIN
		DELETE FROM stock WHERE stock.idx = stockId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_STOCK_WITH_IDX;
-- 종목 댓글 확인	STOCK_006
--  	SELECT stock_reply.idx AS id, user.name AS author, stock_reply.created_at AS created_at, 
--  		stock_reply.updated_at AS updated_at, stock_reply.comment AS comment
--  		FROM stock_reply 
--          INNER JOIN user ON stock_reply.user_id = user.idx
--  		WHERE stock_reply.stock_id = 37
--  		ORDER BY created_at DESC
--  		LIMIT 0, 30;
        
	DELIMITER $$
    CREATE PROCEDURE SP_SELECT_STOCK_REPLY_WITH_STOCK(stockId INT, firstIndex INT)
	BEGIN
		SELECT stock_reply.idx AS id, user.name AS author, stock_reply.created_at AS created_at, 
			stock_reply.updated_at AS updated_at, stock_reply.comment AS comment
			FROM stock_reply 
			INNER JOIN user ON stock_reply.user_id = user.idx
			WHERE stock_reply.stock_id = stockId
			ORDER BY created_at DESC
			LIMIT firstIndex, 30;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_SELECT_STOCK_REPLY_WITH_STOCK;
-- 종목 댓글 작성	STOCK_007
--  INSERT INTO stock_reply (user_id, stock_id, comment) VALUES (321, 32, "hi");
--  	select * from stock_reply order by idx desc;
	DELIMITER $$
    CREATE PROCEDURE SP_INSERT_STOCK_REPLY(userId INT, stockId INT, commentText VARCHAR (200))
	BEGIN
		INSERT INTO stock_reply (user_id,stock_id, comment) VALUES (userId, stockId, commentText);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_STOCK_REPLY;
-- 종목 댓글수정	STOCK_008
--  UPDATE stock_reply SET comment = "Apink" WHERE stock_reply.idx = 1001;
--  SELECT * FROM stock_reply order by idx desc;
	
    DELIMITER $$
    CREATE PROCEDURE SP_UPDATE_STOCK_REPLY_WITH_IDX(commentText VARCHAR(255), stockReplyId INT)
	BEGIN
		UPDATE stock_reply SET comment = commentText WHERE stock_reply.idx = stockReplyId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_UPDATE_STOCK_REPLY_WITH_IDX;
-- 종목 댓글 삭제	STOCK_009
--  DELETE FROM stock_reply WHERE stock_reply.idx = 1001;
--  SELECT * FROM stock_reply order by idx desc;

    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_STOCK_REPLY(stockReplyId INT)
	BEGIN
		DELETE FROM stock_reply WHERE stock_reply.idx = stockReplyId;
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_STOCK_REPLY;
-- 종목 댓글 좋아요 추가	STOCK_010
--  INSERT INTO stock_reply_likes (reply_id, user_id) VALUES (234, 21);
--  select * from stock_reply_likes order by idx desc;
    DELIMITER $$
    CREATE PROCEDURE SP_INSERT_STOCK_REPLY_LIKES(replyId INT, userId INT)
	BEGIN
		INSERT INTO stock_reply_likes (reply_id, user_id) VALUES (replyId, userId);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_INSERT_STOCK_REPLY_LIKES;
-- 종목 댓글 좋아요 제거	STOCK_011

--  DELETE FROM stock_reply_likes WHERE (reply_id = 234 AND user_id = 21) ;
    
    DELIMITER $$
    CREATE PROCEDURE SP_DELETE_STOCK_REPLY_LIKES(replyId INT, userId INT)
	BEGIN
		DELETE FROM stock_reply_likes WHERE (relpy_id = replyId AND user_id = userId);
	END $$
	DELIMITER ;
	DROP PROCEDURE SP_DELETE_STOCK_REPLY_LIKES;