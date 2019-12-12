
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
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '����� ���ʱ�', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

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
           
           
insert into product values (seq_product_prod_no.nextval,'�� ������Ƽ ���ݶ�','���ݶ� GTS�� ž��� Ʈ�� �ͺ� V8���� ��ŭ �¸��� �Ǹ� �����ϴ� ������ ���� ���Դϴ�','20120514',159900000, 'MaseratiLevanteW.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'���ݶ� Ʈ�����','�ü� 300km�� �Ѵ� �ְ� �ӵ��� ���� SUV ���׸�Ʈ���� ���� ���� ��ġ�� �ڸ��ű��߽��ϴ�','20120514',23900000, 'MaseratiLevantet.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'�׶��������� ������','�׶��������� ����Ʈ�� �����븦 ��� �������� ���۵Ǵ� �ż���� ����� �ε��մϴ�','20120201',39900000, 'GT25.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Benz CLA ���� ','ǥ�� �ɼ� ���� �����ε� ������ ������� �����մϴ�','20120217', 29900000, 'CLA.PNG',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Benz GLC SUV','������ ������, GLC�� ����ϰ� ���� �ǳ� ������ ���ο� ������ ��������� �����մϴ�','20120819', 3000000, 'marcedesbenzdasbesto.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Merecedes-AMG G 63','sens �޸� 2Giga','20121121',17000000, 'gnbe.jpeg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Flying spur','������ ���ο��� �ö��� ���۴� �������� ����� ���� �����̾��� �Ⲩ�� �����ϰ��� �մϴ�','20121022',31900000, 'flyingspur.PNG',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Continental GT V8','�Ų����� ����� ���յ� ������ ����̺� ������ �����մϴ�.','20120212',73900000, 'continentalgt.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'EXP 100 GT','���� ��Ʋ�� ��Ƽ��Ż GT V8�� ����� �����ΰ� �������� ��������','20120212',39000000, 'exp.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Bentayga','��Ÿ�̰�(Bentayga)�� ���, �ӵ�, �Ŀ��� �ѵ� ��췯�� ���ٸ� ���� ������ �����ϴ� �ڵ����Դϴ�','20120212',27900000, 'bentaya.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'New Continental GT','Ÿ�� ������ �����ϴ� �Ŀ�, ������ �������� �׸��� ��÷�� �ڵ��� ����Դϴ�','20120212',28900000, 'newcontinenta.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Palisade','�̷��������� �̹��� �� ��޽����� ������ �������ϴ�.','20120212',4900000, 'palisade.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Mustang','�������� ���� ÷���� �ӽ��ʰ� �Բ� ��ȿ�Ͻʽÿ�','20120212',68900000, 'ford.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Ford Explorer','�ͽ��÷η���� �̸� ��ü�� ������ ������ ���մϴ�','20120212',59900000, 'fordsuv.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Volvo XC90','������ ����� ����� ���񽺷� ������ �Ϻ��� ������ �� �ֽ��ϴ�','20120212',59900000, 'volvo90.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Volvo XC60','����, ���� Ȱ��, �����Ͽ� ���� ������ ��췯�� �����ϰ� �ŷ����� ������ ����ϴ�','20120212',59900000, 'xc60.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Cross Country','���� ��� �¼����� ���� �۽�Ʈ Ŭ����','20120212',59900000, 'crosscountry.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'Escalade','���ƽ�� �ޱ�, �ü��� ������ �����ð� ũ�� �������� �Ϻ��ϰ� ��ȭ�� �̷�ϴ�!','20120212',59900000, 'escaldae.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));
insert into product values (seq_product_prod_no.nextval,'CT6','����,���� �׸��� �ڵ������� �����ϴ� �츮�� ������ �ְ� ���ر��� ����÷Ƚ��ϴ�','20120212',59900000, 'ct6.PNG',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'));



commit;



//== Page ó���� ���� SQL ��������

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