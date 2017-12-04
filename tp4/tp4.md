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

``` scala
val wc = wordCounts.map(_.swap).orderBy(desc("_1")).take(50)
```

#### 2.d)
``` scala
val zippedVal = wc.collect.zip (Stream from 0)
zippedVal.map(p => p._2 + ": " + (p._1)._2  + " (" + (p._1)._1 + ")").foreach(println)
```

#### 2.e)
On peut rajouter un **filter** spark :
``` scala
val wordCounts = textFile.flatMap(line => line.split(" ")).filter(x => !x.equals("")).groupByKey(identity)
```
### 3.
#### 3.a)
``` scala
val aol = sc.textFile("../AOL-01.txt")
```

#### 3.b)
Pour compter les lignes du fichiers :
``` scala
aol.count
```
Recherche du mot "google" dans toutes les lignes :
``` scala
aol.filter(line => line.contains("google")).count
res14: Long = 58152
```

#### 3.c)
``` scala
val queryFilter = aol_dead.map(line => line.split("\t")).map(array => array(1))
```
