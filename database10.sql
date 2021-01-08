/*
データベース演習I 10週目
クラス：SE1A15
制作者：コウユウショウ
作成日：2020/12/09
*/

--問１
mysql> select min(salary) as "MIN(SAL)"
    -> from employee
    -> where salary in(select MAX(SALARY) from employee group by work_store);
+----------+
| MIN(SAL) |
+----------+
|      800 |
+----------+
1 row in set (0.01 sec)

--問２
mysql> insert into prototype(PROTOTYPE_NO,PROTONAME,CATEGORY,PRICE)
    -> values("9003","ミックスジュース","ドリンク","200");
Query OK, 1 row affected (0.03 sec)

mysql> select * from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 9001         | MAXチーズピザ            | ピザ         |  3000 |
| 9002         | 夏野菜ピザ               | ピザ         |  3000 |
| 9003         | ミックスジュース         | ドリンク     |   200 |
+--------------+--------------------------+--------------+-------+
3 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.03 sec)

--問３
mysql> update prototype
    -> set price = (select price from product where pname = "ギガミート")
    -> where protoname = "夏野菜ピザ";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select* from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 9001         | MAXチーズピザ            | ピザ         |  3000 |
| 9002         | 夏野菜ピザ               | ピザ         |  2500 |
| 9003         | ミックスジュース         | ドリンク     |   200 |
+--------------+--------------------------+--------------+-------+
3 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--問４
mysql> select* from prototype as p
    -> where exists (select "x" from recipe as r
    -> where p.prototype_no = r.product_no);
+--------------+--------------------+----------+-------+
| PROTOTYPE_NO | PROTONAME          | CATEGORY | PRICE |
+--------------+--------------------+----------+-------+
| 9001         | MAXチーズピザ      | ピザ     |  3000 |
| 9002         | 夏野菜ピザ         | ピザ     |  2500 |
+--------------+--------------------+----------+-------+
2 rows in set (0.01 sec)

--問５
mysql> select * from material as m
    -> where not exists(select "x" from recipe as r
    -> where m.material_no = r.material_no);
+-------------+--------------------+--------------+------+
| MATERIAL_NO | MNAME              | ORIGIN       | COST |
+-------------+--------------------+--------------+------+
| 00024       | ゴーダチーズ       | オランダ     |  550 |
+-------------+--------------------+--------------+------+
1 row in set (0.00 sec)

問６
mysql> insert into recipe
    -> values("9001","00024","1");
Query OK, 1 row affected (0.00 sec)

mysql> select * from recipe
    -> where product_no = "9001";
+------------+-------------+----------+
| PRODUCT_NO | MATERIAL_NO | QUANTITY |
+------------+-------------+----------+
| 9001       | 00001       |        1 |
| 9001       | 00002       |        2 |
| 9001       | 00003       |        2 |
| 9001       | 00004       |        2 |
| 9001       | 00005       |        2 |
| 9001       | 00023       |        1 |
| 9001       | 00024       |        1 |
+------------+-------------+----------+
7 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)



問７
mysql> update prototype
    -> set prototype_no =(select LPAD(MAX(product_no+1),4,"00") from product
    -> where category = "ピザ")
    -> where  prototype_no = "9001";
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update prototype
    -> set prototype_no =(select LPAD(MAX(product_no+2),4,"00") from product
    -> where category = "ピザ")
    -> where  prototype_no = "9002";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select* from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 0008         | MAXチーズピザ            | ピザ         |  3000 |
| 0009         | 夏野菜ピザ               | ピザ         |  2500 |
| 9003         | ミックスジュース         | ドリンク     |   200 |
+--------------+--------------------------+--------------+-------+
3 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

問8
mysql> update recipe
    -> set product_no = "0008"
    -> where product_no = "9001";
Query OK, 7 rows affected (0.01 sec)
Rows matched: 7  Changed: 7  Warnings: 0

mysql> update recipe
    -> set product_no = "0009"
    -> where product_no = "9002";
Query OK, 9 rows affected (0.00 sec)
Rows matched: 9  Changed: 9  Warnings: 0

mysql> select * from recipe
    -> where product_no > 7
    -> order by product_no;
+------------+-------------+----------+
| PRODUCT_NO | MATERIAL_NO | QUANTITY |
+------------+-------------+----------+
| 0008       | 00001       |        1 |
| 0008       | 00002       |        2 |
| 0008       | 00003       |        2 |
| 0008       | 00004       |        2 |
| 0008       | 00005       |        2 |
| 0008       | 00023       |        1 |
| 0008       | 00024       |        1 |
| 0009       | 00001       |        1 |
| 0009       | 00012       |        1 |
| 0009       | 00014       |        1 |
| 0009       | 00015       |        1 |
| 0009       | 00016       |        1 |
| 0009       | 00017       |        1 |
| 0009       | 00018       |        1 |
| 0009       | 00019       |        1 |
| 0009       | 00021       |        1 |
+------------+-------------+----------+
16 rows in set (0.01 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

問9
mysql> insert into product( PRODUCT_NO,  PNAME,  CATEGORY,  PRICE )
    -> select PROTOTYPE_NO,  PROTONAME,  CATEGORY,  PRICE from prototype
    -> where prototype_no < 10;
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from product
    -> where product_no = "0008" or product_no = "0009";
+------------+--------------------+----------+-------+
| PRODUCT_NO | PNAME              | CATEGORY | PRICE |
+------------+--------------------+----------+-------+
| 0008       | MAXチーズピザ      | ピザ     |  3000 |
| 0009       | 夏野菜ピザ         | ピザ     |  2500 |
+------------+--------------------+----------+-------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

問10
mysql> delete from prototype
    -> where prototype_no = "0008" or prototype_no = "0009"
    -> ;
Query OK, 2 rows affected (0.01 sec)

mysql> select* from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 9003         | ミックスジュース         | ドリンク     |   200 |
+--------------+--------------------------+--------------+-------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)