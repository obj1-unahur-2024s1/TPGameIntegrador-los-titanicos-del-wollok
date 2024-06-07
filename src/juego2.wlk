import wollok.game.*
import mapas.*
import elementos.*
object juego{
	
//var piso= [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0]]
	method preparar(){
		game.title("SnowBros")
		game.height(15)
		game.width(18)
		game.cellSize(50)
		game.boardGround("fondo.png")
		game.addVisualCharacter(boss)
		
		self.dibujarPisoYTecho(mapaNivel1)
		self.agregarParedes()
		self.agregarTodosLosBloques(mapaNivel1)
		//self.reproducirMusica()
	}
	
	method reproducirMusica(){
		var sound = game.sound("sonidos/musica.mp3")
		sound.shouldLoop(true)
		game.schedule(500, { sound.play()} )
		keyboard.enter().onPressDo({sound.stop()})
		keyboard.p().onPressDo({sound.volume(1)})
		keyboard.o().onPressDo({sound.volume(0.2)})
	}	
	
	
	method agregarPiso(x,y, unNivel){    /// ojo maga hay distintas niveles, los nombres tienen que ser polimoricos, y se cambIA EL NUMERO DEL NIVEL
		const piso = new PisoMedio(position = game.at(x,y), image ="nivel1/bloqueNivel" + unNivel.toString() + "Medio.png")
	
		game.addVisual(piso)
	}
	method agregarColumnaAlta(x,y){
		const columna = new Columna(position = game.at(x,y), image = "nivel1/columnaLvl1Alta.png")
		game.addVisual(columna)
	}
	method agregarColumnaBaja(x,y){
		const columna = new Columna(position = game.at(x,y), image = "nivel1/columnaLvl1Baja.png")
		game.addVisual(columna)
	}
	method agregarColumnaBajaIzq(x,y){
		const columna = new Columna(position = game.at(x,y), image = "nivel1/columnaLvl1BajaIzq.png")
		game.addVisual(columna)
	}	

	method agregarTodosLosBloques(mapaARepresentar){
		mapaARepresentar.lineasDeMuros().forEach({x=> self.agregarPiso(x.get(0),x.get(1), mapaARepresentar.nivel())})
		//mapaARepresentar.dibujarPiso()
	}
	
	method dibujarPisoYTecho(unMapa){
		var posicion = 0
		(0..18).forEach({e => 
		self.agregarPiso(posicion, 0, unMapa.nivel())
			//self.agregarPiso(posicion, 14, unMapa.nivel())
			posicion = posicion + 1			
		})}

	
	method agregarParedes(){
		
	var posicion = 1
	(0..14).forEach({e => 
			self.agregarColumnaBaja(0, posicion)
			self.agregarColumnaBajaIzq(17, posicion)
			posicion = posicion + 1
					})	}

	method iniciar(){
		game.start()}	
	
}