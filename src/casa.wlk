import cosas.* //obviamente, vamos a usar los objetos del archivo cosas ;-)

object casaDePepeYJulian {
	const cosas = []
	var property cuentaBancaria
	
	method comprar(cosa) {
		self.gastar(cosa.precio())
		cosas.add(cosa)
	}
	
	method cantidadDeCosasCompradas() = cosas.size()
	
	method tieneComida() {
		return cosas.any({cosa => cosa.esComida()})
	}
	
	method esDerrochona() {
		return cosas.sum({cosa => cosa.precio()}) >= 90000
	}
	
	method compraMasCara() {
		return cosas.max({cosa => cosa.precio()})
	}
	
	method electrodomesticosComprados() {
		return cosas.filter({cosa => cosa.esElectrodomestico()})
	}
	
	method malaEpoca() {
		return cosas.all({cosa =>cosa.esComida()})
	}
	
	method queFaltaComprar(aComprar) {
		return aComprar.asSet().difference(cosas.asSet()).asList()
	}
	
	method faltaComida() {
		return cosas.filter({cosa => cosa.esComida()}).size() < 2
	}
	
	method gastar(importe) {
		cuentaBancaria.extraer(importe)
	}
	
	method dineroDisponible() {
		return cuentaBancaria.saldo()
	}
	
}
