//2.1. La cantidad de enfrentamientos ganados por competidor para un campeonato dado.
r.db('registroHistorico').table('Enfrentamiento').filter({'id_campeonato': 1}).group(function(enfrentamiento) {
          return enfrentamiento.pluck('participantes').filter({'resulto_ganador': true}).pluck('id_competidor')
        }).count();

//2.2 La cantidad de medallas por nombre de escuela en toda la historia.
// Asumiendo que las escuelas pueden repetir nombres
r.db('registroHistorico').table('Escuela').group('nombre').pluck('medallistas').sum(function(m) {
  return m.count()
});
// Asumiendo que las escuelas tienen todos nombres distintos
r.db('registroHistorico').table('Escuela').pluck('medallistas').count();

//2.3 Para cada escuela, el campeonato donde ganó más medallas
// En este y en el anterior usamos fuertemente que la escuela solo guarda a los competidores que ganaron medallas (validado con Gerardo).
r.db('registroHistorico').table('Escuela').pluck('medallistas').group('id_campeonato').count().max();

//2.4 Los arbitros que participaron en al menos 4 campeonatos
//Asumimos que no tiene sentido que el mismo árbitro pueda estar inscripto en el mismo campeonato con un nombre o un id distintos.
r.db('registroHistorico').table('Arbitros').filter(function(arbitro) { return arbitro('participaciones').count().ge(4)});