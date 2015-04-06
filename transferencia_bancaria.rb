# Los Clientes del banco MyBank, pueden realizar transferencias hacia sus propias cuentas,
# o a cuentas a otros personas, sean del banco o de otros bancos.

# Usted es contratado por el departamento de Tecnología del Banco, y debe realizar el algoritmo del proceso
# del sistema en ruby para el manejo de Transferencias.

# A fin de estandarizar los procesos en este ejercicio,
# los números de cuenta de todos los bancos son de 20 dígitos numéricos,
# y las transferencias interbancarias se procesan inmediatamente.

# Para que una transferencia pueda ser realizada Los Clientes deben contar con una cuenta en el banco, 
#con saldo suficiente
# para cubrir el monto de la transferencia, se debe verificar que la cuenta destino cumpla con el standard.

# Luego de realizada la transferencia deben actualizarse los saldos tanto en la cuenta origen como destino.
# y se debe enviar un mensaje de confirmación de la operación (si fue exitosa o no).

# Los clientes debe contar con la opción de visualizar los saldos de sus cuentas en cualquier momento 
#(antes o después de las transferencias)
class Banco
	attr_accessor :clientes
	def initialize(nombre)
		@nombre = nombre
		@clientes = Array.new
	end
	def clientes(cliente)
		 @clientes.push(cliente)		
	end
	def mostrar_clientes
		puts "los clientes de #{@nombre} son: #{@clientes}"
		
	end
	def transferencia(cliente1,cliente2,monto)
		if cliente1.n_cuenta.length == 20 
			test=cliente1.quitar_monto(monto)
			if test == true
			cliente2.depo_monto(monto)
			end			
		end
		
	end
	
end
class Cliente
	attr_accessor :nombre, :apellido, :ci, :n_cuenta, :total
	def initialize(nombre, apellido, ci, n_cuenta, monto_apertura)
		@nombre = nombre
		@apellido = apellido
		@ci = ci
		@n_cuenta = n_cuenta
		@total = monto_apertura
	end
	def quitar_monto(monto)
		if monto < @total
			@total = @total - monto
			return true
		else puts "Error, el cliente no posee el saldo suficiente para realizar esta operacion"
			return false
		end
	end
	def depo_monto(monto)
		@total = @total + monto
	end
	def saldo
		puts "Sr(a) #{@nombre}, su saldo es #{@total} Bs." 
		
	end
end

def main
	
	banco1 = Banco.new("mybank")
	persona1 = Cliente.new("Hector", "Carreno","23644389","10200000000000000001",10000)
	persona2 = Cliente.new("Yoandre","Castellano","18088948","10200000000000000002",1000)
	persona3 = Cliente.new("Hector", "Carreno","23644389","10100000000000000001",10000)
	
	banco1.clientes(persona1)
	banco1.clientes(persona2)

	#print banco1.mostrar_clientes
	persona1.saldo
	banco1.transferencia(persona1,persona2,15000)
	persona1.saldo
	persona2.saldo
	
end
main