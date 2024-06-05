import wollok.game.*
import juego2.*
import caracter.*
import elementos.*

class Mapa  {
	

	const property lineasDeMuros = []
	const property nivel
}
			//MAPA DE NIVEL 1
	const mapaNivel1= new Mapa(lineasDeMuros=[[0,3], [1,3], [2,3], [3,3], [4,3],[5,3],
		[0,4], [1,4], [2,4], [3,4], [4,4],[5,4]
	], nivel=1)

	const mapaNIvel2= new Mapa(lineasDeMuros=[], nivel=2)