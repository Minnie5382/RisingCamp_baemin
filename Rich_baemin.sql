

CREATE TABLE `User` (
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`Nickname`	VARCHAR(45)	NOT NULL	COMMENT '유저 닉네임',
	`grade`	CHAR(10)	NOT NULL	COMMENT '유저 등급',
	`email`	VARCHAR(45)	NULL	COMMENT '유저 이메일 주소',
	`userTelNum`	VARCHAR(15)	NULL	COMMENT '유저 휴대폰 번호',
	`profileImageUrl`	TEXT	NULL	COMMENT '프로필 사진',
	`baeminPayBalance`	INT	NOT NULL	DEFAULT 0	COMMENT '배민페이 잔액',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성 일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신 일시',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT 'ACTIVE :활성화 INACTIVE : 휴면 DELETE : 탈퇴',
	`location`	VARCHAR(45)	NULL	COMMENT '사용자 위치',
	`emailReceive`	CHAR(1)	NOT NULL	DEFAULT "N"	COMMENT '메일 수신동의',
	`smsReceive`	CHAR(1)	NOT NULL	DEFAULT "N"	COMMENT 'SMS 수신동의',
	`userId2`	INT	NOT NULL	COMMENT '소유자 id',
	`couponId`	INT	NULL	COMMENT '쿠폰 id',
	`giftcardId`	INT	NOT NULL	COMMENT '상품권 id',
	`toUserId`	INT	NOT NULL	COMMENT '받는 유저 id',
	`fromUserId`	INT	NOT NULL	COMMENT '보내는 유저 id',
	`giftcardId2`	INT	NOT NULL	COMMENT '상품권 id',
	`toUserId2`	INT	NOT NULL	COMMENT '받는 유저 id',
	`fromUserId2`	INT	NOT NULL	COMMENT '보내는 유저 id'
);

CREATE TABLE `PointInfo` (
	`pointId`	INT	NOT NULL	COMMENT '포인트 id',
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`point`	INT	NOT NULL	DEFAULT 0	COMMENT '포인트 값',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`expireDate`	DATE	NOT NULL	COMMENT '사용 기한',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`userId2`	INT	NOT NULL	COMMENT '유저 id'
);

CREATE TABLE `Coupon` (
	`couponId`	INT	NOT NULL	COMMENT '쿠폰 id',
	`name`	VARCHAR(45)	NOT NULL	COMMENT '쿠폰 이름',
	`price`	INT	NOT NULL	COMMENT '쿠폰 금액',
	`leastPrice`	INT	NOT NULL	DEFAULT 0	COMMENT '최소사용금액',
	`expireDate`	DATE	NOT NULL	COMMENT '유효기간',
	`isDelivery`	VARCHAR(1)	NOT NULL	COMMENT '배달 적용 여부',
	`isPickup`	VARCHAR(1)	NOT NULL	COMMENT '포장 적용 여부',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT 'ACTIVE :활성화 INACTIVE : 비활성화 DELETE : 삭제됨',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성 일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신 일시',
	`userId`	INT	NOT NULL	COMMENT '소유자 id',
	`couponId2`	INT	NULL	COMMENT '쿠폰 id'
);

CREATE TABLE `Giftcard` (
	`giftcardId`	INT	NOT NULL	COMMENT '상품권 id',
	`giftcardNum`	VARCHAR(16)	NOT NULL	COMMENT '상품권 코드',
	`price`	INT	NOT NULL	COMMENT '상품권 액면가',
	`expireDate`	DATE	NOT NULL	COMMENT '상품권 사용기간',
	`brand`	VARCHAR(45)	NOT NULL	DEFAULT "baemin_giftcard"	COMMENT '상품권 브랜드',
	`menuId`	INT	NULL	COMMENT '상품권 메뉴',
	`canUseWith`	VARCHAR(1)	NOT NULL	DEFAULT "N"	COMMENT '타쿠폰 중복가능여부',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT 'ACTIVE :활성화 INACTIVE : 비활성화 DELETE : 삭제됨',
	`balance`	INT	NOT NULL	COMMENT '상품권 잔액',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`giftcardId2`	INT	NOT NULL	COMMENT '상품권 id',
	`toUserId`	INT	NOT NULL	COMMENT '받는 유저 id',
	`fromUserId`	INT	NOT NULL	COMMENT '보내는 유저 id'
);

