import juego.*
import elementos.*
import mapas.*
import contador.*
import wollok.game.*
class Niveles {
	
	var nivel 
	
	method nivelActual()= nivel
	
	method initialice(){
		
	}
	
	method prepararNivel(unMapa){
		
		juego.configurarTeclado()
		juego.dibujarPisoYTecho(unMapa)
		juego.agregarParedes()
		juego.agregarTodosLosBloques(unMapa)
	}
	
	method mapa() {self.prepararNivel(mapaNivel1)}
	
	method pasarNivel(){
		
	}
	
	
	method finalizarNivel(){
		game.clear()
		
	}
}

/*
object nivel1 inherits Niveles(nivel=1){
	
	method mapa() {self.prepararNivel(mapaNivel1)}
	
		
}

object nivel2 inherits Niveles(nivel=2){
	
	method mapa() {self.prepararNivel(mapaNivel2)}
	
}
* /
*/