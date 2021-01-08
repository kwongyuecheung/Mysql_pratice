/*
�f�[�^�x�[�X���KI 8�T��
�N���X�FSE1A15
����ҁF�R�E���E�V���E
�쐬���F2020/11/25
*/

--��P
mysql> select e.EMP_NO, e.ENAME, e.MGR_NO,m.ENAME
    -> from employee as e
    -> left  join employee as m
    -> on(e.mgr_no = m.emp_no);
+--------+-----------------+--------+--------------+
| EMP_NO | ENAME           | MGR_NO | ENAME        |
+--------+-----------------+--------+--------------+
| 00001  | ���їF��        | NULL   | NULL         |
| 00002  | ���ь\��        | 00001  | ���їF��     |
| 00003  | �F�۔���        | 00002  | ���ь\��     |
| 00004  | ��c����        | 00002  | ���ь\��     |
| 00005  | �͈�䂸��      | 00002  | ���ь\��     |
| 00006  | ����M��        | 00001  | ���їF��     |
| 00007  | ���R�T          | 00006  | ����M��     |
| 00008  | ��q���`        | 00006  | ����M��     |
| 00009  | ���c�͑�        | 00006  | ����M��     |
| 00010  | �ێR����        | 00006  | ����M��     |
| 00011  | �H���^��        | 00016  | ����p�m     |
| 00012  | ���c�G����      | 00016  | ����p�m     |
| 00014  | ���Ζ���        | 00016  | ����p�m     |
| 00015  | ���R���        | 00016  | ����p�m     |
| 00016  | ����p�m        | 00001  | ���їF��     |
| 00017  | �������F��      | 00016  | ����p�m     |
| 00018  | �R�����a        | NULL   | NULL         |
| 00019  | �H�R����        | NULL   | NULL         |
+--------+-----------------+--------+--------------+
18 rows in set (0.00 sec)

--��Q
mysql> select e.WORK_STORE, s.SNAME, e.ENAME,e.MGR_NO,m.ENAME
    -> from employee as e
    -> left join store as s
    -> on(e.work_store = s.store_no)
    -> left join employee as m
    -> on(e.mgr_no = m.emp_no)
    -> order by e.WORK_STORE;
+------------+--------------+-----------------+--------+--------------+
| WORK_STORE | SNAME        | ENAME           | MGR_NO | ENAME        |
+------------+--------------+-----------------+--------+--------------+
| NULL       | NULL         | �H�R����        | NULL   | NULL         |
| 001        | ���蒬�X     | ���ь\��        | 00001  | ���їF��     |
| 001        | ���蒬�X     | �F�۔���        | 00002  | ���ь\��     |
| 001        | ���蒬�X     | ��c����        | 00002  | ���ь\��     |
| 001        | ���蒬�X     | �͈�䂸��      | 00002  | ���ь\��     |
| 002        | �X�m�{�X     | ����M��        | 00001  | ���їF��     |
| 002        | �X�m�{�X     | ���R�T          | 00006  | ����M��     |
| 002        | �X�m�{�X     | ��q���`        | 00006  | ����M��     |
| 002        | �X�m�{�X     | ���c�͑�        | 00006  | ����M��     |
| 002        | �X�m�{�X     | �ێR����        | 00006  | ����M��     |
| 003        | ����X       | ���їF��        | NULL   | NULL         |
| 004        | NULL         | �R�����a        | NULL   | NULL         |
| 005        | ���{��X     | �H���^��        | 00016  | ����p�m     |
| 005        | ���{��X     | ���c�G����      | 00016  | ����p�m     |
| 005        | ���{��X     | ���Ζ���        | 00016  | ����p�m     |
| 005        | ���{��X     | ���R���        | 00016  | ����p�m     |
| 005        | ���{��X     | ����p�m        | 00001  | ���їF��     |
| 005        | ���{��X     | �������F��      | 00016  | ����p�m     |
+------------+--------------+-----------------+--------+--------------+
18 rows in set (0.00 sec)

--��R
mysql> update employee
    -> set
    -> job = "�X��",
    -> rank_point = "1200",
    -> work_store = "006",
    -> mgr_no = "00001"
    -> where ename = "�R�����a";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee
    ->  set
    -> job = "����",
    ->  rank_point = "100",
    -> work_store = "006",
    -> mgr_no = "00018"
    -> where ename = "�H�R����";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

--��S
mysql> select EMP_NO, ENAME, JOB, RANK_POINT, WORK_STORE, MGR_NO
    -> from employee
    -> where work_store = 006;
+--------+--------------+--------+------------+------------+--------+
| EMP_NO | ENAME        | JOB    | RANK_POINT | WORK_STORE | MGR_NO |
+--------+--------------+--------+------------+------------+--------+
| 00018  | �R�����a     | �X��   |       1200 | 006        | 00001  |
| 00019  | �H�R����     | ����   |        100 | 006        | 00018  |
+--------+--------------+--------+------------+------------+--------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--��T
mysql> select PRODUCT_NO,PNAME,PRICE
    -> from product
    -> where category = "�s�U"
    -> union
    -> select prototype_no as PRODUCT_NO, PROTONAME as PNAME,price
    -> from prototype;
+------------+--------------------------+-------+
| PRODUCT_NO | PNAME                    | PRICE |
+------------+--------------------------+-------+
| 0001       | �}���Q���[�^             |  1200 |
| 0002       | �f���b�N�X�s�U           |  1700 |
| 0003       | �V�[�t�[�h�s�U           |  1500 |
| 0004       | �M�K�~�[�g               |  2500 |
| 0005       | �`�L�����x�[�R��         |  2200 |
| 0006       | BBQ�`�L��                |  2200 |
| 0007       | BBQ�V�[�t�[�h            |  3000 |
| 9001       | MAX�`�[�Y�s�U            |  3000 |
| 9002       | �Ė�؃s�U               |  3000 |
+------------+--------------------------+-------+
9 rows in set (0.00 sec)

��U
mysql> select p.PRODUCT_NO, p.PNAME,m.MNAME,r.QUANTITY
    -> from product as p
    -> left join recipe as r
    -> on(p.product_no = r.product_no)
    -> left join material as m
    -> on(r.material_no = m.material_no)
    -> where p.pname like "%BBQ%";
+------------+--------------------+-----------------------+----------+
| PRODUCT_NO | PNAME              | MNAME                 | QUANTITY |
+------------+--------------------+-----------------------+----------+
| 0006       | BBQ�`�L��          | �`�[�Y                |        1 |
| 0006       | BBQ�`�L��          | ���[�X�g�`�L��        |        3 |
| 0006       | BBQ�`�L��          | �R�[��                |        1 |
| 0006       | BBQ�`�L��          | �g�}�g�\�[�X          |        1 |
| 0006       | BBQ�`�L��          | �z���C�g�\�[�X        |        1 |
| 0007       | BBQ�V�[�t�[�h      | NULL                  |     NULL |
+------------+--------------------+-----------------------+----------+
6 rows in set (0.01 sec)

��V
mysql> select r.PRODUCT_NO,p.PNAME,m.MNAME,r.QUANTITY
    ->  from recipe as r
    -> left join product as p
    -> on(r.product_no = p.product_no)
    -> left join material as m
    -> on(r.material_no = m.material_no)
    -> where p.pname IS NULL;
+------------+-------+-----------------------------+----------+
| PRODUCT_NO | PNAME | MNAME                       | QUANTITY |
+------------+-------+-----------------------------+----------+
| 9001       | NULL  | �`�[�Y                      |        1 |
| 9001       | NULL  | ���b�c�@�����`�[�Y          |        2 |
| 9001       | NULL  | �p�����U���`�[�Y            |        2 |
| 9001       | NULL  | �`�F�_�[�`�[�Y              |        2 |
| 9001       | NULL  | �u���[�`�[�Y                |        2 |
| 9001       | NULL  | ���C�v���\�[�X              |        1 |
| 9002       | NULL  | �`�[�Y                      |        1 |
| 9002       | NULL  | �o�W��                      |        1 |
| 9002       | NULL  | �g�}�g                      |        1 |
| 9002       | NULL  | �s�[�}��                    |        1 |
| 9002       | NULL  | �I�j�I��                    |        1 |
| 9002       | NULL  | �A�X�p���K�X                |        1 |
| 9002       | NULL  | �R�[��                      |        1 |
| 9002       | NULL  | �i�X                        |        1 |
| 9002       | NULL  | �z���C�g�\�[�X              |        1 |
| 9003       | NULL  | �`�[�Y                      |        1 |
| 9003       | NULL  | �p�����U���`�[�Y            |        1 |
| 9003       | NULL  | �V�[�t�[�h�~�b�N�X          |        1 |
| 9003       | NULL  | �g�}�g                      |        1 |
| 9003       | NULL  | �s�[�}��                    |        1 |
| 9003       | NULL  | �o�[�x�L���[�\�[�X          |        1 |
+------------+-------+-----------------------------+----------+
21 rows in set (0.00 sec)

��8
mysql> select p.PROTOTYPE_NO, p.PROTONAME, m.MNAME, r.QUANTITY
    -> from prototype as p
    -> left join recipe as r
    -> on(r.product_no = p.PROTOTYPE_NO)
    -> left join material as m
    -> on(r.material_no = m.material_no);
+--------------+--------------------+-----------------------------+----------+
| PROTOTYPE_NO | PROTONAME          | MNAME                       | QUANTITY |
+--------------+--------------------+-----------------------------+----------+
| 9001         | MAX�`�[�Y�s�U      | �`�[�Y                      |        1 |
| 9001         | MAX�`�[�Y�s�U      | ���b�c�@�����`�[�Y          |        2 |
| 9001         | MAX�`�[�Y�s�U      | �p�����U���`�[�Y            |        2 |
| 9001         | MAX�`�[�Y�s�U      | �`�F�_�[�`�[�Y              |        2 |
| 9001         | MAX�`�[�Y�s�U      | �u���[�`�[�Y                |        2 |
| 9001         | MAX�`�[�Y�s�U      | ���C�v���\�[�X              |        1 |
| 9002         | �Ė�؃s�U         | �`�[�Y                      |        1 |
| 9002         | �Ė�؃s�U         | �o�W��                      |        1 |
| 9002         | �Ė�؃s�U         | �g�}�g                      |        1 |
| 9002         | �Ė�؃s�U         | �s�[�}��                    |        1 |
| 9002         | �Ė�؃s�U         | �I�j�I��                    |        1 |
| 9002         | �Ė�؃s�U         | �A�X�p���K�X                |        1 |
| 9002         | �Ė�؃s�U         | �R�[��                      |        1 |
| 9002         | �Ė�؃s�U         | �i�X                        |        1 |
| 9002         | �Ė�؃s�U         | �z���C�g�\�[�X              |        1 |
+--------------+--------------------+-----------------------------+----------+
15 rows in set (0.00 sec)

��9
mysql> update recipe
    -> set product_no = "0007"
    -> where product_no = "9003";
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select r.PRODUCT_NO,p.PNAME,m.MNAME,r.QUANTITY
    -> from recipe as r
    -> left join product as p
    -> on(r.product_no = p.product_no)
    -> left join material as m
    -> on(r.material_no = m.material_no)
    -> where r.product_no = "0007";
+------------+--------------------+-----------------------------+----------+
| PRODUCT_NO | PNAME              | MNAME                       | QUANTITY |
+------------+--------------------+-----------------------------+----------+
| 0007       | BBQ�V�[�t�[�h      | �`�[�Y                      |        1 |
| 0007       | BBQ�V�[�t�[�h      | �p�����U���`�[�Y            |        1 |
| 0007       | BBQ�V�[�t�[�h      | �V�[�t�[�h�~�b�N�X          |        1 |
| 0007       | BBQ�V�[�t�[�h      | �g�}�g                      |        1 |
| 0007       | BBQ�V�[�t�[�h      | �s�[�}��                    |        1 |
| 0007       | BBQ�V�[�t�[�h      | �o�[�x�L���[�\�[�X          |        1 |
+------------+--------------------+-----------------------------+----------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)