CREATE TABLE `Shop` (
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`ownerId`	INT	NOT NULL	COMMENT '사장님 id',
	`shopName`	VARCHAR(45)	NOT NULL	COMMENT '가게 이름',
	`star`	DECIMAL(1, 1)	NOT NULL	DEFAULT 0.0	COMMENT '가게 평점',
	`reviewNum`	INT	NOT NULL	DEFAULT 0	COMMENT '가게 리뷰 개수',
	`leastPrice`	INT	NOT NULL	DEFAULT 0	COMMENT '최소주문금액',
	`deliveryTip`	INT	NOT NULL	DEFAULT 0	COMMENT '배달팁',
	`logoImgUrl`	TEXT	NOT NULL	COMMENT '가게 로고 이미지',
	`DelTimeFrom`	INT	NOT NULL	DEFAULT 50	COMMENT '배달 예상 시간(최소)',
	`DelTimeTo`	INT	NOT NULL	DEFAULT 60	COMMENT '배달 예상 시간(최대)',
	`like`	INT	NOT NULL	DEFAULT 0	COMMENT '가게 찜 수',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`introduce_text`	TEXT	NULL	COMMENT '가게 소개 텍스트',
	`introduce_img`	TEXT	NULL	COMMENT '가게 소개 사진',
	`notice_text`	TEXT	NULL	COMMENT '사장님 공지 텍스트',
	`notice_img`	VARCHAR(255)	NULL	COMMENT '사장님 공지 사진',
	`shopTelNum`	VARCHAR(15)	NOT NULL	COMMENT '가게 전화번호',
	`openTime`	TIME	NOT NULL	COMMENT '가게 오픈시간',
	`closeTime`	TIME	NOT NULL	COMMENT '가게 마감시간',
	`ownerNum`	CHAR(10)	NOT NULL	COMMENT '사업자 번호',
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id'
);

CREATE TABLE `Advertising` (
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`advertizeId`	INT	NOT NULL	COMMENT '광고 id',
	`advertising`	VARCHAR(45)	NOT NULL	COMMENT '이용중인 광고 상품',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id',
	`ownerId`	INT	NOT NULL	COMMENT '사장님 id'
);

CREATE TABLE `ShopHomeImage` (
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`shopHomeImgUrl`	TEXT	NOT NULL	COMMENT '첫화면 이미지',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id',
	`ownerId`	INT	NOT NULL	COMMENT '사장님 id'
);

CREATE TABLE `Menu` (
	`menuId`	INT	NOT NULL	COMMENT '메뉴 id',
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`name`	VARCHAR(45)	NOT NULL	COMMENT '메뉴 이름',
	`price`	INT	NOT NULL	COMMENT '메뉴 가격',
	`description`	TEXT	NULL	COMMENT '메뉴 설명',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`isRepresent`	BINARY	NOT NULL	COMMENT '대표메뉴 여부',
	`group`	VARCHAR(20)	NULL	COMMENT '메뉴그룹',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id',
	`ownerId`	INT	NOT NULL	COMMENT '사장님 id',
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`shopId3`	INT	NOT NULL	COMMENT '가게 id'
);

CREATE TABLE `MenuOption` (
	`menuId`	INT	NOT NULL	COMMENT '메뉴 id',
	`optionId`	INT	NOT NULL	COMMENT '옵션 id',
	`name`	VARCHAR(20)	NOT NULL	COMMENT '옵션 이름',
	`price`	INT	NULL	DEFAULT 0	COMMENT '옵션 가격',
	`isEssential`	VARCHAR(1)	NOT NULL	DEFAULT "N"	COMMENT '필수옵션 여부',
	`group`	VARCHAR(45)	NULL	COMMENT '옵션 그룹',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`menuId2`	INT	NOT NULL	COMMENT '메뉴 id',
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id'
);

CREATE TABLE `MenuImage` (
	`menuId`	INT	NOT NULL	COMMENT '메뉴 id',
	`menuImgId`	INT	NOT NULL	COMMENT '메뉴 이미지 id',
	`menuImgUrl`	TEXT	NOT NULL	COMMENT '메뉴 이미지',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updateAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`menuId2`	INT	NOT NULL	COMMENT '메뉴 id',
	`shopId`	INT	NOT NULL	COMMENT '가게 id'
);

CREATE TABLE `Review` (
	`reviewId`	INT	NOT NULL	COMMENT '리뷰 id',
	`shopId`	INT	NULL	COMMENT '가게 id',
	`userId`	INT	NULL	COMMENT '작성자 id',
	`star`	DECIMAL(1,0)	NOT NULL	DEFAULT 5	COMMENT '별점',
	`content`	TEXT	NOT NULL	COMMENT '리뷰 내용',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id',
	`ownerId`	INT	NOT NULL	COMMENT '사장님 id'
);

CREATE TABLE `ReviewImage` (
	`reviewId`	INT	NOT NULL	COMMENT '리뷰 id',
	`reviewImgUrl`	TEXT	NOT NULL	COMMENT '리뷰 이미지',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updateAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`reviewId2`	INT	NOT NULL	COMMENT '리뷰 id',
	`shopId`	INT	NULL	COMMENT '가게 id',
	`userId`	INT	NULL	COMMENT '작성자 id'
);

