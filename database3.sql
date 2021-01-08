/*
データベース演習I 3週目
クラス：SE1A15
制作者：コウユウショウ
作成日：2020/10/14
*/

--問１
mysql> select * from material
    -> where mname like '%チーズ%';
+-------------+-----------------------------+-----------------+------+
| MATERIAL_NO | MNAME                       | ORIGIN          | COST |
+-------------+-----------------------------+-----------------+------+
| 00001       | チーズ                      | 北海道          |   50 |
| 00002       | モッツァレラチーズ          | 北海道          |  700 |
| 00003       | パルメザンチーズ            | イタリア        |  450 |
| 00004       | チェダーチーズ              | イギリス        |  550 |
| 00005       | ブルーチーズ                | デンマーク      |  600 |
+-------------+-----------------------------+-----------------+------+

--問２
mysql> insert into material(material_no,mname,origin,cost)
    -> values('00024','ゴーダチーズ','オランダ',550);
Query OK, 1 row affected (0.01 sec)

mysql> select * from material
    -> where mname like '%ゴーダチーズ%';
+-------------+--------------------+--------------+------+
| MATERIAL_NO | MNAME              | ORIGIN       | COST |
+-------------+--------------------+--------------+------+
| 00024       | ゴーダチーズ       | オランダ     |  550 |
+-------------+--------------------+--------------+------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--問３
mysql> select distinct origin from material;
+-----------------+
| origin          |
+-----------------+
| 北海道          |
| イタリア        |
| イギリス        |
| デンマーク      |
| アメリカ        |
| NULL            |
| 長野            |
| 熊本            |
| 茨木            |
| 兵庫            |
| 高知            |
| オランダ        |
+-----------------+

--問４
mysql> SELECT  *  FROM  MATERIAL
    -> WHERE  ORIGIN  IS NULL
    -> order by cost;
+-------------+-----------------------------+--------+------+
| MATERIAL_NO | MNAME                       | ORIGIN | COST |
+-------------+-----------------------------+--------+------+
| 00022       | バーベキューソース          | NULL   |   20 |
| 00020       | トマトソース                | NULL   |   30 |
| 00023       | メイプルソース              | NULL   |   30 |
| 00021       | ホワイトソース              | NULL   |   35 |
| 00009       | ローストチキン              | NULL   |  400 |
| 00011       | シーフードミックス          | NULL   |  500 |
| 00010       | マッシュルーム              | NULL   |  700 |
+-------------+-----------------------------+--------+------+
7 rows in set (0.01 sec)

--問５
mysql> update material
    -> set cost = '450',origin = '千葉'
    -> where material_no = '00010';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select * from material
    -> where material_no = '00010';
+-------------+-----------------------+--------+------+
| MATERIAL_NO | MNAME                 | ORIGIN | COST |
+-------------+-----------------------+--------+------+
| 00010       | マッシュルーム        | 千葉   |  450 |
+-------------+-----------------------+--------+------+

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--問6
mysql>  select * from material
    -> where origin = '北海道'
    ->  order by cost desc limit 1;
+-------------+-----------------------------+-----------+------+
| MATERIAL_NO | MNAME                       | ORIGIN    | COST |
+-------------+-----------------------------+-----------+------+
| 00002       | モッツァレラチーズ          | 北海道    |  700 |
+-------------+-----------------------------+-----------+------+
1 row in set (0.00 sec)

--問7
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
| 00002       | モッツァレラチーズ          | 北海道    |  650 |
+-------------+-----------------------------+-----------+------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--問8
mysql> select work_store as '店舗番号',ename as'氏名' ,job as '職種',salary as '時給'from employee
    ->  where job not in ('店長')
    -> order by work_store, salary desc;
+--------------+-----------------+--------+--------+
| 店舗番号     | 氏名            | 職種   | 時給   |
+--------------+-----------------+--------+--------+
| 001          | 友保隼平        | 受付   |    950 |
| 001          | 稲田直樹        | 配達   |    900 |
| 001          | 河井ゆずる      | 調理   |    900 |
| 002          | 大倉忠義        | 配達   |   1000 |
| 002          | 横山裕          | 配達   |    850 |
| 002          | 安田章大        | 調理   |    850 |
| 002          | 丸山隆平        | 受付   |    850 |
| 005          | 秋元真夏        | 調理   |    950 |
| 005          | 生田絵梨花      | 配達   |    800 |
| 005          | 白石麻衣        | 調理   |    800 |
| 005          | 高山一実        | 受付   |    800 |
+--------------+-----------------+--------+--------+
11 rows in set (0.00 sec)

--問9
mysql> select ename, job , salary from employee
    ->  where job not in ('店長') and salary >= 800 and salary < 900
    -> order by salary;
+-----------------+--------+--------+
| ename           | job    | salary |
+-----------------+--------+--------+
| 生田絵梨花      | 配達   |    800 |
| 白石麻衣        | 調理   |    800 |
| 高山一実        | 受付   |    800 |
| 横山裕          | 配達   |    850 |
| 安田章大        | 調理   |    850 |
| 丸山隆平        | 受付   |    850 |
+-----------------+--------+--------+
6 rows in set (0.00 sec)

--問10
mysql> update employee
    -> set salary = '890'
    -> where salary >= 800 and salary <900;
Query OK, 6 rows affected (0.00 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select ename, job , salary from employee
    -> where job not in ('店長') and salary >= 800 and salary < 900
    -> order by salary;
+-----------------+--------+--------+
| ename           | job    | salary |
+-----------------+--------+--------+
| 横山裕          | 配達   |    890 |
| 安田章大        | 調理   |    890 |
| 丸山隆平        | 受付   |    890 |
| 生田絵梨花      | 配達   |    890 |
| 白石麻衣        | 調理   |    890 |
| 高山一実        | 受付   |    890 |
+-----------------+--------+--------+
6 rows in set (0.00 sec)
mysql> commit;
Query OK, 0 rows affected (0.01 sec)

