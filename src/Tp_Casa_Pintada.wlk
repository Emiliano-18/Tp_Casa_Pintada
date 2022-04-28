object casaPintura{
	var property pintura = 200
	method precioPin(precio){
	pintura = precio
}
		
}

object casaAGranel{
	var property pintura = 0

//Como cada litro cubre un metro, lo multiplico por $3,5	
	method precioPin(metros){
		pintura = metros * 3.5
		return pintura
	}
}


object aldo{
	var ahorros = 6000
	var property superficie = 0
	var ancho
	var largo 
	var alto


method ah(dinero){
	ahorros += dinero	
}
method presup(){
	return (ahorros * 0.2).truncate(0)
}

method pinNec(metros){
	return (metros/50).roundUp()

}



method costPin(metros,tPin){
	if (tPin == "aGranel") {
		return casaAGranel.precioPin(metros)
	}
	else 
	return self.pinNec(metros) * casaPintura.pintura()
	
}

method medidasCoc(anc,lar,al){
	ancho = anc
	largo = lar
	alto = al
}

method superf(met){
	if (met == "cocina"){
		return self.cocina()
	}
	else
		return 20
}


method cocina(){
	return ((ancho + largo) * 2 * alto)
}

method supertotal(met){
	superficie += self.superf(met)
	

}


method puedeCont(pintor,metros,tPin) = self.presup() > pintor.pintar(metros,tPin)



}

object raul{
// Cobra $25 por m2 + Costo pintura

	
method pintar(metros,tPin){
	if (tPin == "aGranel"){
		return  25*metros + casaAGranel.precioPin(metros)
	}
	else
		return 25*metros + casaPintura.pintura() * aldo.pinNec(metros)
}


}


object carlos{
//Cobra como minimo $500 hasta una superficie de hasta 20 m2 y luego $30 por m2
method pintar(metros,tPin){
	if (metros > 20){
		return 500 + 30*self.mtsAd(metros)
	}
	else
	return 500
}

method mtsAd(metros){
	return metros-20
}

}

object venancio{
//Cobra $220 cada 10 m2 + Costo pintura

method pintar(metros,tPin){
	if (tPin == "aGranel"){
		return 220 * self.cantMt(metros) + casaAGranel.precioPin(metros)
	}
	else
		return 220 * self.cantMt(metros) + casaPintura.pintura() * aldo.pinNec(metros)
}

method cantMt(metros){
	return (metros/10).roundUp()
}
	
}



//Una lata de pintura rinde 50 m2 y cuesta $200


