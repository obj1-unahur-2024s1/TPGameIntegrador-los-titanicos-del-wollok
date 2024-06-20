import juego.*
import elementos.*
import mapas.*
import contador.*
import wollok.game.*

const enemigosNivel1 = [new Enemigo(image="nivel1/enemigo3.png",position=game.at(9,4)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(9,7)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(3,10))
							]
							
const enemigosNivel2 = [new Enemigo(image="nivel1/enemigo3.png",position=game.at(10,4)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(10,7)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(4,10))
							]
class Niveles inherits Visual {
	
	var property nivel 
	var property mapa
	var property enemigos
}
	


	
		


//object nivel2 inherits Niveles(nivel=2){
	
	//method mapa() {self.prepararNivel(mapaNivel2)}


