package uqbar.grupo2.edu.ar

import org.joda.time.DateTime

class DateUtil {

	def static noEsAntigua(DateTime fecha) {
		fecha.afterNow
	}

}
