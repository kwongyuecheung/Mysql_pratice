/*
データベース演習I 8週目
クラス：SE1A15
制作者：コウユウショウ
作成日：2020/11/25
*/

--問１
mysql> select e.EMP_NO, e.ENAME, e.MGR_NO,m.ENAME
    -> from employee as e
    -> left  join employee as m
    -> on(e.mgr_no = m.emp_no);
+--------+-----------------+--------+--------------+
| EMP_NO | ENAME           | MGR_NO | ENAME        |
+--------+-----------------+--------+--------------+
| 00001  | 小林友治        | NULL   | NULL         |
| 00002  | 小林圭輔        | 00001  | 小林友治     |
| 00003  | 友保隼平        | 00002  | 小林圭輔     |
| 00004  | 稲田直樹        | 00002  | 小林圭輔     |
| 00005  | 河井ゆずる      | 00002  | 小林圭輔     |
| 00006  | 村上信五        | 00001  | 小林友治     |
| 00007  | 横山裕          | 00006  | 村上信五     |
| 00008  | 大倉忠義        | 00006  | 村上信五     |
| 00009  | 安田章大        | 00006  | 村上信五     |
| 00010  | 丸山隆平        | 00006  | 村上信五     |
| 00011  | 秋元真夏        | 00016  | 升野英知     |
| 00012  | 生田絵梨花      | 00016  | 升野英知     |
| 00014  | 白石麻衣        | 00016  | 升野英知     |
| 00015  | 高山一実        | 00016  | 升野英知     |
| 00016  | 升野英知        | 00001  | 小林友治     |
| 00017  | 松村沙友里      | 00016  | 升野英知     |
| 00018  | 山名文和        | NULL   | NULL         |
| 00019  | 秋山賢太        | NULL   | NULL         |
+--------+-----------------+--------+--------------+
18 rows in set (0.00 sec)

--問２
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
| NULL       | NULL         | 秋山賢太        | NULL   | NULL         |
| 001        | 中崎町店     | 小林圭輔        | 00001  | 小林友治     |
| 001        | 中崎町店     | 友保隼平        | 00002  | 小林圭輔     |
| 001        | 中崎町店     | 稲田直樹        | 00002  | 小林圭輔     |
| 001        | 中崎町店     | 河井ゆずる      | 00002  | 小林圭輔     |
| 002        | 森ノ宮店     | 村上信五        | 00001  | 小林友治     |
| 002        | 森ノ宮店     | 横山裕          | 00006  | 村上信五     |
| 002        | 森ノ宮店     | 大倉忠義        | 00006  | 村上信五     |
| 002        | 森ノ宮店     | 安田章大        | 00006  | 村上信五     |
| 002        | 森ノ宮店     | 丸山隆平        | 00006  | 村上信五     |
| 003        | 生駒店       | 小林友治        | NULL   | NULL         |
| 004        | NULL         | 山名文和        | NULL   | NULL         |
| 005        | 阿倍野店     | 秋元真夏        | 00016  | 升野英知     |
| 005        | 阿倍野店     | 生田絵梨花      | 00016  | 升野英知     |
| 005        | 阿倍野店     | 白石麻衣        | 00016  | 升野英知     |
| 005        | 阿倍野店     | 高山一実        | 00016  | 升野英知     |
| 005        | 阿倍野店     | 升野英知        | 00001  | 小林友治     |
| 005        | 阿倍野店     | 松村沙友里      | 00016  | 升野英知     |
+------------+--------------+-----------------+--------+--------------+
18 rows in set (0.00 sec)

--問３
mysql> update employee
    -> set
    -> job = "店長",
    -> rank_point = "1200",
    -> work_store = "006",
    -> mgr_no = "00001"
    -> where ename = "山名文和";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee
    ->  set
    -> job = "調理",
    ->  rank_point = "100",
    -> work_store = "006",
    -> mgr_no = "00018"
    -> where ename = "秋山賢太";
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

--問４
mysql> select EMP_NO, ENAME, JOB, RANK_POINT, WORK_STORE, MGR_NO
    -> from employee
    -> where work_store = 006;
+--------+--------------+--------+------------+------------+--------+
| EMP_NO | ENAME        | JOB    | RANK_POINT | WORK_STORE | MGR_NO |
+--------+--------------+--------+------------+------------+--------+
| 00018  | 山名文和     | 店長   |       1200 | 006        | 00001  |
| 00019  | 秋山賢太     | 調理   |        100 | 006        | 00018  |
+--------+--------------+--------+------------+------------+--------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--問５
mysql> select PRODUCT_NO,PNAME,PRICE
    -> from product
    -> where category = "ピザ"
    -> union
    -> select prototype_no as PRODUCT_NO, PROTONAME as PNAME,price
    -> from prototype;
