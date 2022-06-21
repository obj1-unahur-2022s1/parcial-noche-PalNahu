class Plato {
	var property peso
	
	var property aptoVegetariano
	
	method valoracion()
	
	method esAbundante(){
		return peso >250
	}
}

class Provoleta inherits Plato{
	
	var property tieneEspecias
	
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
	var cortesPedidos=[]
	
	method cortesPedidos(unCorte){
		cortesPedidos.add(unCorte)
	}
	
	override method peso()= return cortesPedidos.sum{e => e.peso()}
	
	override method valoracion(){
		return 15*cortesPedidos.max{e => e.calidad()}.calidad() - cortesPedidos.size()
	}
	

}

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




















