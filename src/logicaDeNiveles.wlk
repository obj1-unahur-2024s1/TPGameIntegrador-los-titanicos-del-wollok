import juego.*
import elementos.*
import mapas.*
import contador.*
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

object pantallaInicio{
	
	method pantalla(){
		game.height(15)
		game.width(18)
		game.boardGround("fondoInicio.jpg")
		keyboard.enter().onPressDo{nivel1.preparar()}
		
	}
}

object nivel1 inherits Niveles(nivel=1){
	const enemigosNivel1 = [ new Enemigo(position=game.at(9,4)), new Enemigo(position=game.at(9,7)), new Enemigo(position=game.at(3,10))]

	
	method mapa() {self.prepararNivel(mapaNivel1)}
	method preparar(){
	
		game.title("SnowBros")
		game.height(15)
		game.width(18)
		game.cellSize(50)
		game.boardGround("fondo.png")
		game.addVisualCharacter(boss)
		game.addVisual(nivelSalud)
		cronometro.mostrar()
		cronometro.iniciar()

		self.perseguirABoss(enemigosNivel1)
		self.mapa()
		//nivel2.prepararNivel()
		//self.reproducirMusica()
	}	
		
		
		method reproducirMusica(){
		var sound = game.sound("sonidos/musica.mp3")
		sound.shouldLoop(true)
		game.schedule(500, { sound.play()} )
		keyboard.space().onPressDo({sound.stop()})
		keyboard.p().onPressDo({sound.volume(1)})
		keyboard.o().onPressDo({sound.volume(0.2)})
		
		}
		method perseguirABoss(listaDeEnemigos){
		
		listaDeEnemigos.forEach({
		rival => 
		const id = rival.identity().toString()
		game.addVisual(rival)
		game.whenCollideDo(rival, {p => p.impactoCon(rival, id ) p.resetPosition(rival)})
		game.onTick(350, "perseguir" + id, {=>
			rival.perseguir()
	})
	})
	}
}

object nivel2 inherits Niveles(nivel=2){
	
	method mapa() {self.prepararNivel(mapaNivel2)}
	method preparar(){
	
		game.title("SnowBros")
		game.height(15)
		game.width(18)
		game.cellSize(50)
		game.boardGround("fondo.png")
		game.addVisualCharacter(boss)
		game.addVisual(nivelSalud)
		cronometro.mostrar()
		cronometro.iniciar()

		self.perseguirABoss(enemigosNivel1)
		nivel1.mapa()
		//nivel2.prepararNivel()
		//self.reproducirMusica()
}