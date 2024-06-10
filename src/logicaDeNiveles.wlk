import juego.*
import mapas.*
import wollok.game.*
class Niveles {
	
	var nivel
	
	method nivelActual()= nivel
	
	method prepararNivel(unMapa){
		
		juego.configurarTeclado()
		juego.dibujarPisoYTecho(unMapa)
		juego.agregarParedes()
		juego.agregarTodosLosBloques(unMapa)
	}
	method finalizarNIvle(){
		game.clear()
		
	}
}

object nivel1 inherits Niveles(nivel=1){
	
	method mapa() {self.prepararNivel(mapaNivel1)}
		
}
object nivel2 inherits Niveles(nivel=1){
	
	
	
	
	
	
}