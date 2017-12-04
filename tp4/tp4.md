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
res0 : Long = 3558412
```
Recherche du mot "google" dans toutes les lignes :
``` scala
aol.filter(line => line.contains("google")).count
res14: Long = 58152
```

#### 3.c)
``` scala
val queryFilter = aol.map(line => line.split("\t")).map(array => array(1))
```

#### 3.d)
``` scala
val d = aol.map(line => line.split("\t"))
.map(array => array(1))
.filter(query => query.split(" ").distinct.size != query.split(" ").size)

d.count
res14: Long = 35911
```

#### 3.e)
Pour obtenir le comptage des mots dans les recherches
``` scala
val c = aol.map(line => line.split("\t")).map(array => array(1))
val wc = c.flatMap(_.split(" ")).map((_,1)).reduceByKey(_+_)
```

Puis on trie la map par ordre de fréquence décroissant :
``` scala
val cw = wc.map(p => (p._2, p._1))
val sortedCW = cw.sortedByKey(false)
```
Affichage du TOP50 des résultats obtenus :
``` Scala
sortedCW.take(50).foreach(println)

(110575,of)
(104052,-)
(91521,in)
(82961,the)
(70107,for)
(66675,and)
(45168,to)
(45149,free)
(36220,a)
(34970,google)
(26856,new)
(24394,http)
(24113,on)
(23491,yahoo)
(22435,county)
(21416,pictures)
(19377,how)
(19082,my)
(18476,lyrics)
```

#### 3.f)
``` scala
val wc = c.map(query => (query.length,query))
val sortedCW = wc.sortByKey(false)
sortedCW.take(50).foreach(println)
```
#### 4)
