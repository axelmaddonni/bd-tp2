// 2.1. La cantidad de enfrentamientos ganados por competidor para un campeonato dado.
r.db('registroHistorico').table('Competidor').filter(function (competidor) {
	return competidor("enfrentamientos").filter({'id_campeonato': 1}).count().ge(1);
}).map(function (competidor) {
	return r.object('nombre', competidor("nombre"), 'cantidadGanados', competidor("enfrentamientos").filter({'id_campeonato': 1}).filter({'resultoGanador': 1}).count());
});

// 2.2 La cantidad de medallas por nombre de escuela en toda la historia.
r.db('registroHistorico').table('Escuela').map(function (escuela) {
	return r.object('nombre', escuela("nombre"), 'cantidadMedallas', escuela("medallistas").count());
})

// 2.3 Para cada escuela, el campeonato donde ganó más medallas
r.db('registroHistorico').table('Escuela').map(function (escuela) {
	var max = escuela('medallistas').group('id_campeonato').count().ungroup().orderBy(r.desc('reduction')).nth(0).default(r.object('reduction', 0)).getField('reduction');
	return r.object('escuela', escuela("nombre"), 'cantidadDeMedallas', max, 'campeonatos', escuela('medallistas').group('id_campeonato').count().ungroup().orderBy(r.desc('reduction')).filter({'reduction' : max}).getField('group').map( function (idCampeonato) { return r.db('registroHistorico').table('Campeonato').filter({'id_campeonato': idCampeonato}).nth(0).getField('ano'); }));
});

// 2.4 Los arbitros que participaron en al menos 4 campeonatos
r.db('registroHistorico').table('Arbitro').filter(function(arbitro) { return arbitro('campeonatos').count().ge(4)}).getField("nombre");

//2.4 con Map-reduce
r.db('registroHistorico').table('Arbitro').map(function(arbitro) {
  var participoEnAlMenos4 = arbitro('campeonatos').count().ge(4);
  return r.object('Nombre', r.array(arbitro('nombre')), 'participoEnAlMenos4', participoEnAlMenos4);
}).reduce(function(acum, e) {
  return e('participoEnAlMenos4') ? acum.add(e('Nombre')) : acum;
});

// 2.5 Las escuelas que han presentado el mayor número de competidores en cada campeonato.
r.db('registroHistorico').table('Campeonato').map(function (campeonato) {
	var max = campeonato('inscriptos').map(function (id_competidor) {
		return r.object('id_escuela', r.db('registroHistorico').table('Competidor').filter({'id_competidor': id_competidor}).nth(0).getField('id_escuela'));
		}).group('id_escuela').count().ungroup().orderBy(r.desc('reduction')).nth(0).default(r.object('reduction', 0)).getField('reduction');
	return r.object("campeonato", campeonato('ano'), "escuelasConMasInscriptos", campeonato('inscriptos').map(function (id_competidor) {
		return r.object('id_escuela', r.db('registroHistorico').table('Competidor').filter({'id_competidor': id_competidor}).nth(0).getField('id_escuela'));
		})
		.group('id_escuela').count().ungroup().orderBy(r.desc('reduction'))
		.filter({'reduction' : max}).getField('group').map( function (idEscuela) { return r.db('registroHistorico').table('Escuela').filter({'id_escuela': idEscuela}).nth(0).getField('nombre'); }));
})
 
// 2.6 Obtener los competidores que más medallas obtuvieron por modalidad.
r.db('registroHistorico').table('MedalleroPorModalidad').map(function(medallas){
	var max = medallas('medallas').pluck('id_competidor').group('id_competidor').count().ungroup().orderBy(r.desc('reduction')).nth(0).default(r.object('reduction', 0)).getField('reduction');
	return r.object('Modalidad',medallas('id_modalidad'), 'cantidadDeMedallas', max, 'competidoresConMasMedallas', medallas('medallas').pluck('id_competidor').group('id_competidor').count().ungroup().orderBy(r.desc('reduction')).filter({'reduction' : max}).getField('group').map( function (id_competidor) { return r.db('registroHistorico').table('Competidor').filter({'id_competidor': id_competidor}).nth(0).getField('nombre'); }));
})
