# TP3 - DOC
_14/11/2017_

### 3.
#### 2.
En s'inpirant des traitements faits dans les fichiers Authors.java on ajoute un reducer que l'on place dans un fichier différent :

``` JAVA
/**
  * Classe de reducer pour obtenir le nombre de publication de William Kent
  */
 public static class ChercheurReducer extends
     Reducer<Text, IntWritable, Text, IntWritable> {
   private IntWritable result = new IntWritable();

   //Auteur recherché
   private String author = "William Kent";

   public void reduce(Text key, Iterable<IntWritable> values,
           Context context)
       throws IOException, InterruptedException {


     int count = 0;
     for (IntWritable val : values) {
       count += val.get();
     }

     result.set(count);
     //On traite le résultat seulement pour l'auteur
     if(key.toString().equals(author)){
         context.write(key, result);
     }
   }
 }
```

Et au final on retrouve le résultat suivant dans le HDFS:
```
William Kent    29.
```

#### 3.
Voici le fichier java utilisé pour obtenir la réponse à la question :

```JAVA
//Import packages...
public class Chercheur {

  public static class ChercheurMapper extends
      Mapper<Object, Text, Text, IntWritable> {

    private final static IntWritable one = new IntWritable(1);

    private Text author = new Text();
    private Text article = new Text();

    public void map(Object key, Text value, Context context)
        throws IOException, InterruptedException {


      Scanner line = new Scanner(value.toString());
      line.useDelimiter("\t");
      author.set(line.next());
      String nameArticle = line.next();

      //On ajoute chacun des mots des titres d'article
      String[] mots = nameArticle.split(" ");
      for(String mot : mots) {
          article.set(mot);
          context.write(article, one);
      }
    }
  }

  //Reducer pour compter le nombre d'occurence de ces mots
  public static class ChercheurReducer extends
      Reducer<Text, IntWritable, Text, IntWritable> {
    private IntWritable result = new IntWritable();
    public void reduce(Text key, Iterable<IntWritable> values,
            Context context)
        throws IOException, InterruptedException {

      int count = 0;
      for (IntWritable val : values) {
        count += val.get();
      }
      result.set(count);
      context.write(key, result);
    }
  }
}
```
A l'aide de la commande :
``` shell
cat _resultatQuestion3_part-r-00000 | sort -n -k2 -r | head -10
```
On obtient le fichier suivant :
```
(2)	86024
(1)	85276
Conference	83628
on	68690
and	54950
Workshops	37472
ISCAS	35475
(3)	34099
ICRA	30155
ICIP	28546
```

#### 4.
```JAVA
public class Chercheur {

    public static class ChercheurMapper extends Mapper<Object, Text, Text, IntWritable> {

      private final static IntWritable resWritable = new IntWritable();
      private Text first = new Text();
      private Text second = new Text();

      private Integer resultat;

      public void map(Object key, Text value, Context context) throws IOException, InterruptedException {

        Scanner line = new Scanner(value.toString());
        line.useDelimiter(" ");
        first.set(line.next());
        second.set(line.next());

        resultat = Integer.parseInt(first.toString())*Integer.parseInt(second.toString());

        Text keyRes = new Text();
        keyRes.set("scalaire");
        resWritable.set(resultat);
        context.write(keyRes,resWritable);
    }
  }

  public static class ChercheurReducer extends Reducer<Text, IntWritable, Text, IntWritable> {
      private IntWritable result = new IntWritable();

      public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {

      int count = 0;
      for (IntWritable val : values) {
        count += val.get();
      }

      result.set(count);
      context.write(key, result);
    }
  }
}
```
