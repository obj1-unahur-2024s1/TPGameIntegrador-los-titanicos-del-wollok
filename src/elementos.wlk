import wollok.game.*
import juego.*
import mapas.*
import logicaDeNiveles.*

const enemigosNivel1 =  (0..2).map({n => new Enemigo(image="nivel1/enemigo3.png" )})
							
							
const enemigosNivel2 = (0..4).map({n => new Enemigo(image="nivel2/enemigo3.png" )})


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

class BloqueRelleno inherits PisoMedio{
	
}

class TipoElemento{
	
}

object boss {
	var property image = "nivel1/bossDerecha.png"
	var property position = game.at(2,1)
	
	var vidas = 3
	
	method irAlInicio(){
		position = game.at(2,1)
	}
	method cambiarIimagenDerecha(){
	  	 image="nivel1/bossDerecha.png"
	 }
	method cambiarImagenIzquierda(){
		 image="nivel1/bossIzquierda.png"
	} 
	method irHaciaDerecha(mapaARepresentar){
		var posicionx = self.position().x()
		var posiciony = self.position().y()
			//verificar si puede moverse
			if(mapaARepresentar.mapa().lineasDeMuros().any({e => e.get(1)==posiciony and e.get(0) == posicionx}) or (posicionx == 17)){
				position = game.at(posicionx - 1, posiciony )	 
			}
		self.cambiarIimagenDerecha()
		}

