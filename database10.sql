/*
�f�[�^�x�[�X���KI 10�T��
�N���X�FSE1A15
����ҁF�R�E���E�V���E
�쐬���F2020/12/09
*/

--��P
mysql> select min(salary) as "MIN(SAL)"
    -> from employee
    -> where salary in(select MAX(SALARY) from employee group by work_store);
+----------+
| MIN(SAL) |
+----------+
|      800 |
+----------+
1 row in set (0.01 sec)

--��Q
mysql> insert into prototype(PROTOTYPE_NO,PROTONAME,CATEGORY,PRICE)
    -> values("9003","�~�b�N�X�W���[�X","�h�����N","200");
Query OK, 1 row affected (0.03 sec)

mysql> select * from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 9001         | MAX�`�[�Y�s�U            | �s�U         |  3000 |
| 9002         | �Ė�؃s�U               | �s�U         |  3000 |
| 9003         | �~�b�N�X�W���[�X         | �h�����N     |   200 |
+--------------+--------------------------+--------------+-------+
3 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.03 sec)

--��R
mysql> update prototype
    -> set price = (select price from product where pname = "�M�K�~�[�g")
    -> where protoname = "�Ė�؃s�U";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select* from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 9001         | MAX�`�[�Y�s�U            | �s�U         |  3000 |
| 9002         | �Ė�؃s�U               | �s�U         |  2500 |
| 9003         | �~�b�N�X�W���[�X         | �h�����N     |   200 |
+--------------+--------------------------+--------------+-------+
3 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--��S
mysql> select* from prototype as p
    -> where exists (select "x" from recipe as r
    -> where p.prototype_no = r.product_no);
+--------------+--------------------+----------+-------+
| PROTOTYPE_NO | PROTONAME          | CATEGORY | PRICE |
+--------------+--------------------+----------+-------+
| 9001         | MAX�`�[�Y�s�U      | �s�U     |  3000 |
| 9002         | �Ė�؃s�U         | �s�U     |  2500 |
+--------------+--------------------+----------+-------+
2 rows in set (0.01 sec)

--��T
mysql> select * from material as m
    -> where not exists(select "x" from recipe as r
    -> where m.material_no = r.material_no);
+-------------+--------------------+--------------+------+
| MATERIAL_NO | MNAME              | ORIGIN       | COST |
+-------------+--------------------+--------------+------+
| 00024       | �S�[�_�`�[�Y       | �I�����_     |  550 |
+-------------+--------------------+--------------+------+
1 row in set (0.00 sec)

��U
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



��V
mysql> update prototype
    -> set prototype_no =(select LPAD(MAX(product_no+1),4,"00") from product
    -> where category = "�s�U")
    -> where  prototype_no = "9001";
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update prototype
    -> set prototype_no =(select LPAD(MAX(product_no+2),4,"00") from product
    -> where category = "�s�U")
    -> where  prototype_no = "9002";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select* from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 0008         | MAX�`�[�Y�s�U            | �s�U         |  3000 |
| 0009         | �Ė�؃s�U               | �s�U         |  2500 |
| 9003         | �~�b�N�X�W���[�X         | �h�����N     |   200 |
+--------------+--------------------------+--------------+-------+
3 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

��8
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

��9
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
| 0008       | MAX�`�[�Y�s�U      | �s�U     |  3000 |
| 0009       | �Ė�؃s�U         | �s�U     |  2500 |
+------------+--------------------+----------+-------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

��10
mysql> delete from prototype
    -> where prototype_no = "0008" or prototype_no = "0009"
    -> ;
Query OK, 2 rows affected (0.01 sec)

mysql> select* from prototype;
+--------------+--------------------------+--------------+-------+
| PROTOTYPE_NO | PROTONAME                | CATEGORY     | PRICE |
+--------------+--------------------------+--------------+-------+
| 9003         | �~�b�N�X�W���[�X         | �h�����N     |   200 |
+--------------+--------------------------+--------------+-------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)