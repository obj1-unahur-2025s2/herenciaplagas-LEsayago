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
  
  method reibeAtaqueDe(plaga) {
    
    nivelDeMugre += plaga.nivelDeDanio()
    plaga.atacar()
  }
}

class Huerta {
  var capacidadDeProduccion
  const nivelVariableDeProduccion = 100
  
  method esBuena() = capacidadDeProduccion > nivelVariableDeProduccion
  
  method reibeAtaqueDe(plaga) {
    
    capacidadDeProduccion = 0.max(
      capacidadDeProduccion - ((plaga.nivelDeDanio() * 0.1) + if (plaga.transmiteEnfermedades())
                                                                10
                                                              else 0)
    )
    plaga.atacar()
  }
}

class Mascota {
  var nivelDeSAlud
  
  method esBuena() = nivelDeSAlud > 250
  
  method reibeAtaqueDe(plaga) {
   
    nivelDeSAlud = 0.max(nivelDeSAlud - if (plaga.transmiteEnfermedades()) 10
                                   else 0)
    plaga.atacar()
  }
}

class Barrios {
  const elementos = []
  
  method losBuenos() = elementos.filter({ e => e.esBueno() })
  
  method losMalos() = elementos.filter({ e => not e.esBueno() })
  
  method esCopado() = self.losBuenos().size() > self.losMalos().size()
}