import Pacientes.*

class Aparato {
	
	const property colorAparato = "blanco"
	
	method puedeSerUsado(unaPersona) = true
	
	method valorQueSumaFortaleza(unaPersona) = 0

	method valorQueRestaDolor(unaPersona) = 0
	
	method necesitaMantenimiento()
	
	method efectoDeUso(unPaciente)
	
	method hacerMantenimiento()
}

class Magneto inherits Aparato{
	
	var imantacion = 800
	
	override method efectoDeUso(unPaciente){imantacion = 0.max(imantacion - 1)}
	
	override method necesitaMantenimiento(){return imantacion < 100}
	
	override method hacerMantenimiento(){imantacion += 500}
	
	override method valorQueRestaDolor(unaPersona) = unaPersona.nvlDolor()* 0.1
	
}

class Bicicleta inherits Aparato{
	
	var aceite = 0
	var tornillo = 0
	
	override method efectoDeUso(unPaciente){
		if(unPaciente.edad().between(30,50)){aceite ++}
		if(unPaciente.nvlDolor() > 30){tornillo ++}
	}
	
	override method necesitaMantenimiento(){return tornillo >= 10 or aceite >= 5}
	
	override method hacerMantenimiento(){
		tornillo = 0
		aceite = 0
	}
	
	override method puedeSerUsado(unaPersona) = unaPersona.edad() > 8
	
	override method valorQueRestaDolor(unaPersona) = 4
	
	override method valorQueSumaFortaleza(unaPersona) = 3
	
}

class Minitramp inherits Aparato{
	
	override method puedeSerUsado(unaPersona) = unaPersona.nvlDolor() < 20
	
	override method valorQueSumaFortaleza(unaPersona) = unaPersona.edad() * 0.10
	
	override method necesitaMantenimiento(){}
	
	override method efectoDeUso(unPaciente){}
	
	override method hacerMantenimiento(){}
	
}