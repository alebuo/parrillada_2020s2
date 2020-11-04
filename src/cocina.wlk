import comidas.*
import comensales.*

object cocina{
	var property todasLasComidas=[]	
	method tieneBuenaOfertaVegetariana(){
		return todasLasComidas.count({a=>a.esAptoVegetariano()}) - todasLasComidas.count({a=>not a.esAptoVegetariano()}) >=2 
	}
	method elPlatoFuerteCarnivoro(){
		
		return todasLasComidas.filter({a=>not a.esAptoVegetariano()}).max({b=>b.valoracion()})
	}
	method commidasQueLeGustan(nombre){
		return todasLasComidas.filter({a=> nombre.leAgrada(a)}) 
	}

	method elegriPlatoParaComensal(nombre){
		if(todasLasComidas.any({a=> nombre.leAgrada(a)})){
			return self.commidasQueLeGustan(nombre).first()
		}else{
			//error.message("no hay plato")
			return 0
		}
		
		
	}

	
}
