import wollok.game.*
import juego.*

class Bloques{
	const property image
	var property position
}

class PisoMedio inherits Bloques{
	
}
class Columna inherits Bloques{
	
}
class ColumnaBaja inherits Bloques{
	 
}

class TipoElemento{
	
}

object pacman {
	var property image = "nivel1/personaje.png"
	var property position = game.origin()
}

