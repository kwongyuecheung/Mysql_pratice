/*
�f�[�^�x�[�X���KI 5�T��
�N���X�FSE1A15
����ҁF�R�E���E�V���E
�쐬���F2020/10/28
*/

--��P
mysql> select date_format(now(),'%y/%m/%d %H:%i:%s') as '���ݓ��t';
+-------------------+
| ���ݓ��t          |
+-------------------+
| 20/10/28 09:55:19 |
+-------------------+
1 row in set (0.00 sec)

--��Q
mysql> select * from prototype;
+--------------+-----------------------------------+----------+-------+
| PROTOTYPE_NO | PROTONAME                         | CATEGORY | PRICE |
+--------------+-----------------------------------+----------+-------+
| 9001         | MAX�`�[�Y�s�U                     | �s�U     |  3000 |
| 9002         | �Ė�؃s�U                        | �s�U     |  3000 |
| 9003         | �o�[�x�L���[�V�[�t�[�h            | �s�U     |  3000 |
+--------------+-----------------------------------+----------+-------+
3 rows in set (0.35 sec)

--��R
mysql> insert into product(product_no,pname,category,price)
    -> values('0007','�o�[�x�L���[�V�[�t�[�h','�s�U','3000');
Query OK, 1 row affected (0.01 sec)

mysql> select * from product
    -> where product_no = '0007';
+------------+-----------------------------------+----------+-------+
| PRODUCT_NO | PNAME                             | CATEGORY | PRICE |
+------------+-----------------------------------+----------+-------+
| 0007       | �o�[�x�L���[�V�[�t�[�h            | �s�U     |  3000 |
+------------+-----------------------------------+----------+-------+
1 row in set (0.01 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)
mysql> delete from prototype
    -> where prototype_no = '9003';
Query OK, 1 row affected (0.01 sec)

mysql> select*from prototype;
+--------------+--------------------+----------+-------+
| PROTOTYPE_NO | PROTONAME          | CATEGORY | PRICE |
+--------------+--------------------+----------+-------+
| 9001         | MAX�`�[�Y�s�U      | �s�U     |  3000 |
| 9002         | �Ė�؃s�U         | �s�U     |  3000 |
+--------------+--------------------+----------+-------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--��S
mysql> select product_no,pname from product
    -> where char_length(pname)>=9;
+------------+-----------------------------------+
| product_no | pname                             |
+------------+-----------------------------------+
| 0006       | �o�[�x�L���[�`�L��                |
| 1013       | �X�g���x���[�A�C�X                |
| 0007       | �o�[�x�L���[�V�[�t�[�h            |
+------------+-----------------------------------+
3 rows in set (0.00 sec)


--��T
mysql> update product
    -> set pname = replace(pname,'�o�[�x�L���[','BBQ')
    -> where product_no = '0006';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  update product
    -> set pname = replace(pname,'�o�[�x�L���[','BBQ')
    -> where product_no = '0007';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select* from product
    -> where product_no = '0006' or
    ->  product_no = '0007';
+------------+--------------------+----------+-------+
| PRODUCT_NO | PNAME              | CATEGORY | PRICE |
+------------+--------------------+----------+-------+
| 0006       | BBQ�`�L��          | �s�U     |  2200 |
| 0007       | BBQ�V�[�t�[�h      | �s�U     |  3000 |
+------------+--------------------+----------+-------+
2 rows in set (0.00 sec)
mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--��6
mysql> select CATEGORY,PNAME,truncate(price*0.85,0)as PRICE
    -> from product
    -> order by product_no;
+--------------+-----------------------------+-------+
| CATEGORY     | PNAME                       | PRICE |
+--------------+-----------------------------+-------+
| �s�U         | �}���Q���[�^                |  1020 |
| �s�U         | �f���b�N�X�s�U              |  1445 |
| �s�U         | �V�[�t�[�h�s�U              |  1275 |
| �s�U         | �M�K�~�[�g                  |  2125 |
| �s�U         | �`�L�����x�[�R��            |  1870 |
| �s�U         | BBQ�`�L��                   |  1870 |
| �s�U         | BBQ�V�[�t�[�h               |  2550 |
| �T�C�h       | �|�e�g�t���C                |   323 |
| �T�C�h       | �R���\���|�e�g              |   323 |
| �T�C�h       | �o�^�[�|�e�g                |   323 |
| �T�C�h       | �`�L���i�Q�b�g              |   382 |
| �T�C�h       | �V�[�U�[�T���_              |   467 |
| �T�C�h       | ���܂���T���_              |   433 |
| �T�C�h       | �R�[���|�^�[�W��            |   178 |
| �T�C�h       | �N�����`���E�_�[            |   204 |
| �T�C�h       | �~�l�X�g���[�l              |   204 |
| �T�C�h       | ���܂���T���_              |   433 |
| �T�C�h       | �G�b�O�^���g                |   221 |
| �T�C�h       | �A�b�v���p�C                |   212 |
| �T�C�h       | �o�j���A�C�X                |   314 |
| �T�C�h       | �X�g���x���[�A�C�X          |   314 |
| �h�����N     | �R�[��                      |   136 |
| �h�����N     | �[���R�[��                  |   136 |
| �h�����N     | �W���W���G�[��              |   136 |
| �h�����N     | �������\�[�_                |   136 |
| �h�����N     | �J�t�F���e                  |   136 |
| �h�����N     | �R�[�q�[                    |   136 |
| �h�����N     | �I�����W�W���[�X            |   136 |
| �h�����N     | �A�b�v���W���[�X            |   136 |
| ���̑�       | �^�o�X�R                    |   212 |
| ���̑�       | �ۉ��o�b�N                  |   425 |
| ���̑�       | �G�R�o�b�N                  |   340 |
+--------------+-----------------------------+-------+
32 rows in set (0.01 sec)

--��7
mysql> insert into employee(emp_no,ename,birthday,tel,address,hiredate,job,rank_point,salary,work_store,mgr_no)
    -> values('00017','�������F��','1992-8-27','0332229876','�����s�`���R�P�\�Q�S',date_add(now(),interval -14 day),'�z�B','0','850','005','00016');
Query OK, 1 row affected, 1 warning (0.03 sec)

mysql> select* from employee
    -> where emp_no = '00017';
+--------+-----------------+------------+------------+--------------------------------------+------------+--------+------------+--------+------------+--------+
| EMP_NO | ENAME           | BIRTHDAY   | TEL        | ADDRESS                              | HIREDATE   | JOB    | RANK_POINT | SALARY | WORK_STORE | MGR_NO |
+--------+-----------------+------------+------------+--------------------------------------+------------+--------+------------+--------+------------+--------+
| 00017  | �������F��      | 1992-08-27 | 0332229876 | �����s�`���R�P�\�Q�S              | 2020-10-14 | �z�B   |          0 |    850 | 005        | 00016  |
+--------+-----------------+------------+------------+--------------------------------------+------------+--------+------------+--------+------------+--------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)


--��8
mysql> select ENAME, replace(tel,substr(tel,1,6),'XXXXXX') as TEL,
    -> JOB,date_format(HIREDATE,'%Y/%m/%d����') as HIREDATE
    -> from employee
    ->  where work_store = '005';
+-----------------+------------+--------+------------------+
| ENAME           | TEL        | JOB    | HIREDATE         |
+-----------------+------------+--------+------------------+
| �H���^��        | XXXXXX2222 | ����   | 2015/05/10����   |
| ���c�G����      | XXXXXX3333 | �z�B   | 2015/05/10����   |
| ���Ζ���        | XXXXXX5555 | ����   | 2016/10/01����   |
| ���R���        | XXXXXX6666 | ��t   | 2015/09/25����   |
| ����p�m        | XXXXXX1234 | �X��   | 2020/09/01����   |
| �������F��      | XXXXXX9876 | �z�B   | 2020/10/14����   |
+-----------------+------------+--------+------------------+
6 rows in set (0.00 sec)

--��9
mysql>  select ENAME, datediff(now(),hiredate)as '�ݐГ���'
    -> from employee
    -> where work_store = '005';
+-----------------+--------------+
| ENAME           | �ݐГ���     |
+-----------------+--------------+
| �H���^��        |         1998 |
| ���c�G����      |         1998 |
| ���Ζ���        |         1488 |
| ���R���        |         1860 |
| ����p�m        |           57 |
| �������F��      |           14 |
+-----------------+--------------+
6 rows in set (0.00 sec)


--��10

mysql> update employee
    -> set rank_point = rank_point + 100
    -> where datediff(now(),hiredate) < 30;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select EMP_NO, ENAME,RANK_POINT
    -> from employee
    -> where EMP_NO = '00017';
+--------+-----------------+------------+
| EMP_NO | ENAME           | RANK_POINT |
+--------+-----------------+------------+
| 00017  | �������F��      |        100 |
+--------+-----------------+------------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)