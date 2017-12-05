# TP4 - DOC : Spark
_05/12/2017_

### 1.
Installation faite à l'aide **docker** :

<code>
docker run --publish=7474:7474 --publish=7687:7687 neo4j:3.0
</code>

### 5.
Pour filtrer tous les éléments du graphe, on utilise la propriété de NEO4J [MATCH](https://neo4j.com/docs/developer-manual/current/cypher/clauses/match/) :
``` neo4j
MATCH (n:Movie) RETURN n
```

### 6.
Les films possèdent un attribut title, en utilisant la requête précédente on obtient :
``` neo4j
MATCH (film:Movie) RETURN film.title
```

### 7.
Pour trier les données dans NEO4J on utilise [ORDER BY](https://neo4j.com/docs/developer-manual/current/cypher/clauses/order-by/) :

``` neo4j
MATCH (film:Movie)
RETURN film.title
ORDER BY film.title
```

Et on ajoute une limite avec [LIMIT](https://neo4j.com/docs/developer-manual/current/cypher/clauses/limit/) :
``` neo4j
MATCH (film:Movie)
RETURN film.title
ORDER BY film.title
LIMIT 3
```

### 8.
On ajoute un filtre dans le match pour les relations
``` neo4j
MATCH (film:Movie) ->
RETURN film.title
ORDER BY film.title
LIMIT 3
```
