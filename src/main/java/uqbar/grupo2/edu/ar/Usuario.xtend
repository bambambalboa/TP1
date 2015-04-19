   package uqbar.grupo2.edu.ar

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import uqbar.grupo2.edu.ar.exceptions.BusinessException
import java.util.ArrayList
import java.util.List

import static uqbar.grupo2.edu.ar.DateUtil.*

@Accessors
class Usuario {
	String nombre
	int peso
	double altura
	DateTime fechaNacimiento
	String rutina
	
	var String[] condicionesPreexistentes
	//List<CondicionPreexistente> condicionesPreexistentes
	String sexo
	var String[] preferenciasAlimenticias //Esto si va a tener que ser una clase, hay que ver que piden los puntos mas adelante.. PENDIENTE

	Usuario unUsuario
	List<Receta> recetasCreadas

	/*def void initialize() {
		condicionesPreexistentes = new ArrayList<CondicionPreexistente>		
	}*/
	
	def boolean esValido() {
		validarDatosObligatorios() // tiene los siguientes campos obligatorios: nombre, peso, altura, fecha de nacimiento, rutina
		validarNombre() //Se debe validar que el nombre tenga mas de 4 caracteres...
		validarSexo() //si el usuario es diabético, debe indicar el sexo
		validarPreferencia() //si el usuario es hipertenso o diabético, debe indicar al menos una preferencia
		validarVeganicidad() //si el usuario es vegano no puede aparecer ninguna de estas palabras como preferencia: “pollo”, “carne”, “chivito”, “chori”
		validarFecha() //la fecha de nacimiento debe ser una fecha anterior a la del día de hoy

		true //Si paso todas las validaciones, si, es valido...
	}

	def private validarDatosObligatorios() {
		if (nombre.nullOrEmpty)
			throw new BusinessException("El usuario no tiene seteado el nombre")
		if (peso.toString.equals("0"))
			throw new BusinessException("El usuario no tiene seteado el peso")
		if (altura.toString.equals("0.0"))
			throw new BusinessException("El usuario no tiene seteada la altura")
		if (fechaNacimiento == null)
			throw new BusinessException("El usuario no tiene seteada la fecha de nacimiento")
		if (rutina.nullOrEmpty)
			throw new BusinessException("El usuario no tiene seteada la rutina")
	}

	def private validarNombre() {
		if (this.nombre.length < 5) {
			throw new BusinessException("Usuario con nombre corto")
		}
	}

	def private validarSexo() {
		if (condicionesPreexistentes.contains("diabetico"))
			if (sexo.nullOrEmpty)
				throw new BusinessException("El usuario es Diabetico y no tiene el campo sexo fijado")
	}

	def private validarPreferencia() {
		if (condicionesPreexistentes.contains("hipertenso") || condicionesPreexistentes.contains("diabetico")) //ver si se puede evitar repetir la validacion!
			if (preferenciasAlimenticias.nullOrEmpty)
				throw new BusinessException("El usuario tiene problemas y no ha indicado su preferencia alimenticia")
	}

	def private validarVeganicidad() {
		val preferenciasAntiVeganas = newArrayList("pollo", "carne", "chivito", "chori")
		val cantidadDeElementos = preferenciasAntiVeganas.size

		if (!preferenciasAlimenticias.nullOrEmpty) {
			if (condicionesPreexistentes.contains("vegano"))
				preferenciasAntiVeganas.removeAll(preferenciasAlimenticias)
			if (preferenciasAntiVeganas.size < cantidadDeElementos)
				throw new BusinessException("El usuario no es un verdadero Vegano.")
		}
	}

	def private validarFecha() {
		if (noEsAntigua(fechaNacimiento)) {
			throw new BusinessException("El usuario no nacio, aun.")
		}
	}

	// Comienzo de Punto 2	
	def indiceDeMasaCorporal() {
		this.peso / (this.altura * this.altura)
	}
	
	def validarRangoIndiceIMC() {
		if (this.indiceDeMasaCorporal() > 18 && this.indiceDeMasaCorporal() <30 ){
			return true
			}
		else
			return false			
	}
	
	def boolean rutinaSaludable() {
		if (!this.validarRangoIndiceIMC()) {
			return false
			}
		if (this.tieneCondicionesPreexistentes()) {
			return false
		}
		else
			{
				return true
			}
		}
	
	def tieneCondicionesPreexistentes() {
		if(condicionesPreexistentes.size > 0){
				return true
			}
		else{
			return false
		}
	}
	
		//false 
	}
	