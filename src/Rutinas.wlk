class Rutina {
	
	const rutina = []
	
	method agregarAparato(unAparato) = rutina.add(unAparato)
	method sacarAparato(unAparato) = rutina.remove(unAparato)
	
	method puedeHacerLaRutina(unPaciente){
		return rutina.all({p => unPaciente.puedeUsar(p)})
	}
}
