SQLite version 3.31.1 2020-01-27 19:55:54
Enter ".help" for usage hints.
sqlite> select * from cats
   ...> ;
1|Maru|3|Scottish Fold|1
2|Hana|1|Tabby|1
3|Lil\' Bub|5|American Shorthair|
4|Moe|10|Tabby|
5|Patches|2|Calico|
sqlite> select * from cats.headers on;
Error: near ";": syntax error
sqlite> select * from cats;.headers on
   ...> ;
1|Maru|3|Scottish Fold|1
2|Hana|1|Tabby|1
3|Lil\' Bub|5|American Shorthair|
4|Moe|10|Tabby|
5|Patches|2|Calico|
Error: near ".": syntax error
sqlite> select * from cats;
1|Maru|3|Scottish Fold|1
2|Hana|1|Tabby|1
3|Lil\' Bub|5|American Shorthair|
4|Moe|10|Tabby|
5|Patches|2|Calico|
sqlite> .headers on 
sqlite> .headers on select * from cats;
Usage: .headers on|off
sqlite> .headers on select * from cats;
Usage: .headers on|off
sqlite> .headers on 
sqlite> select * from cats;
id|name|age|breed|owner_id
1|Maru|3|Scottish Fold|1
2|Hana|1|Tabby|1
3|Lil\' Bub|5|American Shorthair|
4|Moe|10|Tabby|
5|Patches|2|Calico|
sqlite> .mode COLUMN ^Z
[1]+  Stopped                 sqlite3 pets_database.db
moringa@moringa-HP-EliteBook-840-G6:~/Development/code/phase3/lessons/phase-3-sql-queries$ sqlite3 pets_database.db 
SQLite version 3.31.1 2020-01-27 19:55:54
Enter ".help" for usage hints.
sqlite> .mode column
sqlite> .width auto
sqlite> SELECT * FROM cats
   ...> ;
1           Maru        3           Scottish Fold  1         
2           Hana        1           Tabby          1         
3           Lil\' Bub   5           American Shor            
4           Moe         10          Tabby                    
5           Patches     2           Calico                   
sqlite> .headers on
sqlite> ;
sqlite> SELECT * FROM cats;
id          name        age         breed          owner_id  
----------  ----------  ----------  -------------  ----------
1           Maru        3           Scottish Fold  1         
2           Hana        1           Tabby          1         
3           Lil\' Bub   5           American Shor            
4           Moe         10          Tabby                    
5           Patches     2           Calico                   
sqlite> SELECT * FROM cats  ORDER BY age
   ...> ;
id          name        age         breed       owner_id  
----------  ----------  ----------  ----------  ----------
2           Hana        1           Tabby       1         
5           Patches     2           Calico                
1           Maru        3           Scottish F  1         
3           Lil\' Bub   5           American S            
4           Moe         10          Tabby                 
sqlite> SELECT * FROM cats  ORDER BY age DESC 
   ...> ;
id          name        age         breed       owner_id  
----------  ----------  ----------  ----------  ----------
4           Moe         10          Tabby                 
3           Lil\' Bub   5           American S            
1           Maru        3           Scottish F  1         
5           Patches     2           Calico                
2           Hana        1           Tabby       1         
sqlite> SELECT * FROM cats  ORDER BY age DESC  LIMIT 2
   ...> ;
id          name        age         breed       owner_id  
----------  ----------  ----------  ----------  ----------
4           Moe         10          Tabby                 
3           Lil\' Bub   5           American S            
sqlite> SELECT * FROM cats  ORDER BY age DESC  LIMIT 1;
id          name        age         breed       owner_id  
----------  ----------  ----------  ----------  ----------
4           Moe         10          Tabby                 
sqlite> SELECT breed FROM cats WHERE age BETWEEN 1 AND 6;
breed        
-------------
Scottish Fold
Tabby        
American Shor
Calico       
sqlite> SELECT name FROM cats WHERE age BETWEEN 1 AND 3;
name      
----------
Maru      
Hana      
Patches   
sqlite> INSERT INTO cats (name, age, breed) VALUES (NULL, NULL. "Tabby");
Error: near ".": syntax error
sqlite> INSERT INTO cats (name, age, breed) VALUES (NULL, NULL, "Tabby");
sqlite> SELECT * FROM cats;
id          name        age         breed          owner_id  
----------  ----------  ----------  -------------  ----------
1           Maru        3           Scottish Fold  1         
2           Hana        1           Tabby          1         
3           Lil\' Bub   5           American Shor            
4           Moe         10          Tabby                    
5           Patches     2           Calico                   
6                                   Tabby                    
sqlite> SELECT * FROM cats WHERE is NULL
   ...> ;
Error: near "is": syntax error
sqlite> SELECT * FROM cats WHERE IS NULL
   ...> ;
Error: near "IS": syntax error
sqlite> SELECT * FROM cats WHERE IS NULL;
Error: near "IS": syntax error
sqlite> SELECT * FROM cats WHERE = NULL;
Error: near "=": syntax error
sqlite> SELECT * FROM cats WHERE name IS NULL;
id          name        age         breed       owner_id  
----------  ----------  ----------  ----------  ----------
6                                   Tabby                 
sqlite> SELECT COUNT (owner_id) FROM cats WHERE owner_id =1
   ...> ;
COUNT (owner_id)
----------------
2               
sqlite> SELECT COUNT owner_id FROM cats WHERE owner_id =1;
Error: no such column: COUNT
sqlite> SELECT COUNT (owner_id) FROM cats WHERE owner_id =1;
COUNT (owner_id)
----------------
2               
sqlite> SELECT COUNT (owner_id) FROM cats WHERE owner_id =0;
COUNT (owner_id)
----------------
0               
sqlite> SELECT COUNT (owner_id) FROM cats WHERE owner_id =NULL;
COUNT (owner_id)
----------------
0               
sqlite> SELECT breed, COUNT(breed) FROM cats GROUP BY breed
   ...> ;
breed               COUNT(breed)
------------------  ------------
American Shorthair  1           
Calico              1           
Scottish Fold       1           
Tabby               3           
sqlite> SELECT breed, COUNT(breed) FROM cats GROUP BY breed, owner_id;
breed               COUNT(breed)
------------------  ------------
American Shorthair  1           
Calico              1           
Scottish Fold       1           
Tabby               2           
Tabby               1           
sqlite> SELECT breed,owner_id  COUNT(breed) FROM cats GROUP BY breed, owner_id;
Error: near "(": syntax error
sqlite> SELECT breed,owner_id, COUNT(breed) FROM cats GROUP BY breed, owner_id;
breed               owner_id    COUNT(breed)
------------------  ----------  ------------
American Shorthair              1           
Calico                          1           
Scottish Fold       1           1           
Tabby                           2           
Tabby               1           1           
sqlite> SELECT cats.name FROM cats
   ...> ;
name      
----------
Maru      
Hana      
Lil\' Bub 
Moe       
Patches   
          
sqlite> SELECT name FROM cats;
name      
----------
Maru      
Hana      
Lil\' Bub 
Moe       
Patches   
          
sqlite> 