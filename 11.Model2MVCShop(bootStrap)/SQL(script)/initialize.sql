
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;


CREATE SEQUENCE seq_product_prod_no		 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 			VARCHAR2(20)	NOT NULL,
	user_name 	VARCHAR2(50)	NOT NULL,
	password 		VARCHAR2(10)	NOT NULL,
	role 					VARCHAR2(5) 		DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone 		VARCHAR2(14),
	addr 				VARCHAR2(100),
	email 				VARCHAR2(50),
	reg_date 		DATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 						NUMBER 				NOT NULL,
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 				VARCHAR2(200),
	manufacture_day		VARCHAR2(8),
	price 							NUMBER(10),
	image_file 					VARCHAR2(100),
	reg_date 					DATE,
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 					NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option		CHAR(3),
	receiver_name 		VARCHAR2(20),
	receiver_phone		VARCHAR2(14),
	demailaddr 			VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code	CHAR(3),
	order_data 			DATE,
	dlvy_date 				DATE,
	PRIMARY KEY(tran_no)
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           
insert into product values (seq_product_prod_no.nextval,'뉴 마세라티 르반떼','르반떼 GTS에 탑재된 트윈 터보 V8엔진 만큼 온몸에 피를 끓게하는 엔진은 없을 것입니다','20120514',159900000, 'MaseratiLevanteW.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'르반떼 트로페오','시속 300km가 넘는 최고 속도로 고성능 SUV 세그먼트에서 가장 높은 위치에 자리매김했습니다','20120514',23900000, 'MaseratiLevantet.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'그란투리스모 스포츠','그란투리스모 스포트는 운전대를 잡는 순간부터 시작되눈 신세계로 당신을 인도합니다','20120201',39900000, 'GT25.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Benz CLA 쿠페 ','표준 옵션 장착 만으로도 언제나 우월함을 증명합니다','20120217', 29900000, 'CLA.PNG',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Benz GLC SUV','선택적 주행모드, GLC의 우아하고 넓은 실내 공간은 새로운 수준의 주행경험을 선사합니다','20120819', 3000000, 'marcedesbenzdasbesto.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Merecedes-AMG G 63','sens 메모리 2Giga','20121121',17000000, 'gnbe.jpeg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Flying spur','완전히 새로워진 플라잉 스퍼는 이전보다 고급진 세단 프리미엄을 기꺼이 지불하고자 합니다','20121022',31900000, 'flyingspur.PNG',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Continental GT V8','매끄러운 기술이 결합된 진정한 드라이빙 경험을 제공합니다.','20120212',73900000, 'continentalgt.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'EXP 100 GT','신형 벤틀리 컨티넨탈 GT V8은 우아한 디자인과 현대적인 장인정신','20120212',39000000, 'exp.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Bentayga','벤타이가(Bentayga)는 기술, 속도, 파워가 한데 어우러져 남다른 주행 경험을 선사하는 자동차입니다','20120212',27900000, 'bentaya.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'New Continental GT','타의 추종을 불허하는 파워, 정교한 장인정신 그리고 최첨단 자동차 기술입니다','20120212',28900000, 'newcontinenta.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Palisade','미래지향적인 이미지 및 고급스러운 감성을 높였습니다.','20120212',4900000, 'palisade.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Mustang','언제든지 가장 첨단의 머스탱과 함께 포효하십시오','20120212',68900000, 'ford.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Ford Explorer','익스플로러라는 이름 자체가 이차의 모든것을 말합니다','20120212',59900000, 'fordsuv.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Volvo XC90','직관적 기술과 연결된 서비스로 차량을 완벽히 제어할 수 있습니다','20120212',59900000, 'volvo90.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Volvo XC60','소재, 공간 활용, 디테일에 대한 관심이 어우러져 따뜻하고 매력적인 공간을 만듭니다','20120212',59900000, 'xc60.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Cross Country','매일 모든 좌석에서 즐기는 퍼스트 클래스','20120212',59900000, 'crosscountry.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Escalade','드라마틱한 앵글, 시선을 사로잡는 라이팅과 크롬 디테일이 완벽하게 조화를 이룹니다!','20120212',59900000, 'escaldae.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'CT6','성능,혁신 그리고 자동차만을 생각하는 우리의 열정을 최고 수준까지 끌어올렸습니다','20120212',59900000, 'ct6.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));



commit;



//== Page 처리을 위한 SQL 구성연습

SELECT user_id , user_name , email
FROM users
ORDER BY user_id

currentPage =2
pageSize = 3   
4 ~ 6

SELECT inner_table. * ,  ROWNUM AS row_seq
FROM (	SELECT user_id , user_name , email
				FROM users
				ORDER BY user_id ) inner_table
WHERE ROWNUM <=6;	
//==>           currentPage * paseSize


SELECT * 
FROM (	SELECT inner_table. * ,  ROWNUM AS row_seq
				FROM (	SELECT user_id , user_name , email
								FROM users
								ORDER BY user_id ) inner_table
				WHERE ROWNUM <=6 )
WHERE row_seq BETWEEN 4 AND 6;

//==> (currentPage-1) * paseSize+1           currentPage * paseSize