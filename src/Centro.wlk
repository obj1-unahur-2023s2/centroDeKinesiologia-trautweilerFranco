import Aparatos.*
import Pacientes.*
object centro {
	
	const aparatos = []
	const pacientes = #{}
	
	method agregarPaciente(listaPacientes){pacientes.addAll(listaPacientes)}
	method agregarAparato(listaAparatos){aparatos.addAll(listaAparatos)}
	method coloresAparatos(){
		return aparatos.map({a => a.colorAparato()}).asSet()
	}
	method menoresAOchoAnios(){
		return pacientes.filter({p=>p.edad()<8})
	}
	method cantidadPacientesQueNoPuedenHacerRutina(){
		return pacientes.count({p=>!p.puedeRealizarRutina()})
	}
	method estaOptimo() = aparatos.all({a=>!a.necesitaMantenimiento()})
	method estaComplicado() = self.aparatosParaMantenimiento().size() >= aparatos.size() / 2
	method aparatosParaMantenimiento() = aparatos.filter({a=>a.necesitaMantenimiento()})
	method visitaTecnico() {
		self.aparatosParaMantenimiento().forEach({a=> a.hacerMantenimiento()})
	}
}
