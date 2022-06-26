/* 
en ```estaSatisfecho()``` de PaladarFino le tiraste el even() a la coleccion un lugar de a un numero: Era así: ```comidaIngerida.size().even()```
*/
import comidas.*

class Comensales {
	var property peso 
	const comidaIngerida = []

	
	method leAgrada(unaComida)
	
	
	method comer(unaComida){
		comidaIngerida.add(unaComida)
	}
	
	method estaSatisfecho(){
		return comidaIngerida.sum{e => e.peso()} >= (peso*0.01)
	}
}

class Vegetarianos inherits Comensales{
	override method leAgrada(unaComida){
		return unaComida.aptoVegetariano() and unaComida.valoracion() > 85
		
	}
	
	override method estaSatisfecho(){
		return super() and comidaIngerida.all{e => !e.esAbundante()}
	}
	
}

class HambrePopular inherits Comensales{
	override method leAgrada(unaComida){
		return unaComida.esAbundante()
	}
}

class PaladarFino inherits Comensales{
	override method leAgrada(unaComida){
		return unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	}
	
	override method estaSatisfecho(){
		return super() and comidaIngerida.size().even()
	}
	
}