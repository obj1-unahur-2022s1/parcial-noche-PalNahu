/*
1) La mejor opción para manejar el peso en las comidas era la siguiente:
- método abstracto peso en Plato
- const property peso en Provoleta
- en esAbundante() usar ```self.peso()```

2) La mejor opción para la valoración y aptoVegetariano  también era definir un método abstracto en Plato para que luego cada sub-clase implemente y retorne el valor que corresponde.
3) En ```valoracion()``` de Parrillada era conveniente usar la delegación en métodos auxiliares para encontrar el cortes de máxima calidad. Y también podias usar el 0.max() para que no de un número negativo.
4) Los cortes era una clase Corte en lugar de objectos
5) En los método de consulta que pones ```method xzy() = ``` no hace falta la palabrá return.
* */
class Plato {
	
	method peso()
	method aptoVegetariano()
	method valoracion()
	
	method esAbundante(){
		return self.peso() >250
	}
}

class Provoleta inherits Plato{
	
	const property tieneEspecias
	const property peso
	override method aptoVegetariano(){return not self.tieneEspecias()}
	
	method esEspecial(){return self.esAbundante() or self.tieneEspecias()}
	
	override method valoracion(){if(self.tieneEspecias()){return 120}else{return 80}}
	
	

	
}

class HamburguesaDeCarne inherits Plato{
	const property pan 
	override method peso() = 250
	override method aptoVegetariano() = false
	override method valoracion()= 60 + pan.valoracion()
	
	
}



class HamburguesaVegetariana inherits HamburguesaDeCarne{
	var property legumbreUsada
	override method aptoVegetariano() = true
	override method valoracion() = super() + (2*legumbreUsada.size()).min(17)
	
}





object panIndustrial{
	method valoracion() = 0
}

object panCasero{
	method valoracion() = 20
	
}

object panMasaMadre{
	method valoracion() = 45
	
}

class Parrillada inherits Plato{
	const cortesPedidos=[]
	
	method cortesPedidos(unCorte){
		cortesPedidos.add(unCorte)
	}
	
	override method peso()=  cortesPedidos.sum{e => e.peso()}
	
	override method valoracion(){
		return 0.max(15*self.maximaCalidadDeCortes() -  cortesPedidos.size())
	}
	
	method maximaCalidadDeCortes() = cortesPedidos.max({e => e.calidad()}).calidad()
	override method aptoVegetariano()= false
}

class Corte {
	var property nombre
	var property peso
	var property calidad
}
/* 
object asado{
	var property calidad = 10
	var property peso = 250
	
}

object entrania{
	var property calidad = 7
	var property peso = 200
}

object chorizo{
	var property calidad = 8
	var property peso = 50
}

*/


















