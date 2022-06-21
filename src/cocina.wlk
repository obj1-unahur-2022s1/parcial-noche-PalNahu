import comidas.*
import comensales.*
/*Considero que la cocina es un objeto ya que esta misma hay una sola ya que es una sola parrila */

object cocina{
	var ofertaComida = []
	
	method agregarComida(unaComida){
		ofertaComida.add(unaComida)
	}
	method sacarComida(unaComida){
		return ofertaComida.remove(unaComida)
	}
	
	method tieneBuenaOfertaVegetariana(){
		return ofertaComida.filter{e => e.aptoVegetariano()}.size()-ofertaComida.filter{e => !e.aptoVegetariano()}.size() <= 2
	}
	
	method platoFuerteCarnivoro(){
		ofertaComida.filter{e=>!e.aptoVegetariano()}.max{e=>e.valoracion()}
		
	}
	
	method listaDeComidaDeComensal(unComensal){
		return unComensal.comidaQueLeGusta()
	}
	
	method elegirPlato(unComensal){
		if(unComensal.comidaQueLeGusta().size()> 0){
			var comida = self.sacarComida(unComensal.comidaQueLeGusta().anyOne())
			unComensal.comer(comida)
		}
		else{
			self.error("ERROR: Al comensal no le gusta ningún plato")
		}
	}
}

