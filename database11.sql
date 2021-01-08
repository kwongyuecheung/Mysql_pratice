/*
�f�[�^�x�[�X���KI 11�T��
�N���X�FSE1A15
����ҁF�R�E���E�V���E
�쐬���F2020/01/06
*/

--��P
mysql> create table bike(
    -> BIKE_NO char(5),
    -> BNAME varchar(50),
    -> BUY_DATE date,
    -> LENGTH int(4),
    -> HEIGHT int(4),
    -> WIDTH int(4),
    -> SEAT_HEIGHT int(4),
    -> WEIGHT int(4),
    -> CAPACITY double(4,1),
    -> DISPLACEMENT int(4),
    -> STORE_NO char(3)
    -> );
Query OK, 0 rows affected, 7 warnings (0.05 sec)

mysql> show columns from bike;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| BIKE_NO      | char(5)     | YES  |     | NULL    |       |
| BNAME        | varchar(50) | YES  |     | NULL    |       |
| BUY_DATE     | date        | YES  |     | NULL    |       |
| LENGTH       | int         | YES  |     | NULL    |       |
| HEIGHT       | int         | YES  |     | NULL    |       |
| WIDTH        | int         | YES  |     | NULL    |       |
| SEAT_HEIGHT  | int         | YES  |     | NULL    |       |
| WEIGHT       | int         | YES  |     | NULL    |       |
| CAPACITY     | double(4,1) | YES  |     | NULL    |       |
| DISPLACEMENT | int         | YES  |     | NULL    |       |
| STORE_NO     | char(3)     | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
11 rows in set (0.02 sec)

--��Q
mysql> insert into bike(bike_no, bname, buy_date,length,height,
    -> width,seat_height,weight,capacity,displacement,store_no)
    -> values("00001","�X�[�p�[�J�u50�@�v��",DATE("2021-01-06"),"1860","1050",
    -> "720","740","108","4.3","49","002");
Query OK, 1 row affected (0.01 sec)

