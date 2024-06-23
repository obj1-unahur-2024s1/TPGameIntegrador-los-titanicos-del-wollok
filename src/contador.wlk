import wollok.game.*
import elementos.*
import juego.*

class Digito {
  var property position
  var property valor = 0
  method image() = "nivel1/" + valor.toString() + ".jpg" 


}

object cronometro{
	var tiempo = 30
	var unidad = new Digito(position= game.at(15,14))
  	var decena = new Digito(position= game.at(14,14))
  	
  	method mostrar(){
  		game.addVisual(decena)
		game.addVisual(unidad)
  		
  	}
  	
	method reset(){
		self.detener()	
		tiempo = 30 
		//Detener y vuelva a 30
	}
	
	
	method iniciar(){
		game.onTick(1000,"Temporizador",{=>
			tiempo= tiempo - 1
			var un = tiempo%10
			var de = (tiempo/10).truncate(0)
			unidad.valor(un)
			decena.valor(de)
			if (tiempo == 0){
				if (boss.vidas() > 1){
				boss.restarVidas()
				nivelSalud.perderVida(boss.vidas())
				tiempo=30
				}
				else{
					juego.pantallaPerdiste()
				}
			}
		})
		//Decrementar desde 30 hasta 0 con onTick
		
		//Logica para obtener el tiempo de la unidad y la decena
	}
	
	method detener (){
		//Remover el onTick
		game.removeTickEvent("Temporizador")
	}
	
	method resetear(){
		tiempo = 30
	}
	
	
}