	method irHaciaIzquierda(mapaARepresentar){
		var posicionx = self.position().x()
		var posiciony = self.position().y()
		if(mapaARepresentar.mapa().lineasDeMuros().any({e => e.get(1)==posiciony and e.get(0) == posicionx}) or (posicionx == 0)){
			position = game.at(posicionx + 1, posiciony )	
		}
		self.cambiarImagenIzquierda()
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
	method hayBloqueAbajo(mapaARepresentar){
		var posicionx = self.position().x()
		var posiciony = self.position().y()
		return mapaARepresentar.mapa().lineasDeMuros().any({e => e.get(1) ==posiciony -1 and e.get(0) == posicionx})
	}
	
	
	//si no estoy en borde y no hay bloque baja
	method bajar(){
		var posicionx = self.position().x()
	    var posiciony = self.position().y()
	    
	    if(posiciony > 1 and not self.hayBloqueAbajo(juego.nivelActual())){
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
		return self.hayBloqueAbajo(juego.nivelActual()) or posiciony == 1
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
			juego.pantallaPerdiste()
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
		(position=game.at(5.randomUpTo(game.width()-2).truncate(0),
                 5.randomUpTo(game.height()-2).truncate(0))){
		
		var property vidas = 3
		var property estaVivo = true

		
		method enemigosPersiguiendo(lista){
			lista.forEach({
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
		method perseguir(mapaARepresentar){
			
		var posx = self.position().x()
		var posy = self.position().y()
		
		
		
		
		
	
		
		if(boss.position().x() > self.position().x() and !self.hayBloqueHaciaDerecha(mapaARepresentar))
		{position = game.at(posx + 1, posy) self.caer() } else self.verHaciaAbajo(mapaARepresentar)
			
		}
		
		
		method caer(){
			
			
			if(!self.hayBloqueHaciaAbajo(juego.nivelActual())){
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
		    
		    if(posiciony > 1 and not self.hayBloqueHaciaAbajo(juego.nivelActual())){
		    	position= game.at(posicionx, posiciony -1)
		    }
	    	
		}
		
		method enemigoEstaSobrePiso(){
			var posicionx = self.position().x()
	    	var posiciony = self.position().y()
		return self.hayBloqueHaciaAbajo(juego.nivelActual()) or posiciony == 1
		}
		
		
		
		
		method hayBloqueHaciaDerecha(mapaARepresentar){
			var posx = self.position().x()
			var posy = self.position().y()
			return mapaARepresentar.mapa().lineasDeMuros().any({e => e.get(1)==posy   and e.get(0) == posx + 1})
			
		}
		
		method hayBloqueHaciaAbajo(mapaARepresentar){
			var posx = self.position().x()
		    var posy = self.position().y()
			return mapaARepresentar.mapa().lineasDeMuros().any({e => e.get(1)==posy - 1 and e.get(0) == posx})
		}
		
		method hayBloqueHaciaIzquierda(mapaARepresentar){
			var posx = self.position().x()
			var posy = self.position().y()
			return mapaARepresentar.mapa().lineasDeMuros().any({e => e.get(1)==posy   and e.get(0) == posx - 1})
		}
		
		method hayBloqueHaciaArriba(mapaARepresentar){
			var posx = self.position().x()
			var posy = self.position().y()
			return mapaARepresentar.mapa().lineasDeMuros().any({e => e.get(1) == posy + 1 and e.get(0) == posx})
		}
		
		method verHaciaAbajo(mapaARepresentar){
			var posx = self.position().x()
		    var posy = self.position().y()
			if(boss.position().y() < self.position().y() and !self.hayBloqueHaciaAbajo(mapaARepresentar)) {position = game.at(posx, posy - 1)} else {self.verHaciaAtras(mapaARepresentar)}
		}
		
		method verHaciaAtras(mapaARepresentar){
			var posx = self.position().x()
			var posy = self.position().y()
			if(boss.position().x() < self.position().x() and !self.hayBloqueHaciaIzquierda(mapaARepresentar)){position = game.at(posx - 1, posy) self.caer()} else self.saltar()
			
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
				juego.nivelActual().enemigos().remove(self)
			}
			
		}
		
		method cambiarImagen(){
			
			image = "nivel" + (juego.nivelActualGetter() +1) + "/enemigo"+ vidas + ".png"
			//image = "nivel1/enemigo" + vidas + ".png"
			
		}
		
		
}

object fondoInicio inherits Visual(
	position = game.origin(),
	image="fondoInicio.png"){
		
	}

object nivelSalud inherits Visual(
	position = game.at(1,14),
	image="nivel1/3Vidas.jpg"
){
	method perderVida(cant){
		image = "nivel1/" + cant + "vidas.jpg"
	}
}
	
	
object imagenInicial{
	var property position = game.at(0,0)
	var property image = 'imagenFondo.jpg'

}

object imagenPerdiste{
	var property position = game.at(0,0)
	var property image = 'gameOver/gameOver4.png'

}

object imagenGanaste{
	var property position = game.at(0,0)
	var property image = "Win/WinImage.png"
}

object imagenFinal{
	var property position = game.at(0,0)
	var property image = "end.png"
}


class Digito {
  var property position
  var property valor = 0
  method image() = "nivel1/" + valor.toString() + ".jpg" 


}

object cronometro{
	var tiempo = 30
	var unidad = new Digito(position= game.at(15,14))
  	var decena = new Digito(position= game.at(14,14))
  	
  	method mostrar(){
  		game.addVisual(decena)
		game.addVisual(unidad)
  		
  	}
  	
	method reset(){
		self.detener()	
		tiempo = 30 
		//Detener y vuelva a 30
	}
	
	
	method iniciar(){
		game.onTick(1000,"Temporizador",{=>
			tiempo= tiempo - 1
			var un = tiempo%10
			var de = (tiempo/10).truncate(0)
			unidad.valor(un)
			decena.valor(de)
			if (tiempo == 0){
				if (boss.vidas() > 1){
				boss.restarVidas()
				nivelSalud.perderVida(boss.vidas())
				tiempo=30
				}
				else{
					juego.pantallaPerdiste()
				}
			}
		})
		//Decrementar desde 30 hasta 0 con onTick
		
		//Logica para obtener el tiempo de la unidad y la decena
	}
	
	method detener (){
		//Remover el onTick
		game.removeTickEvent("Temporizador")
	}
	
	method resetear(){
		tiempo = 30
	}
	
	
}


