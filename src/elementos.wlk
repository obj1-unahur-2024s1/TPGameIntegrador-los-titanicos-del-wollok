import wollok.game.*
import juego2.*


class Bloques  {
	const property image 
	var property position
	
}

class PisoMedio inherits Bloques{

}
class Columna inherits Bloques {
	
}
class ColumnaBaja inherits Bloques{
	
}

class TipoElemento{
	
}

object boss {
	var property image = "nivel1/personaje.png"
	var property position = game.at(2,1)
}

