package uqbar.grupo2.edu.ar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import uqbar.grupo2.edu.ar.exceptions.BusinessException

@Accessors
class Receta {
	String nombre
	List listaDeIngredientes
	//Necesario mas adelante....
	List listaDeCondimentos
	String procedimientoPreparacion
	List esInadecuado
	int caloriasTotales
	String dificultad
	String temporada
	
	def esValido() {
		validarIngredientes() //Minimo un ingrediente
		validarCalorias()
		
		true
	}
	
	def validarCalorias() {
		if (this.caloriasTotales < 10 || this.caloriasTotales > 5000) throw new BusinessException("La receta es inválida, el rango de calorias debe estar entre 10 ys 5000")
	}
	
	def validarIngredientes() {
		if (this.listaDeIngredientes.length < 1) throw new BusinessException("La receta es inválida, debe tener al menos 1 ingrediente.")
	}
	
	
	
}