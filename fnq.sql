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
DROP TABLE fnq
select * from fnq
select * from ORDERS
select * from ITEM
INSERT INTO fnq (fnq_no, manager_id, fnq_title, fnq_content) VALUES (1, 'm001', '첫번째 공지사항', '공지사항 내용')

SELECT COUNT(*) FROM (SELECT * FROM orders WHERE item_no IN (SELECT item_no FROM item WHERE member_id = 'm001'))
SELECT * FROM orders WHERE item_no IN (SELECT item_no FROM item WHERE member_id = 'm001')
select item_no from item where seller_id = 'm001'
select * from user_tables
DROP TABLE ITEM_FILE
DROP TABLE ITEM
DROP TABLE QNA
DROP TABLE EXCHANGE_REFUND
DROP TABLE CART
DROP TABLE ORDERS
DROP TABLE BOARD
DROP TABLE SEARCH
DROP TABLE MEMBER
DROP TABLE FNQ