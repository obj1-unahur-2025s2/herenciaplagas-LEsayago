class Plaga {
  var property poblacion
  
  method transmiteEnfermedades() = poblacion >= 10
  
  method atacar() {
    poblacion += poblacion * 0.1
  }
}

class PlagaDeCucarachas inherits Plaga {
  var pesoPromedio
  
  method nivelDeDanio() = poblacion / 2
  
  override method transmiteEnfermedades() = super() and (pesoPromedio >= 10)
  
  override method atacar() {
    super()
    pesoPromedio += 2
  }
}

class PlagaDePulgas inherits Plaga {
  method nivelDeDanio() = poblacion * 2
}

class PlagaDeGarrapatas inherits PlagaDePulgas {
  override method atacar() {
    poblacion += poblacion * 0.2
  }
}

class PlagaDeMosquitos inherits Plaga {
  method nivelDeDanio() = poblacion
  
  override method transmiteEnfermedades() = super() and ((poblacion % 3) == 0)
}

class Hogar {
  var nivelDeMugre
  const confort
  
  method esBuena() = nivelDeMugre <= (confort / 2)
  
  method esAtacado(plaga) {
    nivelDeMugre += plaga.poblacion()
  }
}

class Huerta {
  var capacidadDeProduccion
  const nivelVariableDeProduccion
  
  method esBuena() = capacidadDeProduccion > nivelVariableDeProduccion
  
  method recibeAtaque(plaga) {
    capacidadDeProduccion -=
     (plaga.nivelDeDanio() * 0.1) + if (plaga.transmiteEnfermedades()) 10 else 0
  }
}

class Mascota {
  var nivelDeSAlud
  
  method esBuena() = nivelDeSAlud > 250
  
  method recibeAtaque(plaga) {
    nivelDeSAlud = (nivelDeSAlud - if (plaga.transmiteEnfermedades()) 10
                                   else 0).max(0)
  }
}