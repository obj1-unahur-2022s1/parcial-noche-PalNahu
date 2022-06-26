/*
 * listaDeComidaDeComensal esta mail
 En eligir ```elegirPlato()``` falto remover el plato de la ofertaComida
 * 
 */
import comidas.*
import comensales.*
/*Considero que la cocina es un objeto ya que esta misma hay una sola ya que es una sola parrila */

object cocina{
	const ofertaComida = []
	
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
		return ofertaComida.filter({c=> unComensal.leAgrada(c)})
	}
	
	method elegirPlato(unComensal){
		if(not unComensal.comidaQueLeGusta().isEmpty()){
			const comida = self.sacarComida(unComensal.comidaQueLeGusta().anyOne())
			unComensal.comer(comida)
			ofertaComida.remove(comida)
		}
		else{
			self.error("ERROR: Al comensal no le gusta ningún plato")
		}
	}
}

