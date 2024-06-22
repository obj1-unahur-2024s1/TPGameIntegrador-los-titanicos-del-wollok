import wollok.game.*
import mapas.*
import elementos.*
import contador.*
import logicaDeNiveles.*
const  nivel1 = new Niveles
			(nivel=1,mapa=mapaNivel1,image="fondo.png",position=game.center(), enemigos = enemigosNivel1)
		const  nivel2 = new Niveles
			(nivel=2,mapa=mapaNivel2,image="fondo.png",position=game.center(), enemigos= enemigosNivel2)
object juego{
	
		
	
	var property juegoIniciado = false
	
	var nivelActual = 0
<<<<<<< HEAD
=======
	
	
	const property niveles = [nivel1, nivel2]
>>>>>>> 83599990f277dea5bccbaf80b2c4ac237654a9b1
	/* INICIO DEL JUEGO ACA ABAJO TITANICOS */
	method juegoIniciado()=juegoIniciado
	
	method iniciarJuego(){
		//self.configurarNiveles()
		self.prepararVisual()
	}
	//method nivelActualSet(unNivel){nivelActual=unNivel}
	method nivelActual() = niveles.get(nivelActual)
	
	method agregarNivel(nuevoNivel) = niveles.add(nuevoNivel)
	
	method siguienteNivel(){
		self.finalizar()
		nivelActual++
		if (nivelActual < niveles.size()){
			self.dibujarNivel(self.nivelActual())
			self.prepararVisual()
			game.removeTickEvent('comprobarEnemigos')
		}
		else{
<<<<<<< HEAD
			self.pantallaGanaste()
			
=======
			game.stop()
			self.iniciarJuego() //si rompe sacar
>>>>>>> 83599990f277dea5bccbaf80b2c4ac237654a9b1
		}

	}
	
	method finalizar(){
		self.nivelActual().sonidoNivel().pause()
		game.clear()
		cronometro.resetear()
		boss.irAlInicio()
		
	}
	
	method pantallaGanaste(){
		game.clear()
		cronometro.resetear()
		boss.irAlInicio()
		game.addVisual(imagenGanaste)
	}
	
	method pantallaPerdiste(){
		self.finalizar()
		game.addVisual(imagenPerdiste)
	}
	
	method dibujarNivel(nivel){
		game.addVisualCharacter(boss)
		game.addVisual(nivelSalud)
		cronometro.mostrar()
		cronometro.iniciar()
		self.perseguirABoss(self.nivelActual().enemigos())
		self.configurarTeclado()
		self.dibujarPisoYTecho(nivel)
		self.agregarParedes()
		self.agregarTodosLosBloques(nivel)
		self.nivelActual().sonidoNivel().play()
		self.nivelActual().sonidoNivel().volume(0.1)
		
	}

	method prepararVisual(){
		game.title("SnowBros")
		game.height(15)
		game.width(18)
		game.cellSize(50)
		game.boardGround("fondo.png")
		self.dibujarNivel(self.nivelActual())
		
	}
	
	method prepararPresentacion(){
		game.title("SnowBros")
		game.height(15)
		game.width(18)
		game.cellSize(50)
		game.boardGround("fondo.png")
		game.addVisual(imagenInicial)
	}

	method perseguirABoss(listaDeEnemigos){
		
		listaDeEnemigos.forEach({
		rival => 
		const id = rival.identity().toString()
		game.addVisual(rival)
		game.whenCollideDo(rival, {p => p.impactoCon(rival, id ) p.resetPosition(rival)})
		game.onTick(350, "perseguir" + id, {=>
			rival.perseguir(self.nivelActual())
			
			
	})
	})
	
	}
	
	method pantallaInicio(){
		game.height(15)
		game.width(18)
		game.addVisual(fondoInicio)
		keyboard.enter().onPressDo{self.prepararVisual()}
		
	}
	
	method sacarFondoInicio(){
		game.removeVisual(fondoInicio)
	}
	method agregarBloqueRelleno(x,y, unNivel){  
		const bloqueRelleno = new BloqueRelleno(position = game.at(x,y), image ="nivel" + unNivel.toString() + "/bloqueRellenoNivel" + unNivel.toString() + ".png")
			game.addVisual(bloqueRelleno)
	}
	method agregarPiso(x,y, unNivel){    /// ojo maga hay distintas niveles, los nombres tienen que ser polimoricos, y se cambIA EL NUMERO DEL NIVEL
		const piso = new PisoMedio(position = game.at(x,y), image ="nivel" + unNivel.toString() + "/bloqueNivel" + unNivel.toString() + "Medio.png")
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
		mapaARepresentar.mapa().lineasDeMuros().forEach({x=> self.agregarPiso(x.get(0),x.get(1), mapaARepresentar.nivel())})
		mapaARepresentar.mapa().bloquesDeRelleno().forEach({x=> self.agregarBloqueRelleno(x.get(0),x.get(1), mapaARepresentar.nivel())})
		//mapaARepresentar.dibujarPiso()
	}
	
	method dibujarPisoYTecho(unMapa){
	
		var posicion = 0
		(0..18).forEach({e => 
		self.agregarPiso(posicion, 0, unMapa.nivel())
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
		boss.irHaciaDerecha(self.nivelActual())
		if(!boss.hayBloqueAbajo(self.nivelActual())){
			game.onTick(100, 'bajar2', {=>
				boss.bajar()
				if(boss.estaSobrePiso()){
					game.removeTickEvent('bajar2')
				}
			})
		}
	}
	
	game.onTick(5000, 'comprobarEnemigos', {=>
		if(self.nivelActual().enemigos().size() == 0){
			self.siguienteNivel()
			
		}
		
	})
	
	keyboard.left().onPressDo {
		boss.irHaciaIzquierda(self.nivelActual())
		if(!boss.hayBloqueAbajo(self.nivelActual())){
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
	
	
	

}