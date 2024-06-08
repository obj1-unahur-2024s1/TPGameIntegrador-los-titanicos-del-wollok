import wollok.game.*
import juego2.*
import mapas.*


class Bloques  {
	const property image 
	var property position
	
}

class PisoMedio inherits Bloques{

}
class Columna inherits Bloques {
	
}
class ColumnaBaja inherits Bloques{
	
}

class TipoElemento{
	
}

object boss {
	var property image = "nivel1/personaje.png"
	var property position = game.at(2,1)
	
	method irHaciaDerecha(){
	var posicionx = self.position().x()
	var posiciony = self.position().y()
		//verificar si puede moverse
		if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony and e.get(0) == posicionx}) or (posicionx == 17)){
			position = game.at(posicionx - 1, posiciony )	 
		}
	}

	method irHaciaIzquierda(){
		var posicionx = self.position().x()
		var posiciony = self.position().y()
		if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony and e.get(0) == posicionx}) or (posicionx == 0)){
			position = game.at(posicionx + 1, posiciony )	
		}
	}
	
	
	
	method irHaciaAbajo(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
		//if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony  and e.get(0) == posicionx}) or self.pacmanEstaSobrePiso()){
			position = game.at(posicionx , posiciony + 1 )	
		//}
		
		
	}
	
	
	//sube en x
	method saltar(){
		
		
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
	    
	    
	    	position= game.at(posicionx, posiciony + 1)
	   
	}
	
	//retorna si tengo un bloque abajo, no bordes
	method hayBloqueAbajo(){
		var posicionx = self.position().x()
		var posiciony = self.position().y()
		return mapaNivel1.lineasDeMuros().any({e => e.get(1) ==posiciony -1 and e.get(0) == posicionx})
	}
	
	
	//si no estoy en borde y no hay bloque baja
	method bajar(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
	    
	    if(posiciony > 1 and not self.hayBloqueAbajo()){
	    	position= game.at(posicionx, posiciony -1)
	    }
	    	
	}
	
	method hayUnBorde(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
	    
	    
	    return (posicionx == 18) or (posicionx -1 == 0)
	}
	
	
	//retorna si esta sobre un bloque o si esta sobre un borde
	
	method pacmanEstaSobrePiso(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
		return self.hayBloqueAbajo() or posiciony == 1
	}
}

