CREATE TABLE cart(
cart_no NUMBER,
member_id VARCHAR2(15),
item_no NUMBER NOT NULL,
cart_quantity NUMBER NOT NULL,
cart_price NUMBER NOT NULL,
cart_date DATE DEFAULT SYSDATE,
CONSTRAINT pk_cart_no PRIMARY KEY(cart_no),
CONSTRAINT fk_cart_member_id FOREIGN KEY(member_id)  REFERENCES member(member_id) ON DELETE CASCADE,
CONSTRAINT fk_cart_item_no FOREIGN KEY(item_no) REFERENCES item(item_no) ON DELETE CASCADE 
)

CREATE TABLE fnq(
   fnq_no NUMBER,
   manager_id VARCHAR2(15) NOT NULL,
   fnq_title VARCHAR2(300) NOT NULL,
   fnq_content VARCHAR2(1200) NOT NULL,
   fnq_regdate DATE DEFAULT SYSDATE,
   fnq_updatedate DATE DEFAULT SYSDATE,
   fnq_viewcnt NUMBER DEFAULT 0,
   CONSTRAINT pk_fnq_no PRIMARY KEY(fnq_no),
   CONSTRAINT fk_fnq_manager_id FOREIGN KEY(manager_id) REFERENCES manager(manager_id) ON DELETE CASCADE
)

CREATE TABLE manager(
   manager_id VARCHAR2(15),
   manager_pw VARCHAR2(15) NOT NULL,
   manager_name VARCHAR2(25) NOT NULL,
   manager_email VARCHAR2(30) NOT NULL,
   manager_phone NUMBER NOT NULL,
   manager_code INT NOT NULL,
   CONSTRAINT pk_manager_id PRIMARY KEY(manager_id)
)

CREATE TABLE item(
	item_no NUMBER,
	seller_id VARCHAR2(15)NOT NULL,
	item_name VARCHAR2(120) NOT NULL,
	item_category VARCHAR2(60) NOT NULL,
	item_size VARCHAR2(21) NOT NULL,
	item_color VARCHAR2(30) NOT NULL,
	item_price NUMBER NOT NULL,
	discount_percentage NUMBER NOT NULL,
	item_amount NUMBER NOT NULL,
	item_regdate DATE DEFAULT SYSDATE,
	CONSTRAINT pk_item_no PRIMARY KEY(item_no),
	CONSTRAINT fk_seller_id FOREIGN KEY(seller_id) REFERENCES member(member_id) ON DELETE CASCADE,
	CONSTRAINT fk_item_name FOREIGN KEY(item_name) REFERENCES category(item_name) ON DELETE CASCADE
)

create table orders(
	order_id NUMBER NOT NULL,
	item_no NUMBER,
	member_id VARCHAR2(15) NOT NULL,
	ea NUMBER,
	price NUMBER,
	address VARCHAR2(120) NOT NULL,
	dAddress VARCHAR2(50) NOT NULL,
	phone VARCHAR2(15) NOT NULL,
	status VARCHAR2(30) default '상품 준비 중',
	receiver VARCHAR2(15) NOT NULL,
	order_date DATE DEFAULT SYSDATE,
	review_indent NUMBER DEFAULT 0,
	CONSTRAINT pk_orders_order_id PRIMARY KEY(order_id),
	CONSTRAINT fk_orders_item_no FOREIGN KEY(item_no) REFERENCES item(item_no) ON DELETE CASCADE,
	CONSTRAINT fk_orders_member_id FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE
)
DROP TABLE ORDERS

CREATE TABLE search(
   search_no NUMBER,
   member_id VARCHAR2(15),
   item_category VARCHAR2(60) NOT NULL,
   keyword VARCHAR2(60) NOT NULL,
   search_date DATE DEFAULT SYSDATE,
   CONSTRAINT pk_search_no PRIMARY KEY(search_no),
   CONSTRAINT fk_member_id FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE
)

CREATE TABLE item_file(
	file_no NUMBER,
	file_name VARCHAR2(200) NOT NULL,
	item_no NUMBER NOT NULL,
	file_regdate DATE DEFAULT SYSDATE,
	CONSTRAINT pk_file_no PRIMARY KEY(file_no),
	CONSTRAINT fk_file_item_no FOREIGN KEY(item_no) REFERENCES item(item_no) ON DELETE CASCADE
)

CREATE TABLE qna(
	qna_no NUMBER,
	board_no NUMBER NOT NULL,
	member_id VARCHAR2(15) NOT NULL,
	qna_title VARCHAR2(100) NOT NULL,
	qna_content VARCHAR2(300) NOT NULL,
	qna_regdate DATE DEFAULT SYSDATE,
	qna_updatedate DATE DEFAULT SYSDATE,
	qna_repRoot NUMBER,
	qna_repStep NUMBER,
	qna_repIndent NUMBER,
	qna_answer VARCHAR2(150),
	CONSTRAINT pk_board_qna_no PRIMARY KEY(qna_no),
	CONSTRAINT fk_board_qna_board_no FOREIGN KEY(board_no) REFERENCES board(board_no) ON DELETE CASCADE,
	CONSTRAINT fk_board_qna_member_id FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE
)

CREATE TABLE review(
	review_no NUMBER,
	board_no NUMBER NOT NULL,
	member_id VARCHAR2(15) NOT NULL,
	review_content VARCHAR2(100) NOT NULL,
	review_regdate DATE DEFAULT SYSDATE,
	review_updatedate DATE DEFAULT SYSDATE,
	review_grade NUMBER DEFAULT 5,
	CONSTRAINT pk_board_review_no PRIMARY KEY(review_no),
	CONSTRAINT fk_board_review_board_no FOREIGN KEY(board_no) REFERENCES board(board_no) ON DELETE CASCADE,
	CONSTRAINT fk_board_review_member_id FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE
)


CREATE TABLE board(
	board_no NUMBER,
	item_no NUMBER NOT NULL,
	board_title VARCHAR2(300) NOT NULL,
	board_content VARCHAR2(1200) NOT NULL,
	board_regdate DATE DEFAULT SYSDATE,
	board_updatedate DATE DEFAULT SYSDATE,
	board_viewcnt NUMBER DEFAULT 0,
	CONSTRAINT pk_item_board_no PRIMARY KEY(board_no),
	CONSTRAINT fk_item_board_item_no FOREIGN KEY(item_no) REFERENCES item(item_no) ON DELETE CASCADE
)

CREATE TABLE like_item(
	like_no NUMBER,
	item_no NUMBER NOT NULL,
	member_id VARCHAR2(15) NOT NULL,
	like_date DATE DEFAULT SYSDATE,
	CONSTRAINT pk_like_no PRIMARY KEY(like_no),
	CONSTRAINT fk_like_item_no FOREIGN KEY(item_no) REFERENCES item(item_no) ON DELETE CASCADE,
	CONSTRAINT fk_like_member_id FOREIGN KEY(member_id) REFERENCES member(member_id) ON DELETE CASCADE
)