CREATE TABLE `OwnerComment` (
	`reviewId`	INT	NOT NULL	COMMENT '리뷰 id',
	`CommentId`	INT	NOT NULL	COMMENT '사장님 댓글 id',
	`content`	TEXT	NOT NULL	COMMENT '사장님 댓글 내용',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updateAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`reviewId2`	INT	NOT NULL	COMMENT '리뷰 id',
	`shopId`	INT	NULL	COMMENT '가게 id',
	`userId`	INT	NULL	COMMENT '작성자 id'
);

CREATE TABLE `Cart` (
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`cartId`	INT	NOT NULL	COMMENT '장바구니 id',
	`menuId`	INT	NOT NULL	COMMENT '메뉴 id',
	`optionId`	INT	NULL	COMMENT '옵션 id',
	`delOrPick`	VARCHAR(10)	NOT NULL	DEFAULT "Delivery"	COMMENT 'Delivery: 배달 Pickup: 포장',
	`count`	INT	NOT NULL	DEFAULT 1	COMMENT '수량',
	`userId2`	INT	NOT NULL	COMMENT '유저 id',
	`userId3`	INT	NOT NULL	COMMENT '유저 id'
);

CREATE TABLE `UserCardInfo` (
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`cardNumber`	VARCHAR(16)	NOT NULL	COMMENT '카드 번호',
	`EXP`	DATE	NOT NULL	COMMENT '유효기간',
	`accessCode`	INT	NOT NULL	COMMENT '보안 코드',
	`password`	VARCHAR(45)	NOT NULL	COMMENT '비밀번호',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE",
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp,
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp,
	`userId2`	INT	NOT NULL	COMMENT '유저 id'
);

CREATE TABLE `UserAccountInfo` (
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`userAccountId`	INT	NOT NULL	COMMENT '유저 계좌 id',
	`accountNumber`	VARCHAR(25)	NOT NULL	COMMENT '계좌 번호',
	`bank`	VARCHAR(10)	NOT NULL	COMMENT '은행명',
	`accessCode`	INT	NOT NULL	COMMENT '보안 코드',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT 'ACTIVE :활성화INACTIVE : 비활성화DELETE : 삭제됨',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`userId2`	INT	NOT NULL	COMMENT '유저 id'
);

CREATE TABLE `Order` (
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`orderId`	INT	NOT NULL	COMMENT '주문 번호',
	`deliveryTip`	INT	NOT NULL	COMMENT '배달팁',
	`delOrPick`	BINARY	NOT NULL	COMMENT '배달 or 포장',
	`requestToOwner`	VARCHAR(45)	NOT NULL	DEFAULT "없음"	COMMENT '사장님 요청사항',
	`requestToRider`	VARCHAR(45)	NOT NULL	DEFAULT "조심히 와주세요"	COMMENT '라이더 요청사항',
	`payment`	VARCHAR(10)	NOT NULL	COMMENT '결제수단',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ORDERED"	COMMENT 'ORDERED : 주문완료 DELIVERING : 배달중  DONE : 배달완료 FAIL : 주문취소',
	`address`	VARCHAR(45)	NOT NULL	DEFAULT "현위치"	COMMENT '배달 주소',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '주문 일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신 일시',
	`userId2`	INT	NOT NULL	COMMENT '유저 id'
);

CREATE TABLE `Owner` (
	`ownerNum`	CHAR(10)	NOT NULL	COMMENT '사업자 번호',
	`name`	CHAR(45)	NOT NULL	COMMENT '대표자 명',
	`businessName`	VARCHAR(45)	NOT NULL	COMMENT '상호명',
	`ownerTelNum`	VARCHAR(15)	NOT NULL	COMMENT '대표자 연락처',
	`address`	TEXT	NOT NULL	COMMENT '사업지 주소',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT 'ACTIVE :활성화INACTIVE : 비활성화DELETE : 삭제됨',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시'
);

CREATE TABLE `SendGift` (
	`giftcardId`	INT	NOT NULL	COMMENT '상품권 id',
	`toUserId`	INT	NOT NULL	COMMENT '받는 유저 id',
	`fromUserId`	INT	NOT NULL	COMMENT '보내는 유저 id',
	`sendGiftId`	INT	NOT NULL	COMMENT '선물하기 id',
	`message`	TEXT	NULL	COMMENT '편지 내용',
	`cardImg`	VARCHAR(10)	NOT NULL	COMMENT '카드이미지 (여러 후보 중 고를 수 있음)',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT 'ACTIVE :활성화 INACTIVE : 비활성화 DELETE : 삭제됨',
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp	COMMENT '보낸 일시',
	`updatedAt`	TIMESTAMP	NOT NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신 일시'
);

