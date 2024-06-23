import juego.*
import elementos.*
import mapas.*
import wollok.game.*

const nivel1 = new Niveles
			(nivel=1,mapa=mapaNivel1,image="fondo.png",position=game.center(), enemigos = enemigosNivel1, sonidoNivel = game.sound("sonidos/musicaNivel0.mp3"))
const nivel2 = new Niveles
			(nivel=2,mapa=mapaNivel2,image="fondo.png",position=game.center(), enemigos = enemigosNivel2, sonidoNivel = game.sound("sonidos/musicaNivel1.mp3"))
const niveles = [nivel1, nivel2]
	


class Niveles inherits Visual {
	
	var property nivel 
	var property mapa
	var property enemigos
	var property sonidoNivel

}


