import wollok.game.*
import juego.*
import mapas.*



class Visual{
	var property image
	var property position
}

class Bloques  {
	const property image 
	var property position
	
}

class PisoMedio inherits Bloques{

	method impactoCon(rival, id){
		
	}
	
	method resetPosition(rival){
		
	}
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
	
	var vidas = 3
	
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
		//if(mapaNivel1.lineasDeMuros().any({e => e.get(1)==posiciony  and e.get(0) == posicionx}) or self.estaSobrePiso()){
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
	
	method estaSobrePiso(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
		return self.hayBloqueAbajo() or posiciony == 1
	}
	
	method vidas(){
		return vidas
	}
	
	method restarVidas(){
		vidas = 0.max(vidas - 1)
	}
	
	
	method impactoCon(rival, id){
		self.restarVidas()
		nivelSalud.perderVida(self.vidas())
		position = game.at(1,1)
		if(self.vidas() == 0){
			game.stop()
		}
		
	}
	
	method resetPosition(rival){
		
	}
}


class Proyectil inherits Visual(
	position = game.at(boss.position().x(), boss.position().y())){
	
	method irHaciaDerecha(){
		
		var positionx = position.x() + 1
		
		position = game.at(positionx, position.y())
		
	}
	
	method irHaciaIzquierda(){
		
		var positionx = position.x() - 1
		
		position = game.at(positionx, position.y())
		
	}
	
	method impactoCon(rival, id){
			
			rival.perderVidas()
			rival.morir(id)
			rival.cambiarImagen()
			game.removeVisual(self)
	}
	
	method resetPosition(rival){
		
	}
	
	
	
	method removerSiEsta(){
		if(game.hasVisual(self)){
			game.removeVisual(self)
		}
	}

}



class Enemigo inherits Visual
		(image="nivel1/enemigo3.png"){
	
		var property vidas = 3
		
		
		method enemigosPersiguiendo(lista){
			enemigos.forEach({
		rival => 
		var id = rival.identity().toString()
		game.addVisual(rival)
		game.whenCollideDo(rival, {p => p.impactoCon(rival, id ) p.resetPosition(rival)})
		game.onTick(350, "perseguir" + id, {=>
			rival.perseguir()
	})
	})
	
	}
		
		
		method impactoCon(rival, id){
			
		}
			
		method resetPosition(rival){
			
			var posx = self.position().x()
			var posy = self.position().y()
			
			rival.position(game.at(posx, posy)) 
		}		
		method perseguir(){
			
		var posx = self.position().x()
		var posy = self.position().y()
		
		
		
		
		
	
		
		if(boss.position().x() > self.position().x() and !self.hayBloqueHaciaDerecha())
		{position = game.at(posx + 1, posy) self.caer() } else self.verHaciaAbajo()
			
		}
		
		
		method caer(){
			
			
			if(!self.hayBloqueHaciaAbajo()){
			game.onTick(150, 'bajar3', {=>
				self.bajar()
				if(self.enemigoEstaSobrePiso()){
					game.removeTickEvent('bajar3')
				}
				
			})
		}
		}
		
		method subir(){
			var posicionx = self.position().x()
		    var posiciony = self.position().y()
		    
		   
		    	
		    
		}
		
		method bajar(){
			var posicionx = self.position().x()
		    var posiciony = self.position().y()
		    
		    if(posiciony > 1 and not self.hayBloqueHaciaAbajo()){
		    	position= game.at(posicionx, posiciony -1)
		    }
	    	
		}
		
		method enemigoEstaSobrePiso(){
			var posicionx = self.position().x()
	    	var posiciony = self.position().y()
		return self.hayBloqueHaciaAbajo() or posiciony == 1
		}
		
		
		
		
		method hayBloqueHaciaDerecha(){
			var posx = self.position().x()
			var posy = self.position().y()
			return mapaNivel1.lineasDeMuros().any({e => e.get(1)==posy   and e.get(0) == posx + 1})
			
		}
		
		method hayBloqueHaciaAbajo(){
			var posx = self.position().x()
		    var posy = self.position().y()
			return mapaNivel1.lineasDeMuros().any({e => e.get(1)==posy - 1 and e.get(0) == posx})
		}
		
		method hayBloqueHaciaIzquierda(){
			var posx = self.position().x()
			var posy = self.position().y()
			return mapaNivel1.lineasDeMuros().any({e => e.get(1)==posy   and e.get(0) == posx - 1})
		}
		
		method hayBloqueHaciaArriba(){
			var posx = self.position().x()
			var posy = self.position().y()
			return mapaNivel1.lineasDeMuros().any({e => e.get(1) == posy + 1 and e.get(0) == posx})
		}
		
		method verHaciaAbajo(){
			var posx = self.position().x()
		    var posy = self.position().y()
			if(boss.position().y() < self.position().y() and !self.hayBloqueHaciaAbajo()) {position = game.at(posx, posy - 1)} else {self.verHaciaAtras()}
		}
		
		method verHaciaAtras(){
			var posx = self.position().x()
			var posy = self.position().y()
			if(boss.position().x() < self.position().x() and !self.hayBloqueHaciaIzquierda()){position = game.at(posx - 1, posy) self.caer()} else self.saltar()
			
		}
		
		method verHaciaArriba(){
			var posx = self.position().x()
			var posy = self.position().y()
			
			if(boss.position().y() > self.position().y()) self.saltar()
		}
		
		method saltar(){
			var contador = 0
			
			game.onTick(100, 'saltoEnemigo', {=>
				position= game.at(self.position().x(), self.position().y()+1)
				contador = contador + 1
				
				if(contador == 3){
					game.removeTickEvent('saltoEnemigo')
					contador = 0
					game.onTick(100, 'movimientoNuevo', {=>
					if(self.enemigoEstaSobrePiso()){
						game.removeTickEvent('movimientoNuevo')
						contador = 0
					}
					self.bajar()
				})
				}
			})
		}
		
		
		
		method perderVidas(){
			vidas = vidas -1
		}
		
		method morir(id){
			if(vidas == 0){
				game.removeVisual(self)
				game.removeTickEvent("perseguir" + id)
			}
		}
		
		method cambiarImagen(){
			
			
			image = "nivel1/enemigo" + vidas + ".png"
			
		}
}



