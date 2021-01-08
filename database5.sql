/*
データベース演習I 5週目
クラス：SE1A15
制作者：コウユウショウ
作成日：2020/10/28
*/

--問１
mysql> select date_format(now(),'%y/%m/%d %H:%i:%s') as '現在日付';
+-------------------+
| 現在日付          |
+-------------------+
| 20/10/28 09:55:19 |
+-------------------+
1 row in set (0.00 sec)

--問２
mysql> select * from prototype;
+--------------+-----------------------------------+----------+-------+
| PROTOTYPE_NO | PROTONAME                         | CATEGORY | PRICE |
+--------------+-----------------------------------+----------+-------+
| 9001         | MAXチーズピザ                     | ピザ     |  3000 |
| 9002         | 夏野菜ピザ                        | ピザ     |  3000 |
| 9003         | バーベキューシーフード            | ピザ     |  3000 |
+--------------+-----------------------------------+----------+-------+
3 rows in set (0.35 sec)

--問３
mysql> insert into product(product_no,pname,category,price)
    -> values('0007','バーベキューシーフード','ピザ','3000');
Query OK, 1 row affected (0.01 sec)

mysql> select * from product
    -> where product_no = '0007';
+------------+-----------------------------------+----------+-------+
| PRODUCT_NO | PNAME                             | CATEGORY | PRICE |
+------------+-----------------------------------+----------+-------+
| 0007       | バーベキューシーフード            | ピザ     |  3000 |
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
| 9001         | MAXチーズピザ      | ピザ     |  3000 |
| 9002         | 夏野菜ピザ         | ピザ     |  3000 |
+--------------+--------------------+----------+-------+
2 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.01 sec)

--問４
mysql> select product_no,pname from product
    -> where char_length(pname)>=9;
+------------+-----------------------------------+
| product_no | pname                             |
+------------+-----------------------------------+
| 0006       | バーベキューチキン                |
| 1013       | ストロベリーアイス                |
| 0007       | バーベキューシーフード            |
+------------+-----------------------------------+
3 rows in set (0.00 sec)


--問５
mysql> update product
    -> set pname = replace(pname,'バーベキュー','BBQ')
    -> where product_no = '0006';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>  update product
    -> set pname = replace(pname,'バーベキュー','BBQ')
    -> where product_no = '0007';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select* from product
    -> where product_no = '0006' or
    ->  product_no = '0007';
+------------+--------------------+----------+-------+
| PRODUCT_NO | PNAME              | CATEGORY | PRICE |
+------------+--------------------+----------+-------+
| 0006       | BBQチキン          | ピザ     |  2200 |
| 0007       | BBQシーフード      | ピザ     |  3000 |
+------------+--------------------+----------+-------+
2 rows in set (0.00 sec)
mysql> commit;
Query OK, 0 rows affected (0.02 sec)

--問6
mysql> select CATEGORY,PNAME,truncate(price*0.85,0)as PRICE
    -> from product
    -> order by product_no;
+--------------+-----------------------------+-------+
| CATEGORY     | PNAME                       | PRICE |
+--------------+-----------------------------+-------+
| ピザ         | マルゲリータ                |  1020 |
| ピザ         | デラックスピザ              |  1445 |
| ピザ         | シーフードピザ              |  1275 |
| ピザ         | ギガミート                  |  2125 |
| ピザ         | チキン＆ベーコン            |  1870 |
| ピザ         | BBQチキン                   |  1870 |
| ピザ         | BBQシーフード               |  2550 |
| サイド       | ポテトフライ                |   323 |
| サイド       | コンソメポテト              |   323 |
| サイド       | バターポテト                |   323 |
| サイド       | チキンナゲット              |   382 |
| サイド       | シーザーサラダ              |   467 |
| サイド       | ごまだれサラダ              |   433 |
| サイド       | コーンポタージュ            |   178 |
| サイド       | クラムチャウダー            |   204 |
| サイド       | ミネストローネ              |   204 |
| サイド       | ごまだれサラダ              |   433 |
| サイド       | エッグタルト                |   221 |
| サイド       | アップルパイ                |   212 |
| サイド       | バニラアイス                |   314 |
| サイド       | ストロベリーアイス          |   314 |
| ドリンク     | コーラ                      |   136 |
| ドリンク     | ゼロコーラ                  |   136 |
| ドリンク     | ジンジャエール              |   136 |
| ドリンク     | メロンソーダ                |   136 |
| ドリンク     | カフェラテ                  |   136 |
| ドリンク     | コーヒー                    |   136 |
| ドリンク     | オレンジジュース            |   136 |
| ドリンク     | アップルジュース            |   136 |
| その他       | タバスコ                    |   212 |
| その他       | 保温バック                  |   425 |
| その他       | エコバック                  |   340 |
+--------------+-----------------------------+-------+
32 rows in set (0.01 sec)

--問7
mysql> insert into employee(emp_no,ename,birthday,tel,address,hiredate,job,rank_point,salary,work_store,mgr_no)
    -> values('00017','松村沙友里','1992-8-27','0332229876','東京都港区南青山１―２４',date_add(now(),interval -14 day),'配達','0','850','005','00016');
Query OK, 1 row affected, 1 warning (0.03 sec)

mysql> select* from employee
    -> where emp_no = '00017';
+--------+-----------------+------------+------------+--------------------------------------+------------+--------+------------+--------+------------+--------+
| EMP_NO | ENAME           | BIRTHDAY   | TEL        | ADDRESS                              | HIREDATE   | JOB    | RANK_POINT | SALARY | WORK_STORE | MGR_NO |
+--------+-----------------+------------+------------+--------------------------------------+------------+--------+------------+--------+------------+--------+
| 00017  | 松村沙友里      | 1992-08-27 | 0332229876 | 東京都港区南青山１―２４              | 2020-10-14 | 配達   |          0 |    850 | 005        | 00016  |
+--------+-----------------+------------+------------+--------------------------------------+------------+--------+------------+--------+------------+--------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)


--問8
mysql> select ENAME, replace(tel,substr(tel,1,6),'XXXXXX') as TEL,
    -> JOB,date_format(HIREDATE,'%Y/%m/%d入社') as HIREDATE
    -> from employee
    ->  where work_store = '005';
+-----------------+------------+--------+------------------+
| ENAME           | TEL        | JOB    | HIREDATE         |
+-----------------+------------+--------+------------------+
| 秋元真夏        | XXXXXX2222 | 調理   | 2015/05/10入社   |
| 生田絵梨花      | XXXXXX3333 | 配達   | 2015/05/10入社   |
| 白石麻衣        | XXXXXX5555 | 調理   | 2016/10/01入社   |
| 高山一実        | XXXXXX6666 | 受付   | 2015/09/25入社   |
| 升野英知        | XXXXXX1234 | 店長   | 2020/09/01入社   |
| 松村沙友里      | XXXXXX9876 | 配達   | 2020/10/14入社   |
+-----------------+------------+--------+------------------+
6 rows in set (0.00 sec)

--問9
mysql>  select ENAME, datediff(now(),hiredate)as '在籍日数'
    -> from employee
    -> where work_store = '005';
+-----------------+--------------+
| ENAME           | 在籍日数     |
+-----------------+--------------+
| 秋元真夏        |         1998 |
| 生田絵梨花      |         1998 |
| 白石麻衣        |         1488 |
| 高山一実        |         1860 |
| 升野英知        |           57 |
| 松村沙友里      |           14 |
+-----------------+--------------+
6 rows in set (0.00 sec)


--問10

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
| 00017  | 松村沙友里      |        100 |
+--------+-----------------+------------+
1 row in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.02 sec)