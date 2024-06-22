import juego.*
import elementos.*
import mapas.*
import contador.*
import wollok.game.*

<<<<<<< HEAD
const nivel1 = new Niveles
			(nivel=1,mapa=mapaNivel1,image="fondo.png",position=game.center(), enemigos = enemigosNivel1, sonidoNivel = game.sound("sonidos/musicaNivel0.mp3"))
const nivel2 = new Niveles
			(nivel=2,mapa=mapaNivel2,image="fondo.png",position=game.center(), enemigos = enemigosNivel2, sonidoNivel = game.sound("sonidos/musicaNivel1.mp3"))
const niveles = [nivel1, nivel2]
	
=======
const enemigosNivel1 = [new Enemigo(image="nivel1/enemigo3.png",position=game.at(9,4)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(9,7)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(3,10))
							]
							
const enemigosNivel2 = [new Enemigo(image="nivel1/enemigo3.png",position=game.at(10,4)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(14,7)),
							new Enemigo(image="nivel1/enemigo3.png",position=game.at(7,10)), new Enemigo(image="nivel1/enemigo3.png",position=game.at(8,6))
							]
>>>>>>> 83599990f277dea5bccbaf80b2c4ac237654a9b1
class Niveles inherits Visual {
	
	var property nivel 
	var property mapa
	var property enemigos
	var property sonidoNivel

}


