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
		if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony and e.get(0) == posicionx})){
			position = game.at(posicionx - 1, posiciony )	
		}
	}

	method irHaciaIzquierda(){
		var posicionx = self.position().x()
	var posiciony = self.position().y()
		if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony and e.get(0) == posicionx})){
			position = game.at(posicionx + 1, posiciony )	
		}
	}
	
	method irHaciaArriba(){
		var posicionx = self.position().x()
	var posiciony = self.position().y()
		if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony + 1 and e.get(0) == posicionx})){
			position = game.at(posicionx , posiciony - 1 )	
		}
	}
	
	method irHaciaAbajo(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
		if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony  and e.get(0) == posicionx}) or self.pacmanEstaSobrePiso()){
			position = game.at(posicionx , posiciony + 1 )	
		}
		
		
	}
	
	method saltar(){
		var contador = 0
		
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
	    
	    
	    	position= game.at(posicionx, posiciony + 1)
	   
	}
	
	method hayBloqueAbajo(){
		var posicionx = self.position().x()
		var posiciony = self.position().y()
		return mapaNivel1.lineasDeMuros().any({e => e.get(1) ==posiciony -1 and e.get(0) == posicionx})
	}
	
	method bajar(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
	    
	    if(posiciony > 1 and not self.hayBloqueAbajo()){position= game.at(posicionx, posiciony -1)}
	    	
	}
	
	method pacmanEstaSobrePiso(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
		return (mapaNivel1.lineasDeMuros().any({e => e.get(1) == posiciony -1 and e.get(0) == posicionx})) or (posiciony == 0)
	}
}

