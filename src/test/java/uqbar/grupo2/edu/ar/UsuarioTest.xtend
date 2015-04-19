package uqbar.grupo2.edu.ar

import org.junit.Test
import org.junit.Assert
import org.junit.Before
import org.joda.time.DateTime

class UsuarioTest {

	Usuario Juan
	Receta unaReceta

	@Before
	def void initialize() {
		Juan = new Usuario;
		Juan.nombre = "Juancho" //Me piden mas de 4 letras :/
		Juan.peso = 85
		Juan.altura = 1.85
		Juan.fechaNacimiento = new DateTime(1991, 10, 21, 0, 0) //Por ahora va con hora :/
		Juan.rutina = "LEVE"
		Juan.condicionesPreexistentes = newArrayList("hipertenso", "superinteligencia", "vegano") //, "diabetico")
		Juan.sexo = "MASCULINO"
		Juan.preferenciasAlimenticias = newArrayList("pescado", "mariscos", "frutas") //, "carne")
		Juan.recetasCreadas = newArrayList()

		unaReceta = new Receta
		unaReceta.nombre = "Pollo al horno con papas"
		unaReceta.listaDeIngredientes = newArrayList("pollo", "papas")
		unaReceta.listaDeCondimentos = newArrayList("sal", "mostaza")
		unaReceta.procedimientoPreparacion = "Procedimiento..."
		unaReceta.esInadecuado = newArrayList("vegano")
		unaReceta.caloriasTotales = 800 //Acá hay que generar un método que haga el cálculo de calorias.
		unaReceta.dificultad = "Dificl"
		unaReceta.temporada = "Todo el año"

		Juan.recetasCreadas.add(unaReceta)
	}

	@Test
	def void testPunto1() { //Indicar si es un usuario valido 
		Assert.assertTrue(Juan.esValido())
	}

	//PENDITEN: Faltan muchos mas tests para el punto 1, yo lo fui testeando con comentarios pero tendria que dejar algo mejor armado...
	@Test
	def void calcularIMC() { //Calculo de IMC de un Usuario
		System.out.println("El IMC del usuario es: " + Juan.indiceDeMasaCorporal())
	}

	def void sigueRutinaSaludable() {
		Assert.assertTrue(Juan.rutinaSaludable())
	}

	@Test
	def void validarReceta() {
		Assert.assertTrue(unaReceta.esValido())

	}

}
