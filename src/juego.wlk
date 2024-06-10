import wollok.game.*
import mapas.*
import elementos.*
import contador.*
object juego{
	const enemigosNivel1 = [ new Enemigo(position=game.at(9,4)), new Enemigo(position=game.at(9,7)), new Enemigo(position=game.at(3,10))]
	

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
		self.configurarTeclado()
		self.dibujarPisoYTecho(mapaNivel1)
		self.agregarParedes()
		self.agregarTodosLosBloques(mapaNivel1)
		//self.reproducirMusica()
	
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
	
	method configurarTeclado(){
		var contador = 0
		
		keyboard.right().onPressDo {
		boss.irHaciaDerecha()
		if(!boss.hayBloqueAbajo()){
			game.onTick(100, 'bajar2', {=>
				boss.bajar()
				if(boss.estaSobrePiso()){
					game.removeTickEvent('bajar2')
				}
			})
		}
	}
	
	keyboard.left().onPressDo {
		boss.irHaciaIzquierda()
		if(!boss.hayBloqueAbajo()){
			game.onTick(100, 'bajar1', {=>
				boss.bajar()
				if(boss.estaSobrePiso()){
					game.removeTickEvent('bajar1')
				}
			})
		}
	}
	
	keyboard.up().onPressDo {

		game.onTick(50, 'movimiento', {=>
			boss.saltar()
			contador = contador + 1
			if(contador == 3){
				game.removeTickEvent('movimiento')
				contador = 0
				game.onTick(100, 'movimientoNuevo', {=>
					if(boss.estaSobrePiso()){
						game.removeTickEvent('movimientoNuevo')
						contador = 0
					}
					boss.bajar()
				})
			}
			
		})
	}
	
	keyboard.down().onPressDo {
		boss.irHaciaAbajo()
	}
	
	
	keyboard.a().onPressDo{
			const proyectil = new Proyectil(image= 'nivel1/disparoIzquierda.png')
			proyectil.irHaciaIzquierda()
			game.addVisual(proyectil)
			var id = proyectil.identity().toString()
		game.onTick(50, "movimiento" + id, {=> 
			proyectil.irHaciaIzquierda()
			if(proyectil.position().x() == -1){
				proyectil.removerSiEsta()
				game.removeTickEvent("movimiento" + id )
				
		} 
		})
	}
	
	keyboard.d().onPressDo {const proyectil = new Proyectil(image= 'nivel1/disparoDerecha.png') 
			proyectil.irHaciaDerecha()
			game.addVisual(proyectil)
			var id = proyectil.identity().toString()
			game.onTick(50, "movimiento" + id , {=> 
			
			proyectil.irHaciaDerecha()
			
				if(proyectil.position().x() == 19){
				proyectil.removerSiEsta()
				game.removeTickEvent("movimiento" + id )
				
		} 
		})
		
	}
	}
	
	method iniciar(){
		game.start()}	
	
}