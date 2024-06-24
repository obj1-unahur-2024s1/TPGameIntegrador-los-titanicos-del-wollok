import juego.*
import elementos.*
import mapas.*
import wollok.game.*

// El fondo 2 aparece en el nivel 1 y el nivel 2 se queda sin fondo
const nivel1 = new Niveles 
			(nivel=1,mapa=mapaNivel1,image=fondoNivel1,position=game.center(), enemigos = enemigosNivel1, sonidoNivel = game.sound("sonidos/musicaNivel0.mp3"))
const nivel2 = new Niveles
			(nivel=2,mapa=mapaNivel2,image=fondoNivel2,position=game.center(), enemigos = enemigosNivel2, sonidoNivel = game.sound("sonidos/musicaNivel1.mp3"))
const niveles = [nivel1, nivel2]
	


class Niveles inherits Visual {
	
	var property nivel 
	var property mapa
	var property enemigos
	var property sonidoNivel


}


