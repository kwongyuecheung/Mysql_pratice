/*
データベース演習I 11週目
クラス：SE1A15
制作者：コウユウショウ
作成日：2020/01/06
*/

--問１
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

--問２
mysql> insert into bike(bike_no, bname, buy_date,length,height,
    -> width,seat_height,weight,capacity,displacement,store_no)
    -> values("00001","スーパーカブ50　プロ",DATE("2021-01-06"),"1860","1050",
    -> "720","740","108","4.3","49","002");
Query OK, 1 row affected (0.01 sec)

mysql> select * from bike;
+---------+-------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| BIKE_NO | BNAME                         | BUY_DATE   | LENGTH | HEIGHT | WIDTH | SEAT_HEIGHT | WEIGHT | CAPACITY | DISPLACEMENT | STORE_NO |
+---------+-------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| 00001   | スーパーカブ50　プロ          | 2021-01-06 |   1860 |   1050 |   720 |         740 |    108 |      4.3 |           49 | 002      |
+---------+-------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
1 row in set (0.01 sec)

mysql> insert into bike(bike_no, bname, buy_date,length,height,
    ->  width,seat_height,weight,capacity,displacement,store_no)
    -> values("00002","ジャイロ　キャノピー",DATE("2021-01-06"),"1895",
    -> "1690","660","700","139","5.9","49","005");
Query OK, 1 row affected (0.00 sec)

mysql> select * from bike;
+---------+--------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| BIKE_NO | BNAME                          | BUY_DATE   | LENGTH | HEIGHT | WIDTH | SEAT_HEIGHT | WEIGHT | CAPACITY | DISPLACEMENT | STORE_NO |
+---------+--------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
| 00001   | スーパーカブ50　プロ           | 2021-01-06 |   1860 |   1050 |   720 |         740 |    108 |      4.3 |           49 | 002      |
| 00002   | ジャイロ　キャノピー           | 2021-01-06 |   1895 |   1690 |   660 |         700 |    139 |      5.9 |           49 | 005      |
+---------+--------------------------------+------------+--------+--------+-------+-------------+--------+----------+--------------+----------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--問３
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

--問４
mysql> insert into size(category,size,diff)
    -> values("ピザ","S","0"),("ピザ","M","500"),
    -> ("ピザ","L","1000"),("ドリンク","S","-30"),
    -> ("ドリンク","M","0"),("ドリンク","L","50");
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from size;
+--------------+------+------+
| CATEGORY     | SIZE | DIFF |
+--------------+------+------+
| ピザ         | S    |    0 |
| ピザ         | M    |  500 |
| ピザ         | L    | 1000 |
| ドリンク     | S    |  -30 |
| ドリンク     | M    |    0 |
| ドリンク     | L    |   50 |
+--------------+------+------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--問５
mysql> select product.PRODUCT_NO, product.PNAME,size.SIZE,(product.price + size.diff)as PRICE
    -> from product
    -> left join size on product.category = size.category
    -> where not size = "NULL"
    -> order by product.product_no;
+------------+--------------------------+------+-------+
| PRODUCT_NO | PNAME                    | SIZE | PRICE |
+------------+--------------------------+------+-------+
| 0001       | マルゲリータ             | S    |  1200 |
| 0001       | マルゲリータ             | M    |  1700 |
| 0001       | マルゲリータ             | L    |  2200 |
| 0002       | デラックスピザ           | S    |  1700 |
| 0002       | デラックスピザ           | M    |  2200 |
| 0002       | デラックスピザ           | L    |  2700 |
| 0003       | シーフードピザ           | S    |  1500 |
| 0003       | シーフードピザ           | M    |  2000 |
| 0003       | シーフードピザ           | L    |  2500 |
| 0004       | ギガミート               | S    |  2500 |
| 0004       | ギガミート               | M    |  3000 |
| 0004       | ギガミート               | L    |  3500 |
| 0005       | チキン＆ベーコン         | S    |  2200 |
| 0005       | チキン＆ベーコン         | M    |  2700 |
| 0005       | チキン＆ベーコン         | L    |  3200 |
| 0006       | BBQチキン                | S    |  2200 |
| 0006       | BBQチキン                | M    |  2700 |
| 0006       | BBQチキン                | L    |  3200 |
| 0007       | BBQシーフード            | L    |  4000 |
| 0007       | BBQシーフード            | M    |  3500 |
| 0007       | BBQシーフード            | S    |  3000 |
| 0008       | MAXチーズピザ            | L    |  4000 |
| 0008       | MAXチーズピザ            | M    |  3500 |
| 0008       | MAXチーズピザ            | S    |  3000 |
| 0009       | 夏野菜ピザ               | M    |  3000 |
| 0009       | 夏野菜ピザ               | L    |  3500 |
| 0009       | 夏野菜ピザ               | S    |  2500 |
| 2001       | コーラ                   | S    |   130 |
| 2001       | コーラ                   | L    |   210 |
| 2001       | コーラ                   | M    |   160 |
| 2002       | ゼロコーラ               | L    |   210 |
| 2002       | ゼロコーラ               | M    |   160 |
| 2002       | ゼロコーラ               | S    |   130 |
| 2003       | ジンジャエール           | S    |   130 |
| 2003       | ジンジャエール           | M    |   160 |
| 2003       | ジンジャエール           | L    |   210 |
| 2004       | メロンソーダ             | M    |   160 |
| 2004       | メロンソーダ             | L    |   210 |
| 2004       | メロンソーダ             | S    |   130 |
| 2005       | カフェラテ               | S    |   130 |
| 2005       | カフェラテ               | M    |   160 |
| 2005       | カフェラテ               | L    |   210 |
| 2006       | コーヒー                 | S    |   130 |
| 2006       | コーヒー                 | M    |   160 |
| 2006       | コーヒー                 | L    |   210 |
| 2007       | オレンジジュース         | S    |   130 |
| 2007       | オレンジジュース         | M    |   160 |
| 2007       | オレンジジュース         | L    |   210 |
| 2008       | アップルジュース         | S    |   130 |
| 2008       | アップルジュース         | M    |   160 |
| 2008       | アップルジュース         | L    |   210 |
+------------+--------------------------+------+-------+
51 rows in set (0.00 sec)

--問６
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



--問７
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

--問8
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
| 00001  | 小林友治        |      1 |
| 00002  | 小林圭輔        |      1 |
| 00003  | 友保隼平        |      3 |
| 00004  | 稲田直樹        |      2 |
| 00005  | 河井ゆずる      |      4 |
| 00006  | 村上信五        |      1 |
| 00007  | 横山裕          |      2 |
| 00008  | 大倉忠義        |      2 |
| 00009  | 安田章大        |      4 |
| 00010  | 丸山隆平        |      3 |
| 00011  | 秋元真夏        |      4 |
| 00012  | 生田絵梨花      |      2 |
| 00014  | 白石麻衣        |      4 |
| 00015  | 高山一実        |      3 |
| 00016  | 升野英知        |      1 |
| 00017  | 松村沙友里      |      2 |
| 00018  | 山名文和        |      1 |
| 00019  | 秋山賢太        |      4 |
+--------+-----------------+--------+
18 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--問9

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

--問10
mysql>  revoke select on studb.STORE from test;
Query OK, 0 rows affected (0.01 sec)