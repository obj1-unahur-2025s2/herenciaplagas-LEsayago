class Hogar {
  const nivelDeMugre
  const confort
  
  method esBuena() = nivelDeMugre <= (confort / 2)
}

class Huerta {
  const capacidadDeProduccion
  const nivelBuscado
  
  method esBuena() = capacidadDeProduccion > nivelBuscado
}

class Mascota {
  const nivelDeSAlud
  
  method esBuena() = nivelDeSAlud > 250
}

class Plaga {
  const property poblacion
  
  method transmiteEnfermedades() = poblacion >= 10
}

class PlagaDeCucarachas inherits Plaga {
  const pesoPromedio
  
  method nivelDeDanio() = poblacion / 2
  
  override method transmiteEnfermedades() = super() and (pesoPromedio >= 10)
}

class PlagaDePulgas inherits Plaga {
  method nivelDeDanio() = poblacion * 2
}

class PlagaDeGarrapatas inherits PlagaDePulgas {
}

class PlagaDeMosquitos inherits Plaga {
  method nivelDeDanio() = poblacion
  
  override method transmiteEnfermedades() = super() and ((poblacion % 3) == 0)
}