# bd-tp2

### DER 

** https://drive.google.com/file/d/0BzkIgbt1E5IqcVZKX2t5VHY5ckk/view?usp=sharing

### DID

** https://drive.google.com/file/d/0BzkIgbt1E5IqQi1XYmZFZmxXMTA/view?usp=sharing

### Informe

** https://www.overleaf.com/9997717vwhzxjnnnkrm#/36752705/

### Script para generar datos

perl taekwondo.pl (CANTIDAD_DE_CAMPEONATOS)

### Carga de tablas en rethinkdb

rethinkdb import -f escuela.json --table registroHistorico.Escuela
rethinkdb import -f arbitro.json --table registroHistorico.Arbitro
rethinkdb import -f competidor.json --table registroHistorico.Competidor
rethinkdb import -f campeonato.json --table registroHistorico.Campeonato
rethinkdb import -f enfrentamiento.json --table registroHistorico.Enfrentamiento
rethinkdb import -f modalidad.json --table registroHistorico.Modalidad
rethinkdb import -f medalleroPorModalidad.json --table registroHistorico.MedalleroPorModalidad

