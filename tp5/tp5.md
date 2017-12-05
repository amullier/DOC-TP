# TP5 - DOC : NEO4J
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
MATCH (film:Movie) -- (p:Person{name:"Kevin Bacon"})
RETURN film;
```

### 9.
On ajoute une clause [DISTINCT](https://neo4j.com/docs/developer-manual/current/cypher/clauses/return/#return-unique-results) pour ne pas avoir de doublons.

``` neo4j
MATCH (p:Person{name:"Tom Cruise"}) -[:ACTED_IN]- (film:Movie) -[:ACTED_IN]- (p2:Person)
WITH DISTINCT p2
RETURN p2;
```

### 10.
``` neo4j
MATCH (p:Person{name:"Tom Cruise"}) -[*..10]- (p2:Person)
WITH DISTINCT p2
RETURN p2;
```
**Remarque :** On limite le nombre de liens à 10 pour éviter d'attendre trop longtemps la fin l'exécution de la requête.

### 12.
``` neo4j
MATCH (p:Person{name:"Tom Cruise"}) -[*..3]- (p2:Person)
WITH DISTINCT p2
RETURN p2;
```

### 13.
``` neo4j
MERGE (Darkstar:Movie {title:'Darkstar',released:2015, tagline:'Inconnu à ce jour'})
MERGE (Cyrille:Person {name : 'Cyrille Autin', born:1965})
MERGE (Cyrille)-[:ACTED_IN {roles:['Military Head']}]->(Darkstar)
RETURN Darkstar;
```
_Le retour de résultat est juste là pour voir les résultats _
