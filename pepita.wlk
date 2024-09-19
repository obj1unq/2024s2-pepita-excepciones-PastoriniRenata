object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = self.energiaResultante(distancia)
	}

	method validarVolar(distancia){
		if (not self.puedeVolar(distancia)){
			self.error( "No tiene energía suficiente para volar")
		}
	}
		
	method energia() {
		return energia
	}

	method puedeVolar(distancia){
		return self.energiaResultante(distancia) >= 0
	}

	method energiaResultante(distancia){
		return energia - 10 - distancia
	}

}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
			self.validarVolar(distancia)
			energia = self.energiaResultante(distancia)
		}
	
	method validarVolar(distancia){
		if (not self.puedeVolar(distancia)){
			self.error( "No tiene energía suficiente para volar")
		}
	}
	

	method energiaResultante(distancia){
		return energia - 20 - 2*distancia
	}

	method puedeVolar(distancia){
		return self.energiaResultante(distancia) >= 0
	}
}

object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}


/*
primera version
object milena {
	const property aves = #{pepita, pepon}

	method movilizar(distancia) {
		if (self.puedeMovilizarse(distancia)){
			//CUANDO ES UNA ORDEN (UNA ACCION) VA UN FOREACH!!
			//COMO LO HABIA HECHO aves.map({ave => ave.volar(distancia)})
			aves.forEach({ave => ave.volar(distancia)})

		}else{

			self.error("Milena NO puede movilizarse porque " + self.avesQueNoPuedenVolar(distancia) + " no puede volar")
		}
		
	}
	method avesQueNoPuedenVolar(distancia){
		return aves.filter{ave => ! ave.puedeVolar(distancia)}
	}

	method puedeMovilizarse(distancia){
		return aves.all({ave => ave.puedeVolar(distancia)})
	}


}
*/




object milena{

	const aves = #{}
	method movilizar(distancia){
		self.validarMovilizar(distancia)
		//CUANDO ES UNA ORDEN (UNA ACCION) VA UN FOREACH!!
		aves.forEach({ave => ave.volar(distancia)})

	}
	
	method validarMovilizar(distancia){
		if( not aves.all({ave => ave.puedeVolar(distancia)})){
			self.error("Milena NO puede movilizarse porque " + self.avesQueNoPuedenVolar(distancia) + " no puede volar")

		}
	}

	method avesQueNoPuedenVolar(distancia){
		return aves.filter{ave => ! ave.puedeVolar(distancia)}
	}

	method agregarAve(ave){
		aves.add(ave)
	}

}

