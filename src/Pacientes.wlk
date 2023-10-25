class Paciente {
	const property edad
	var nvlFortaleza
	var nvlDolor
	const rutina = []
	
	method nvlFortaleza() = nvlFortaleza
	method nvlDolor() = nvlDolor
	
	method puedeUsar(unAparato) = unAparato.puedeSerUsado(self)
	
	method usarAparato(unAparato){
		if (!self.puedeUsar(unAparato)){
			self.error("No puede usar el aparato")
		}
		nvlDolor = 0.max(nvlDolor - unAparato.valorQueRestaDolor(self))
		nvlFortaleza += unAparato.valorQueSumaFortaleza(self)
	}
	
	method asignarRutina(listaDeAparatos) = rutina.addAll(listaDeAparatos)

	method sacarAparato(unAparato) = rutina.remove(unAparato)

	method puedeRealizarRutina() {
		return rutina.all({p => self.puedeUsar(p)})
	}
	
	method realizarLaRutina(){
		if(!self.puedeRealizarRutina()){
			self.error("No puede realizar rutina")
		}
		rutina.forEach({a => self.usarAparato(a)})
	} 
}

class Resistente inherits Paciente {
	
	override method usarAparato(unAparato){
		super(unAparato)
		nvlFortaleza += 1
	}
	
}

class Caprichoso inherits Paciente {
	
	override method realizarLaRutina(){
		super()
		super()
	}
	
}

class Rapido inherits Paciente {
	
	override method usarAparato(unAparato){
		if (!self.puedeUsar(unAparato)){
			self.error("No puede usar el aparato")
		}
		nvlDolor = 0.max(nvlDolor - coeficienteDeRecuperacion.valor())
		nvlFortaleza += unAparato.valorQueSumaFortaleza(self)
	}
}

object coeficienteDeRecuperacion	{ 
	var property valor = 3
}







