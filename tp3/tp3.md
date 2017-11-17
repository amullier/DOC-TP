# TP3 - DOC
_14/11/2017_

### Partie I
### 6.
<code>start-dfs.sh</code> rencontre un soucis lié à la variable java_home,
dans le bashrc il faut mettre **export java_home= "votre path"**

``` sql
ur1shell-4.3$ jps
9888 SecondaryNameNode
10405 Jps
9622 NameNode
9735 DataNode
```

### 9.
```java
OpenJDK 64-Bit Server VM warning: You have loaded library /private/student/0/80/14010980/Bureau/Doc/tp3-hadoop/hadoop-2.2.0/lib/native/libhadoop.so.1.0.0 which might have disabled stack guard. The VM will try to fix the stack guard now.
It's highly recommended that you fix the library with 'execstack -c <libfile>', or link it with '-z noexecstack'.
17/11/14 17:11:10 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Found 2 items
-rw-r--r--   3 14010980 supergroup  223281915 2017-11-14 17:10 /author-large.txt
-rw-r--r--   3 14010980 supergroup      10070 2017-11-14 17:10 /author-small.txt
```

### Partie II
