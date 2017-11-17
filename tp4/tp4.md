# TP4 - DOC : Spark
_17/11/2017_

### 1.
Installation faite en 2min

### 2.
#### 2.b)
<table>
  <th></th>
  <th>Sur le site</th>
  <th>Chez nous</th>
  <tr>
    <td>Nombres de lignes du README</td>
    <td>126</td>
    <td>103</td>
  </tr>
  <tr>
    <td>Première ligne</td>
    <td># Apache Spark</td>
    <td># Apache Spark</td>
  </tr>
  <tr>
    <td>Nombres de lignes avec Spark dedans</td>
    <td>15</td>
    <td>20</td>
  </tr>
</table>

#### 2.c)
_Premier test avec sort :_

<code>
  val wc = wordCounts.collect.sortWith((x, y) => x.\_2 > y.\_2)
</code>

**Remarque :** Ce code est exécuté avec Scala et pas Spark (donc pas très bien)

_Avec orderBy et swap :_

``` java
val wc = wordCounts.map(_.swap).orderBy(desc("_1")).take(50)
```

#### 2.d)
``` java
val zippedVal = wc.collect.zip (Stream from 0)
```

#### 2.e)
On peut rajouter un **filter** spark :
``` java
val wordCounts = textFile.flatMap(line => line.split(" ")).filter(x => !x.equals("")).groupByKey(identity)
```
