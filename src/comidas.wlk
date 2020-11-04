class Comida {
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante(){
		return self.peso() > 250
	}

}


class Provoleta inherits Comida{
	var property tieneEspecias=false
	var property peso=0
	
	override method peso(){
		return peso
	}
	override method valoracion(){
		return if(self.esEpecial()){120}else{80}
	}
	override method esAptoVegetariano(){
		return not tieneEspecias
	}	
	
	method esEpecial(){
		return self.esAbundante() or tieneEspecias
	}
	
}

class HamburguesaDeCarne inherits Comida{
	const property peso=250
	var property pan=[]
	
	override method esAptoVegetariano(){
		return false
	}	
	override method valoracion(){
		return 60 + pan.puntos()
	}
	
	
}
object panIndustrial{
	method puntos()=0
}
object panCasero{
	method puntos()=20
}
object panDeMasaMadre{
	method puntos()=45
}


class HamburguesasVegetarianas inherits HamburguesaDeCarne{
	var property legumbre
		
	override method esAptoVegetariano(){
		return true
	}
	
	method setLegumbre(tipo){
		legumbre=tipo
	}
	
	override method valoracion(){
		return (2 * legumbre.size()).min(17)
	}
	
}

class Parrillada inherits Comida{
	var property cortesDeCarnePedidos=[]
	
	override method peso(){
	return 	cortesDeCarnePedidos.sum({a=>a.peso()})
	}
	override method valoracion(){
		//return (15* cortesDeCarnePedidos.max({a=>a.calidad()}) - cortesDeCarnePedidos.count({a=>a})).min(0)
		return (15 * cortesDeCarnePedidos.max({a=>a.calidad()}).calidad() - cortesDeCarnePedidos.size()).max(0)
	}
	override method esAptoVegetariano()= false
		
	
}


class CorteDeCarne{
	var property calidad=0
	var property peso=0
		
}