+------------+--------------------------+-------+
| PRODUCT_NO | PNAME                    | PRICE |
+------------+--------------------------+-------+
| 0001       | マルゲリータ             |  1200 |
| 0002       | デラックスピザ           |  1700 |
| 0003       | シーフードピザ           |  1500 |
| 0004       | ギガミート               |  2500 |
| 0005       | チキン＆ベーコン         |  2200 |
| 0006       | BBQチキン                |  2200 |
| 0007       | BBQシーフード            |  3000 |
| 9001       | MAXチーズピザ            |  3000 |
| 9002       | 夏野菜ピザ               |  3000 |
+------------+--------------------------+-------+
9 rows in set (0.00 sec)

問６
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
| 0006       | BBQチキン          | チーズ                |        1 |
| 0006       | BBQチキン          | ローストチキン        |        3 |
| 0006       | BBQチキン          | コーン                |        1 |
| 0006       | BBQチキン          | トマトソース          |        1 |
| 0006       | BBQチキン          | ホワイトソース        |        1 |
| 0007       | BBQシーフード      | NULL                  |     NULL |
+------------+--------------------+-----------------------+----------+
6 rows in set (0.01 sec)

問７
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
| 9001       | NULL  | チーズ                      |        1 |
| 9001       | NULL  | モッツァレラチーズ          |        2 |
| 9001       | NULL  | パルメザンチーズ            |        2 |
| 9001       | NULL  | チェダーチーズ              |        2 |
| 9001       | NULL  | ブルーチーズ                |        2 |
| 9001       | NULL  | メイプルソース              |        1 |
| 9002       | NULL  | チーズ                      |        1 |
| 9002       | NULL  | バジル                      |        1 |
| 9002       | NULL  | トマト                      |        1 |
| 9002       | NULL  | ピーマン                    |        1 |
| 9002       | NULL  | オニオン                    |        1 |
| 9002       | NULL  | アスパラガス                |        1 |
| 9002       | NULL  | コーン                      |        1 |
| 9002       | NULL  | ナス                        |        1 |
| 9002       | NULL  | ホワイトソース              |        1 |
| 9003       | NULL  | チーズ                      |        1 |
| 9003       | NULL  | パルメザンチーズ            |        1 |
| 9003       | NULL  | シーフードミックス          |        1 |
| 9003       | NULL  | トマト                      |        1 |
| 9003       | NULL  | ピーマン                    |        1 |
| 9003       | NULL  | バーベキューソース          |        1 |
+------------+-------+-----------------------------+----------+
21 rows in set (0.00 sec)

問8
mysql> select p.PROTOTYPE_NO, p.PROTONAME, m.MNAME, r.QUANTITY
    -> from prototype as p
    -> left join recipe as r
    -> on(r.product_no = p.PROTOTYPE_NO)
    -> left join material as m
    -> on(r.material_no = m.material_no);
+--------------+--------------------+-----------------------------+----------+
| PROTOTYPE_NO | PROTONAME          | MNAME                       | QUANTITY |
+--------------+--------------------+-----------------------------+----------+
| 9001         | MAXチーズピザ      | チーズ                      |        1 |
| 9001         | MAXチーズピザ      | モッツァレラチーズ          |        2 |
| 9001         | MAXチーズピザ      | パルメザンチーズ            |        2 |
| 9001         | MAXチーズピザ      | チェダーチーズ              |        2 |
| 9001         | MAXチーズピザ      | ブルーチーズ                |        2 |
| 9001         | MAXチーズピザ      | メイプルソース              |        1 |
| 9002         | 夏野菜ピザ         | チーズ                      |        1 |
| 9002         | 夏野菜ピザ         | バジル                      |        1 |
| 9002         | 夏野菜ピザ         | トマト                      |        1 |
| 9002         | 夏野菜ピザ         | ピーマン                    |        1 |
| 9002         | 夏野菜ピザ         | オニオン                    |        1 |
| 9002         | 夏野菜ピザ         | アスパラガス                |        1 |
| 9002         | 夏野菜ピザ         | コーン                      |        1 |
| 9002         | 夏野菜ピザ         | ナス                        |        1 |
| 9002         | 夏野菜ピザ         | ホワイトソース              |        1 |
+--------------+--------------------+-----------------------------+----------+
15 rows in set (0.00 sec)

問9
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
| 0007       | BBQシーフード      | チーズ                      |        1 |
| 0007       | BBQシーフード      | パルメザンチーズ            |        1 |
| 0007       | BBQシーフード      | シーフードミックス          |        1 |
| 0007       | BBQシーフード      | トマト                      |        1 |
| 0007       | BBQシーフード      | ピーマン                    |        1 |
| 0007       | BBQシーフード      | バーベキューソース          |        1 |
+------------+--------------------+-----------------------------+----------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)