mysql> select * from bike;
+---------+-------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| BIKE_NO | BNAME                         | BUY_DATE   | LENGTH | HEIGHT | WIDTH | SEAT_HEIGHT | WEIGHT | CAPACITY | DISPLACEMENT | STORE_NO |
+---------+-------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| 00001   | �X�[�p�[�J�u50�@�v��          | 2021-01-06 |   1860 |   1050 |   720 |         740 |    108 |      4.3 |           49 | 002      |
+---------+-------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
1 row in set (0.01 sec)

mysql> insert into bike(bike_no, bname, buy_date,length,height,
    ->  width,seat_height,weight,capacity,displacement,store_no)
    -> values("00002","�W���C���@�L���m�s�[",DATE("2021-01-06"),"1895",
    -> "1690","660","700","139","5.9","49","005");
Query OK, 1 row affected (0.00 sec)

mysql> select * from bike;
+---------+--------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| BIKE_NO | BNAME                          | BUY_DATE   | LENGTH | HEIGHT | WIDTH | SEAT_HEIGHT | WEIGHT | CAPACITY | DISPLACEMENT | STORE_NO |
+---------+--------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| 00001   | �X�[�p�[�J�u50�@�v��           | 2021-01-06 |   1860 |   1050 |   720 |         740 |    108 |      4.3 |           49 | 002      |
| 00002   | �W���C���@�L���m�s�[           | 2021-01-06 |   1895 |   1690 |   660 |         700 |    139 |      5.9 |           49 | 005      |
+---------+--------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--��R
mysql> create table size(
    -> CATEGORY char(4),
    -> SIZE char(1),
    -> DIFF int(5) default "0");
Query OK, 0 rows affected, 1 warning (0.08 sec)

mysql> show columns from size;
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| CATEGORY | char(4) | YES  |     | NULL    |       |
| SIZE     | char(1) | YES  |     | NULL    |       |
| DIFF     | int     | YES  |     | 0       |       |
+----------+---------+------+-----+---------+-------+
3 rows in set (0.02 sec)

--��S
mysql> insert into size(category,size,diff)
    -> values("�s�U","S","0"),("�s�U","M","500"),
    -> ("�s�U","L","1000"),("�h�����N","S","-30"),
    -> ("�h�����N","M","0"),("�h�����N","L","50");
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from size;
+--------------+------+------+
| CATEGORY     | SIZE | DIFF |
+--------------+------+------+
| �s�U         | S    |    0 |
| �s�U         | M    |  500 |
| �s�U         | L    | 1000 |
| �h�����N     | S    |  -30 |
| �h�����N     | M    |    0 |
| �h�����N     | L    |   50 |
+--------------+------+------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--��T
mysql> select product.PRODUCT_NO, product.PNAME,size.SIZE,(product.price + size.diff)as PRICE
    -> from product
    -> left join size on product.category = size.category
    -> where not size = "NULL"
    -> order by product.product_no;
+------------+--------------------------+------+-------+
| PRODUCT_NO | PNAME                    | SIZE | PRICE |
+------------+--------------------------+------+-------+
| 0001       | �}���Q���[�^             | S    |  1200 |
| 0001       | �}���Q���[�^             | M    |  1700 |
| 0001       | �}���Q���[�^             | L    |  2200 |
| 0002       | �f���b�N�X�s�U           | S    |  1700 |
| 0002       | �f���b�N�X�s�U           | M    |  2200 |
| 0002       | �f���b�N�X�s�U           | L    |  2700 |
| 0003       | �V�[�t�[�h�s�U           | S    |  1500 |
| 0003       | �V�[�t�[�h�s�U           | M    |  2000 |
| 0003       | �V�[�t�[�h�s�U           | L    |  2500 |
| 0004       | �M�K�~�[�g               | S    |  2500 |
| 0004       | �M�K�~�[�g               | M    |  3000 |
| 0004       | �M�K�~�[�g               | L    |  3500 |
| 0005       | �`�L�����x�[�R��         | S    |  2200 |
| 0005       | �`�L�����x�[�R��         | M    |  2700 |
| 0005       | �`�L�����x�[�R��         | L    |  3200 |
| 0006       | BBQ�`�L��                | S    |  2200 |
| 0006       | BBQ�`�L��                | M    |  2700 |
| 0006       | BBQ�`�L��                | L    |  3200 |
| 0007       | BBQ�V�[�t�[�h            | L    |  4000 |
| 0007       | BBQ�V�[�t�[�h            | M    |  3500 |
| 0007       | BBQ�V�[�t�[�h            | S    |  3000 |
| 0008       | MAX�`�[�Y�s�U            | L    |  4000 |
| 0008       | MAX�`�[�Y�s�U            | M    |  3500 |
| 0008       | MAX�`�[�Y�s�U            | S    |  3000 |
| 0009       | �Ė�؃s�U               | M    |  3000 |
| 0009       | �Ė�؃s�U               | L    |  3500 |
| 0009       | �Ė�؃s�U               | S    |  2500 |
| 2001       | �R�[��                   | S    |   130 |
| 2001       | �R�[��                   | L    |   210 |
| 2001       | �R�[��                   | M    |   160 |
| 2002       | �[���R�[��               | L    |   210 |
| 2002       | �[���R�[��               | M    |   160 |
| 2002       | �[���R�[��               | S    |   130 |
| 2003       | �W���W���G�[��           | S    |   130 |
| 2003       | �W���W���G�[��           | M    |   160 |
| 2003       | �W���W���G�[��           | L    |   210 |
| 2004       | �������\�[�_             | M    |   160 |
| 2004       | �������\�[�_             | L    |   210 |
| 2004       | �������\�[�_             | S    |   130 |
| 2005       | �J�t�F���e               | S    |   130 |
| 2005       | �J�t�F���e               | M    |   160 |
| 2005       | �J�t�F���e               | L    |   210 |
| 2006       | �R�[�q�[                 | S    |   130 |
| 2006       | �R�[�q�[                 | M    |   160 |
| 2006       | �R�[�q�[                 | L    |   210 |
| 2007       | �I�����W�W���[�X         | S    |   130 |
| 2007       | �I�����W�W���[�X         | M    |   160 |
| 2007       | �I�����W�W���[�X         | L    |   210 |
| 2008       | �A�b�v���W���[�X         | S    |   130 |
| 2008       | �A�b�v���W���[�X         | M    |   160 |
| 2008       | �A�b�v���W���[�X         | L    |   210 |
+------------+--------------------------+------+-------+
51 rows in set (0.00 sec)

--��U
mysql> alter table employee rename to old_emp;
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+-----------------+
| Tables_in_studb |
+-----------------+
| bike            |
| job             |
| material        |
| old_emp         |
| product         |
| prototype       |
| rankpoint       |
| recipe          |
| size            |
| store           |
+-----------------+
10 rows in set (0.01 sec)



--��V
mysql> create table employee(
    -> EMP_NO char(5),
    -> ENAME varchar(20),
    -> BIRTHDAY date,
    -> TEL varchar(10),
    -> ADDRESS varchar(100),
    -> HIREDATE date,
    -> JOB_NO int(1),
    -> RANK_POINT int(4),
    -> SALARY int(4),
    -> WORK_STORE char(3),
    -> MGR_NO char(5));
Query OK, 0 rows affected, 3 warnings (0.10 sec)

mysql> show columns from employee;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| EMP_NO     | char(5)      | YES  |     | NULL    |       |
| ENAME      | varchar(20)  | YES  |     | NULL    |       |
| BIRTHDAY   | date         | YES  |     | NULL    |       |
| TEL        | varchar(10)  | YES  |     | NULL    |       |
| ADDRESS    | varchar(100) | YES  |     | NULL    |       |
| HIREDATE   | date         | YES  |     | NULL    |       |
| JOB_NO     | int          | YES  |     | NULL    |       |
| RANK_POINT | int          | YES  |     | NULL    |       |
| SALARY     | int          | YES  |     | NULL    |       |
| WORK_STORE | char(3)      | YES  |     | NULL    |       |
| MGR_NO     | char(5)      | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
11 rows in set (0.02 sec)

--��8
mysql> insert into employee
    -> select emp_no, ename, birthday,
    -> tel,address, hiredate,j.job_no, rank_point,
    -> salary,work_store, mgr_no
    -> from old_emp o
    -> inner join job j on o.job = j.jname;
Query OK, 18 rows affected (0.01 sec)
Records: 18  Duplicates: 0  Warnings: 0

mysql> select EMP_NO, ENAME, JOB_NO
    -> from employee;
+--------+-----------------+--------+
| EMP_NO | ENAME           | JOB_NO |
+--------+-----------------+--------+
| 00001  | ���їF��        |      1 |
| 00002  | ���ь\��        |      1 |
| 00003  | �F�۔���        |      3 |
| 00004  | ��c����        |      2 |
| 00005  | �͈�䂸��      |      4 |
| 00006  | ����M��        |      1 |
| 00007  | ���R�T          |      2 |
| 00008  | ��q���`        |      2 |
| 00009  | ���c�͑�        |      4 |
| 00010  | �ێR����        |      3 |
| 00011  | �H���^��        |      4 |
| 00012  | ���c�G����      |      2 |
| 00014  | ���Ζ���        |      4 |
| 00015  | ���R���        |      3 |
| 00016  | ����p�m        |      1 |
| 00017  | �������F��      |      2 |
| 00018  | �R�����a        |      1 |
| 00019  | �H�R����        |      4 |
+--------+-----------------+--------+
18 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--��9

mysql> drop table old_emp;
Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
+-----------------+
| Tables_in_studb |
+-----------------+
| bike            |
| employee        |
| job             |
| material        |
| product         |
| prototype       |
| rankpoint       |
| recipe          |
| size            |
| store           |
+-----------------+
10 rows in set (0.01 sec)

--��10
mysql>  revoke select on studb.STORE from test;
Query OK, 0 rows affected (0.01 sec)