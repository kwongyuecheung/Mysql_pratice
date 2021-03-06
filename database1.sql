/*
f[^x[XKI 1TÚ
NXFSE1A15
§ìÒFREEVE
ì¬úF2020/09/30
*/

--âP
mysql> SELECT * FROM STORE;
+----------+--------------+------------+-------------+-----------------------------------------------+-----------+------------+---------+-----------------+
| STORE_NO | SNAME        | TEL        | PREFECTURES | ADDRESS                                       | OPEN_TIME | CLOSE_TIME | HOLIDAY | STATUS          |
+----------+--------------+------------+-------------+-----------------------------------------------+-----------+------------+---------+-----------------+
| 001      | è¬X     | 0663740144 | åã{      | åãskæè¼Q|R|RT                  | 10:00:00  | 22:00:00   |       | cÆ          |
| 002      | Xm{X     | 0669413044 | åã{      | åãsæåãéP|P                      | 09:00:00  | 22:00:00   |       | cÆ          |
| 003      | ¶îX       | 0743742173 | ÞÇ§      | ¶îsØ¨QRPQ|P                        | 10:00:00  | 24:00:00   | yú    | ÂXÏ          |
| 004      | O{X       | 0783213851 | ºÉ§      | _ËsæºRèÊP|Q|P                | 09:00:00  | 24:00:00   | à      | ¢I[v      |
+----------+--------------+------------+-------------+-----------------------------------------------+-----------+------------+---------+-----------------+

--âQ
mysql> SELECT * FROM EMPLOYEE;
+--------+-----------------+------------+------------+-----------------------------------------------------------+------------+--------+------------+--------+------------+--------+
| EMP_NO | ENAME           | BIRTHDAY   | TEL        | ADDRESS                                                   | HIREDATE   | JOB    | RANK_POINT | SALARY | WORK_STORE | MGR_NO |
+--------+-----------------+------------+------------+-----------------------------------------------------------+------------+--------+------------+--------+------------+--------+
| 00001  | ¬ÑF¡        | 1972-07-04 | 0660030001 | s{ssºæ¬H¬VQP|P                    | 2007-06-15 | X·   |          0 |   5000 | 003        | NULL   |
| 00002  | ¬Ñ\ã        | 1986-03-06 | 0660010001 | åãsæåèOP|P|P                              | 2010-04-01 | X·   |          0 |   3500 | 001        | 00001  |
| 00003  | FÛ¹½        | 1985-08-11 | 0660010002 | åãsæåèOP|P|Q                              | 2013-09-10 | ót   |          0 |    950 | 001        | 00002  |
| 00004  | îc¼÷        | 1984-12-28 | 0660010003 | åãsæåèOP|P|R                              | 2013-04-01 | zB   |          0 |    900 | 001        | 00002  |
| 00005  | Íää¸é      | 1980-11-28 | 0660010004 | åãsæåèOP|P|S                              | 2013-05-15 | ²   |          0 |    900 | 001        | 00002  |
| 00006  | ºãMÜ        | 1982-01-26 | 0660020001 | åã{åãsQ¬æbü{P|PW|P                    | 2010-04-01 | X·   |          0 |   3000 | 002        | 00001  |
| 00007  | ¡RT          | 1981-05-09 | 0660020002 | åã{åãsQ¬æbü{P|PW|Q                    | 2010-04-01 | zB   |          0 |    850 | 002        | 00006  |
| 00008  | åq`        | 1985-05-16 | 0660020003 | åã{åãsQ¬æbü{P|PW|R                    | 2013-09-20 | zB   |          0 |   1000 | 002        | 00006  |
| 00009  | ÀcÍå        | 1984-09-11 | 0660020004 | åã{åãsQ¬æbü{P|PW|S                    | 2013-12-01 | ²   |          0 |    850 | 002        | 00006  |
| 00010  | ÛR²½        | 1983-11-26 | 0660010005 | åã{åãsQ¬æbü{P|PW|T                    | 2016-10-01 | ót   |          0 |    850 | 002        | 00006  |
+--------+-----------------+------------+------------+-----------------------------------------------------------+------------+--------+------------+--------+------------+--------+

--âR
mysql> SELECT SNAME, OPEN_TIME, CLOSE_TIME, HOLIDAY FROM STORE
    -> WHERE SNAME = 'Xm{X';
+--------------+-----------+------------+---------+
| SNAME        | OPEN_TIME | CLOSE_TIME | HOLIDAY |
+--------------+-----------+------------+---------+
| Xm{X     | 09:00:00  | 22:00:00   |       |
+--------------+-----------+------------+---------+
1 row in set (0.01 sec)

--âS
mysql> SELECT PNAME FROM PRODUCT
    -> WHERE CATEGORY = 'TCh'
    -> AND PRICE < '300';
+--------------------------+
| PNAME                    |
+--------------------------+
| R[|^[W         |
| N`E_[         |
| ~lXg[l           |
| GbO^g             |
| AbvpC             |
+--------------------------+

--âT
mysql> SELECT EMP_NO AS ']ÆõÔ', ENAME AS '¼O', JOB AS 'S', SALARY AS ''
    -> FROM EMPLOYEE
    -> WHERE HIREDATE < '2016-01-01'
    -> AND JOB != 'X·';
+-----------------+-----------------+--------+--------+
| ]ÆõÔ      | ¼            | S   |    |
+-----------------+-----------------+--------+--------+
| 00003           | FÛ¹½        | ót   |    950 |
| 00004           | îc¼÷        | zB   |    900 |
| 00005           | Íää¸é      | ²   |    900 |
| 00007           | ¡RT          | zB   |    850 |
| 00008           | åq`        | zB   |   1000 |
| 00009           | ÀcÍå        | ²   |    850 |
| 00012           | ¶cGÔ      | zB   |    800 |
| 00015           | RêÀ        | ót   |    800 |
+-----------------+-----------------+--------+--------+