CREATE TABLE `HaveCoupon` (
	`userId`	INT	NOT NULL	COMMENT '소유자 id',
	`couponId`	INT	NULL	COMMENT '쿠폰 id',
	`status`	VARCHAR(10)	NOT NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시'
);

CREATE TABLE `Like` (
	`userId`	INT	NOT NULL	COMMENT '유저 id',
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`userId2`	INT	NOT NULL	COMMENT '유저 id',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id',
	`ownerId`	INT	NOT NULL	COMMENT '사장님 id',
	`status`	VARCHAR(10)	NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시'
);

CREATE TABLE `DayOff` (
	`dayoffId`	INT	NOT NULL	COMMENT '가게 후뮤일 id',
	`shopId`	INT	NOT NULL	COMMENT '가게 id',
	`status`	VARCHAR(10)	NULL	DEFAULT "ACTIVE"	COMMENT '상태',
	`createdAt`	TIMESTAMP	NULL	DEFAULT current_timestamp	COMMENT '생성일시',
	`updatedAt`	TIMESTAMP	NULL	DEFAULT current_timestamp on update current_timestamp	COMMENT '갱신일시',
	`shopId2`	INT	NOT NULL	COMMENT '가게 id',
	`ownerId`	INT	NOT NULL	COMMENT '사장님 id'
);

ALTER TABLE `User` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`userId`
);

ALTER TABLE `PointInfo` ADD CONSTRAINT `PK_POINTINFO` PRIMARY KEY (
	`pointId`,
	`userId`
);

ALTER TABLE `Coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`couponId`
);

ALTER TABLE `Giftcard` ADD CONSTRAINT `PK_GIFTCARD` PRIMARY KEY (
	`giftcardId`
);

ALTER TABLE `Shop` ADD CONSTRAINT `PK_SHOP` PRIMARY KEY (
	`shopId`,
	`ownerId`
);

ALTER TABLE `Advertising` ADD CONSTRAINT `PK_ADVERTISING` PRIMARY KEY (
	`shopId`,
	`advertizeId`
);

ALTER TABLE `ShopHomeImage` ADD CONSTRAINT `PK_SHOPHOMEIMAGE` PRIMARY KEY (
	`shopId`
);

ALTER TABLE `Menu` ADD CONSTRAINT `PK_MENU` PRIMARY KEY (
	`menuId`,
	`shopId`
);

ALTER TABLE `MenuOption` ADD CONSTRAINT `PK_MENUOPTION` PRIMARY KEY (
	`menuId`,
	`optionId`
);

ALTER TABLE `MenuImage` ADD CONSTRAINT `PK_MENUIMAGE` PRIMARY KEY (
	`menuId`,
	`menuImgId`
);

ALTER TABLE `Review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`reviewId`,
	`shopId`,
	`userId`
);

ALTER TABLE `ReviewImage` ADD CONSTRAINT `PK_REVIEWIMAGE` PRIMARY KEY (
	`reviewId`
);

ALTER TABLE `OwnerComment` ADD CONSTRAINT `PK_OWNERCOMMENT` PRIMARY KEY (
	`reviewId`,
	`CommentId`
);

ALTER TABLE `Cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`userId`,
	`shopId`,
	`cartId`
);

ALTER TABLE `UserCardInfo` ADD CONSTRAINT `PK_USERCARDINFO` PRIMARY KEY (
	`userId`,
	`cardNumber`
);

ALTER TABLE `UserAccountInfo` ADD CONSTRAINT `PK_USERACCOUNTINFO` PRIMARY KEY (
	`userId`,
	`userAccountId`
);

ALTER TABLE `Order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`userId`,
	`orderId`
);

ALTER TABLE `Owner` ADD CONSTRAINT `PK_OWNER` PRIMARY KEY (
	`ownerNum`
);

ALTER TABLE `SendGift` ADD CONSTRAINT `PK_SENDGIFT` PRIMARY KEY (
	`giftcardId`,
	`toUserId`,
	`fromUserId`,
	`sendGiftId`
);

ALTER TABLE `HaveCoupon` ADD CONSTRAINT `PK_HAVECOUPON` PRIMARY KEY (
	`userId`,
	`couponId`
);

ALTER TABLE `Like` ADD CONSTRAINT `PK_LIKE` PRIMARY KEY (
	`userId`,
	`shopId`
);

ALTER TABLE `DayOff` ADD CONSTRAINT `PK_DAYOFF` PRIMARY KEY (
	`dayoffId`
);

