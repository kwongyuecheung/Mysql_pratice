/*
�f�[�^�x�[�X���KI 3�T��
�N���X�FSE1A15
����ҁF�R�E���E�V���E
�쐬���F2020/10/14
*/

--��P
mysql> select * from material
    -> where mname like '%�`�[�Y%';
+-------------+-----------------------------+-----------------+------+
| MATERIAL_NO | MNAME                       | ORIGIN          | COST |
+-------------+-----------------------------+-----------------+------+
| 00001       | �`�[�Y                      | �k�C��          |   50 |
| 00002       | ���b�c�@�����`�[�Y          | �k�C��          |  700 |
| 00003       | �p�����U���`�[�Y            | �C�^���A        |  450 |
| 00004       | �`�F�_�[�`�[�Y              | �C�M���X        |  550 |
| 00005       | �u���[�`�[�Y                | �f���}�[�N      |  600 |
+-------------+-----------------------------+-----------------+------+

--��Q
mysql> insert into material(material_no,mname,origin,cost)
    -> values('00024','�S�[�_�`�[�Y','�I�����_',550);
Query OK, 1 row affected (0.01 sec)

mysql> select * from material
    -> where mname like '%�S�[�_�`�[�Y%';
+-------------+--------------------+--------------+------+
| MATERIAL_NO | MNAME              | ORIGIN       | COST |
+-------------+--------------------+--------------+------+
| 00024       | �S�[�_�`�[�Y       | �I�����_     |  550 |
+-------------+--------------------+--------------+------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--��R
mysql> select distinct origin from material;
+-----------------+
| origin          |
+-----------------+
| �k�C��          |
| �C�^���A        |
| �C�M���X        |
| �f���}�[�N      |
| �A�����J        |
| NULL            |
| ����            |
| �F�{            |
| ���            |
| ����            |
| ���m            |
| �I�����_        |
+-----------------+

--��S
mysql> SELECT  *  FROM  MATERIAL
    -> WHERE  ORIGIN  IS NULL
    -> order by cost;
+-------------+-----------------------------+--------+------+
| MATERIAL_NO | MNAME                       | ORIGIN | COST |
+-------------+-----------------------------+--------+------+
| 00022       | �o�[�x�L���[�\�[�X          | NULL   |   20 |
| 00020       | �g�}�g�\�[�X                | NULL   |   30 |
| 00023       | ���C�v���\�[�X              | NULL   |   30 |
| 00021       | �z���C�g�\�[�X              | NULL   |   35 |
| 00009       | ���[�X�g�`�L��              | NULL   |  400 |
| 00011       | �V�[�t�[�h�~�b�N�X          | NULL   |  500 |
| 00010       | �}�b�V�����[��              | NULL   |  700 |
+-------------+-----------------------------+--------+------+
7 rows in set (0.01 sec)

--��T
mysql> update material
    -> set cost = '450',origin = '��t'
    -> where material_no = '00010';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select * from material
    -> where material_no = '00010';
+-------------+-----------------------+--------+------+
| MATERIAL_NO | MNAME                 | ORIGIN | COST |
+-------------+-----------------------+--------+------+
| 00010       | �}�b�V�����[��        | ��t   |  450 |
+-------------+-----------------------+--------+------+

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--��6
mysql>  select * from material
    -> where origin = '�k�C��'
    ->  order by cost desc limit 1;
+-------------+-----------------------------+-----------+------+
| MATERIAL_NO | MNAME                       | ORIGIN    | COST |
+-------------+-----------------------------+-----------+------+
| 00002       | ���b�c�@�����`�[�Y          | �k�C��    |  700 |
+-------------+-----------------------------+-----------+------+
1 row in set (0.00 sec)

--��7
mysql> update material
    -> set cost = '650'
    -> where material_no = '00002';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from material
    -> where material_no = '00002';
+-------------+-----------------------------+-----------+------+
| MATERIAL_NO | MNAME                       | ORIGIN    | COST |
+-------------+-----------------------------+-----------+------+
| 00002       | ���b�c�@�����`�[�Y          | �k�C��    |  650 |
+-------------+-----------------------------+-----------+------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--��8
mysql> select work_store as '�X�ܔԍ�',ename as'����' ,job as '�E��',salary as '����'from employee
    ->  where job not in ('�X��')
    -> order by work_store, salary desc;
+--------------+-----------------+--------+--------+
| �X�ܔԍ�     | ����            | �E��   | ����   |
+--------------+-----------------+--------+--------+
| 001          | �F�۔���        | ��t   |    950 |
| 001          | ��c����        | �z�B   |    900 |
| 001          | �͈�䂸��      | ����   |    900 |
| 002          | ��q���`        | �z�B   |   1000 |
| 002          | ���R�T          | �z�B   |    850 |
| 002          | ���c�͑�        | ����   |    850 |
| 002          | �ێR����        | ��t   |    850 |
| 005          | �H���^��        | ����   |    950 |
| 005          | ���c�G����      | �z�B   |    800 |
| 005          | ���Ζ���        | ����   |    800 |
| 005          | ���R���        | ��t   |    800 |
+--------------+-----------------+--------+--------+
11 rows in set (0.00 sec)

--��9
mysql> select ename, job , salary from employee
    ->  where job not in ('�X��') and salary >= 800 and salary < 900
    -> order by salary;
+-----------------+--------+--------+
| ename           | job    | salary |
+-----------------+--------+--------+
| ���c�G����      | �z�B   |    800 |
| ���Ζ���        | ����   |    800 |
| ���R���        | ��t   |    800 |
| ���R�T          | �z�B   |    850 |
| ���c�͑�        | ����   |    850 |
| �ێR����        | ��t   |    850 |
+-----------------+--------+--------+
6 rows in set (0.00 sec)

--��10
mysql> update employee
    -> set salary = '890'
    -> where salary >= 800 and salary <900;
Query OK, 6 rows affected (0.00 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select ename, job , salary from employee
    -> where job not in ('�X��') and salary >= 800 and salary < 900
    -> order by salary;
+-----------------+--------+--------+
| ename           | job    | salary |
+-----------------+--------+--------+
| ���R�T          | �z�B   |    890 |
| ���c�͑�        | ����   |    890 |
| �ێR����        | ��t   |    890 |
| ���c�G����      | �z�B   |    890 |
| ���Ζ���        | ����   |    890 |
| ���R���        | ��t   |    890 |
+-----------------+--------+--------+
6 rows in set (0.00 sec)
mysql> commit;
Query OK, 0 rows affected (0.01 sec)

