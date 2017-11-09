# TP1 - DOC
_09/11/2017_

### 3.
On a 100 000 tuples.

### 5.
On a 100 000 entrées.

Avec *dist_10 = 1* on a une entrée sur 10 donc **10 000 entrées**.

Avec *dist_1000 = 1* on a une entrée sur 1000 donc **100 entrées**.

### 8.
Résultat en sortie de la commande :
``` java
SQL> select * from XXXX where nss=21954;

       NSS
----------
NOM
--------------------------------------------------------------------------------
   DIST_10   DIST_100  DIST_1000 DIST_10000	RANDOM
---------- ---------- ---------- ---------- ----------
     21954
ABCDEFGHIQWERTYUIOPOIUYTREWQASWEDFRQZXVFFGTREDDDDS876675327643763QWERTYUIOPLKJHG
FDSA1150
	 4	   54	     954       1954 17332.4781



Execution Plan
----------------------------------------------------------
Plan hash value: 1706117570

--------------------------------------------------------------------------
| Id  | Operation	  | Name | Rows  | Bytes | Cost (%CPU)| Time	 |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |	 |    19 |  2470 |   478   (1)| 00:00:06 |
|*  1 |  TABLE ACCESS FULL| XXXX |    19 |  2470 |   478   (1)| 00:00:06 |
--------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter("NSS"=21954)

Note
-----
   - dynamic sampling used for this statement (level=2)


Statistics
----------------------------------------------------------
  169  recursive calls
    1  db block gets
 1825  consistent gets
    0  physical reads
  176  redo size
 1048  bytes sent via SQL*Net to client
  523  bytes received via SQL*Net from client
    2  SQL*Net roundtrips to/from client
    0  sorts (memory)
    0  sorts (disk)
    1  rows processed
```
**Remarques :**

<code java>
1825  consistent gets
</code>
nous indique qu'il va lire **1825 blocks**.

### 12.

``` java

Execution Plan
----------------------------------------------------------
Plan hash value: 1706117570

--------------------------------------------------------------------------
| Id  | Operation	  | Name | Rows  | Bytes | Cost (%CPU)| Time	 |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |	 |    56 |  7280 |   478   (1)| 00:00:06 |
|*  1 |  TABLE ACCESS FULL| XXXX |    56 |  7280 |   478   (1)| 00:00:06 |
--------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter("NSS">16873 AND "NSS"<16973)

Note
-----
   - dynamic sampling used for this statement (level=2)

Statistics
----------------------------------------------------------
    5  recursive calls
    0  db block gets
 1790  consistent gets
    0  physical reads
    0  redo size
13736  bytes sent via SQL*Net to client
  589  bytes received via SQL*Net from client
    8  SQL*Net roundtrips to/from client
    0  sorts (memory)
    0  sorts (disk)
   99  rows processed
 ```

 ### 14. (Question 10)
 _NB : On gardera dans les traces uniquement les Statistics_

 ``` java
 Statistics
 ----------------------------------------------------------
  124  recursive calls
    0  db block gets
   15  consistent gets
    0  physical reads
    0  redo size
 1048  bytes sent via SQL*Net to client
  524  bytes received via SQL*Net from client
    2  SQL*Net roundtrips to/from client
    0  sorts (memory)
    0  sorts (disk)
    1  rows processed
 ```
 **Remarque :**
 On est passé de 1790 consistent gets à **15 consistent gets** !

 ### 14. (Question 12)
 ``` java
 Statistics
 ----------------------------------------------------------
  32  recursive calls
    0  db block gets
  187  consistent gets
    0  physical reads
    0  redo size
14175  bytes sent via SQL*Net to client
  590  bytes received via SQL*Net from client
    8  SQL*Net roundtrips to/from client
    0  sorts (memory)
    0  sorts (disk)
   99  rows processed
 ```

 ### 15.
 ``` SQL
 SET AUTOCOMMIT OFF;

 CREATE CLUSTER h_primaire_XXXX (nss INTEGER)
 HASHKEYS 3001;
 CREATE TABLE XXXX
 (
  nss   INTEGER,
  nom   VARCHAR(100) NOT NULL,
  dist_10   INTEGER,
  dist_100  INTEGER,
  dist_1000  INTEGER,
  dist_10000  INTEGER,
  random  FLOAT
 )
 CLUSTER h_primaire_XXXX (nss);
 ALTER TABLE XXXX
 ADD CONSTRAINT XXXX_prim_key_nss
 PRIMARY KEY (nss)
 USING INDEX;

 COMMIT;
 exit;
 ```
Cela nous permet de comparer le temps de réponse entre le HASH et le HEAP.
En HASH, on a une meilleure performance quand on a un accès direct, mais pour les accès à intervalle il est moins performant.

### 18. (Question 12)

``` java
Statistics
----------------------------------------------------------
   33  recursive calls
    1  db block gets
  205  consistent gets
    0  physical reads
  176  redo size
14076  bytes sent via SQL*Net to client
  590  bytes received via SQL*Net from client
    8  SQL*Net roundtrips to/from client
    0  sorts (memory)
    0  sorts (disk)
   99  rows processed
  ```

### 19.
Le type d'index utilisé est l'arbre B (B-tree).

### 20.
**En accès contigü:** hash > btree > basic