object nivelSalud inherits Visual(
	position = game.at(1,14),
	image="nivel1/3Vidas.png"
){
	method perderVida(cant){
		image = "nivel1/" + cant + "vidas.png"
	}

}


/*
class Digito {
  var property position
  var property valor = 0
  method image() = "numeros/" + valor + ".png" 
}


 * object decenaSegundos {
	
	var property position = game.at(14,14)
	var property image = "nivel1/3.png" 
	method descontarTiempo(){
			
	}
}
object unididadSegundos {
	var property position = game.at(15,14)
	var property image = self.nuevaImagen()
	const contador = [cero,uno,dos,tres,cuatro,cinco,seis,siete,ocho,nueve]
	
	
	method descontarUnidad(){
		game.onTick (100, "Descontar1", { => contador.get(9) -1})
	}
	
	
	method nuevaImagen(){}
}
 * 
 */

object cero {
	const property image = "nivel1/0.png"
	const  numero = 0
	
	method numero (){ return numero}
	
}
object uno {
	var property image = "nivel1/1.png"
	const  numero = 1
	
	method numero (){ return numero}
	
}
object dos {
	var property image = "nivel1/2.png"
	const  numero = 2
	
	method numero (){ return numero}
	
}
object tres {
	var property image = "nivel1/3.png"
	const  numero = 3
	
	method numero (){ return numero}
	
}
object cuatro{
	var property image = "nivel1/4.png"
	const  numero = 4
	
	method numero (){ return numero}
	
}
object cinco{
	var property image = "nivel1/5.png"
	const  numero = 5
	
	method numero (){ return numero}
	
}
object seis{
	var property image = "nivel1/6.png"
	const  numero = 6
	
	method numero (){ return numero}
	
	
}
object siete {
	var property image = "nivel1/7.png"
	const  numero = 7
	
	method numero (){ return numero}
}
object ocho {
	var property image = "nivel1/8.png"
	const  numero = 8
	
	method numero (){ return numero}
}
object nueve {
	var property image = "nivel1/9.png"
	const  numero = 9
	
	method numero (){ return numero}
}
/*
 * 
 * method cambiar tiempo
 * 
 * var numero = 30 - 29
 * var numeroEnLtras = numero.toString() "30" - "29"
 * 
 * 
 * objeto numero1  posicion fija image= munero/ + numeroEnLetras.get(0)
 * objeto numero2 posicion fija image= numero/ + numeroEN....get(1)
 * \
 * 
 *					30
 * 					29
 * 					28
 * 					27
 * 
 * game.ontIck(1000, ;temporizador, {=>
 * 		
 * 		numero = nmumero -1
 * 		numeroEnLetras = numero.toString()
 * 		numero1.image(munero/ + numeroEnLetras.get(0))
 * 		numero2.image(numero/ + numeroEnLtras....get(1))
 * 
 * })
 * 
 * 
 * 
 * 
 * 
 * 
 */