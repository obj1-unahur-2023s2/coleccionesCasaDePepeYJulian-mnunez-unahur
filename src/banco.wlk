object cuentaCorriente {
	var saldo = 0
	
	method saldo() = saldo
	method tieneSaldo() = saldo > 0
	
	method depositar(monto) {
		saldo += monto
	}
	
	method extraer(monto) {
		if(saldo < monto) {
			self.error("no se puede extraer ese monto")
		}
		saldo -= monto
	}
}

object cuentaConGastos {
	var saldo = 0
	
	method saldo() = saldo
	method tieneSaldo() = saldo > 0
	
	method depositar(monto) {
		saldo += 0.max(monto - 200)
	}
	
	method extraer(monto) {
		const comision = if(monto == 0) 0 
						else if(monto <= 10000) 200 
						else monto * 0.02
		if(saldo < (monto + comision)) {
			self.error("no se puede extraer ese monto")
		}
		saldo -=  monto + comision
	}
}

object cuentaCombinada {
	var property cuentaPrimaria
	var property cuentaSecundaria
	
	method saldo() {
		return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
	}
	
	method depositar(monto) {
		cuentaPrimaria.depositar(monto)
	}

//	method transferir(monto, origen, destino) {
//		origen.extraer(monto)
//		destino.depositar(monto)
//	}
	
	method extraer(monto) {
		const aExtraerEnPrimaria = monto.min(cuentaPrimaria.saldo())
		cuentaPrimaria.extraer(aExtraerEnPrimaria)
		cuentaSecundaria.extraer(monto - aExtraerEnPrimaria)
		
	}
	
}



