import wollok.game.*
import elementos.*
object juego {
	method preparar(){
		game.title("SnowBros")
		game.height(40)
		game.width(50)
		game.cellSize(20)
		game.boardGround("fondo.png")
		game.addVisualCharacter(Boss)
		self.dibujarMuros()
	}
	
	
	}
	///////////////////////////////////////////////////////////
	/*
	 * Configura los stages/niveles del juego
	 */
	method configurarStages() {
		// stage 1
		const stage1 = new Stage(
			fondo = new Edificio(image="niveles/edificio-1.png"), 
			imgInicial = new Pantalla (image ="fondo/stage1.jpg"))
		
		stage1.agregarMultiplesVentanas(1, [
			[1,1],[2,1], [4,1], [5,1],
			[1,2], [2,2], [4,2], [5,2],
			[1,3], [2,3], [4,3], [5,3]
		])
		stage1.agregarMultiplesVentanas(2, [
			[3,3]
		])
		
		stage1.agregarMultiplesMacetas([
			[4,3],[1,2]
		])
		stage1.agregarMultiplesPostigos([
			[4,1],[1,3]
		])
		
		// stage 2
		const stage2 = new Stage(
			fondo = new Edificio(image="niveles/edificio-2.png"),
			imgInicial = new Pantalla (image = "fondo/stage2.jpg")
		)
		stage2.agregarMultiplesVentanas(1, [
			[1,1], [2,1], [4,1], [5,1],
			[1,2], [2,2], [4,2], [5,2],
			[1,3], [2,3], [4,3], [5,3]
		])
		stage2.agregarMultiplesVentanas(2, [
			[3,1],[3,2],[3,3]
		])

		stage2.agregarMultiplesMacetas([
			[2,2], [3,2],[4,2]		
		])
		stage2.agregarMultiplesPostigos([
			[1,2],[4,3]
		])

		// stage 3
		const stage3 = new Stage(
			fondo = new Edificio(image="niveles/edificio-2.png"),
			imgInicial = new Pantalla (image = "fondo/stage3.jpg")
		)
		stage3.agregarMultiplesVentanas(1, [
			[1,1], [2,1], [4,1], [5,1],
			[1,2], [2,2], [4,2], [5,2],
			[1,3], [2,3], [4,3], [5,3]
		])
		stage3.agregarMultiplesVentanas(2, [
			[3,1],
			[3,2],
			[3,3]
		])
		stage3.agregarMultiplesMacetas([
			[2,2], [4,2],
			[1,3], [5,3]
		])
		stage3.agregarMultiplesPostigos([
			[1,1],[3,3], [5,2]
		])

		// stage 4
		const stage4 = new Stage(
			fondo = new Edificio(image="niveles/edificio-2.png"),
			imgInicial = new Pantalla (image = "fondo/stage4.jpg")
		)
		stage4.agregarMultiplesVentanas(1, [
			[1,1], [2,1], [4,1], [5,1],
			[1,2], [2,2], [4,2], [5,2],
			[1,3], [2,3], [4,3], [5,3]
		])
		stage4.agregarMultiplesVentanas(2, [
			[3,1],
			[3,2],
			[3,3]
		])
		stage4.agregarMultiplesMacetas([
			[3,2], [4,2]
		])
		stage4.agregarMultiplesPostigos([
			[1,1],[1,2], [3,2],[4,3]
		])

		// stage 5
		const stage5 = new Stage(
			fondo = new Edificio(image="niveles/edificio-2.png"),
			imgInicial = new Pantalla (image = "fondo/stage5.jpg")
		)
		stage5.agregarMultiplesVentanas(2, [
			[1,1], [2,1], [3,1], [4,1], [5,1],
			[1,2], [2,2], [3,2], [4,2], [5,2],
			[1,3], [2,3], [3,3], [4,3], [5,3]
		])
		stage5.agregarMultiplesMacetas([
			[1,2],[2,2]

		])
		stage5.agregarMultiplesPostigos([
			[1,3],[4,3],[3,2],[5,1]
		])
		
		// stage 6
			const stage6 = new Stage(
			fondo = new Edificio(image="niveles/edificio-3.png"),
			imgInicial = new Pantalla (image = "fondo/stage6.jpg")
		)
		stage6.agregarMultiplesVentanas(1,[
			[1,1], [2,1], [3,1], [4,1], [5,1],
			[1,2], [2,2], [3,2], [4,2], [5,2],
			[1,3], [2,3], [3,3], [4,3], [5,3]
		])
		stage6.agregarMultiplesMacetas([
			[1,2],[2,2],[5,3],[2,3]

		])
		stage6.agregarMultiplesPostigos([
			[3,2],[4,1]
		])
		// stage 7
			const stage7 = new Stage(
			fondo = new Edificio(image="niveles/edificio-3.png"),
			imgInicial = new Pantalla (image = "fondo/stage7.jpg")
		)
		stage7.agregarMultiplesVentanas(2,[
			[1,1], [2,1], [3,1], [4,1], [5,1],
			[1,2], [2,2], [3,2], [4,2], [5,2],
			[1,3], [2,3], [3,3], [4,3], [5,3]
		])
		stage7.agregarMultiplesMacetas([
			[3,2], [4,2]

		])
		stage7.agregarMultiplesPostigos([
			[1,1],[1,3], [3,2],[4,3]
		])
	
	
	
	///////////////////////////////////////////////////////
	
	method agregarPiso(x,y){
		const piso = new PisoMedio(position = game.at(x,y), image = "nivel1/bloqueNivel1Medio.png")
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

	method dibujarMuros() {
      mapa1.forEach({x=> mapa1.lineasDeMuros().})
		self.dibujarLineaDeMuros(42, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeMuros(41, [3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeMuros(40, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(39, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(38, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(37, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(36, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(35, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(34, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(33, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(32, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(31, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(30, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(29, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(28, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(27, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(26, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(25, [4,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(24, [4,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])	
		self.dibujarLineaDeMuros(23, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(22, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(21, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(20, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(19, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(18, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeMuros(17, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeMuros(16, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeMuros(15, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])						
		self.dibujarLineaDeMuros(14, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(13, [4,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(12, [4,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(11, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(10, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])						
		self.dibujarLineaDeMuros(09, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(08, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(07, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(06, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(05, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(04, [4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2])
		self.dibujarLineaDeMuros(03, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeMuros(02, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
		self.dibujarLineaDeMuros(01, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
	}
	method dibujarLineaDeMuros(mapa1) {		
		mapa1.forEach({i=> i.linea().forEach({x=> if (x==1) self.agregarPiso(i, y) else if (x==2) )
	//		if(linea.get(i.linea() == 1 ) {
	//			self.agregarPiso(i, y)
	//		}
			 if(vectorFila.get(i.linea()) == 2){
				self.agregarColumnaAlta(i,y)
			}
			 if(vectorFila.get(i) == 3){
				self.agregarColumnaBaja(i,y)
			}
			 if(vectorFila.get(i) == 4){
				self.agregarColumnaBajaIzq(i,y)
			}
		})
	}
	method iniciar(){
		game.start()
	}
}



