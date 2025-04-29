object papa {
    var cantidadPapa = 0
    var calidad = calidadBuena
    var impuesto = impuestoSimple
    var retencion = derechoExportacionNulo
    

/*CANTIDAD*/
    method cantidad() = cantidadPapa
    method cantidad(cuantasPapas) { cantidadPapa = cuantasPapas }

/*CALIDAD*/
    method calidad() = calidad
    method calidad(unaCalidad) { calidad = unaCalidad }

/*IMPUESTO*/
    method impuesto() = impuesto
    method impuesto(unImpuesto) { impuesto = unImpuesto }

/*IMPUESTO*/
    method retencion() = retencion
    method retencion(unaRetencion) { retencion = unaRetencion }


/*IMPORTE*/
    method importeTotal(){
        return self.costoDeProduccion(calidad, cantidadPapa) + impuesto.valorImpuesto(self.costoDeProduccion(calidad, cantidadPapa)) + retencion.importeDerechoExp(self.costoDeProduccion(calidad, cantidadPapa), self.cantidad())
        /*costo de producción más un valor de impuesto, más un valor por derechos de exportación.*/
    }

/*COSTO*/
    method costoDeProduccion(unaCalidad, unaCantidad) = unaCalidad.valor() * unaCantidad
    /*El costo de producción depende de la calidad y cantidad de la cosecha. La cantidad de unidades 
    cosechadas es un valor determinado. Respecto de la calidad, si se considera que la papa es buena 
    son $3 por cada unidad; pero si es regular se usa como importe unitario la cotización que da el 
    "Protectorado Especial de Productos de Exportación" (pepe). La calidad premium tiene un importe 
    por unidad 50% mayor a la calidad buena.*/



}


object batata {

}

object zapallo {
  
}

/*##################################*/
/*CALIDAD*/
/*##################################*/
object calidadBuena { method valor() = 3}
object calidadRegular { 
    var valorPepe = 2    
    
    method valor() = valorPepe
}
object calidadPremium { 
    method valor() = calidadBuena.valor() + calidadBuena.valor()/2
}

/*##################################*/
/*IMPUESTOS*/
/*##################################*/
object impuestoSimple {
    method valorImpuesto(costoProduccion) = (10*costoProduccion)/100
}

object impuestoGarantia {
    method valorImpuesto(costoProduccion) {
        var valor = 100

        if ((5/costoProduccion)*100 > 100){
            valor = (5/costoProduccion)*100
        }

        return valor
    }
}

object impuestoInventado {
  method valorImpuesto(costoProduccion) = (1/costoProduccion)*100
}

/*##################################*/
/*DERECHO DE EXP*/
/*##################################*/

/*El importe de los derechos de exportación, también llamados retenciones, se calcula de diferentes maneras:
Estatista: $200 pesos si el costo de producción es alto (mayor a $1000)  y 300$ en caso contrario.
Privatizador: Un monto básico de 50$ más $1 peso adicional por cada 10 unidades cultivadas. 
Demagógico: Actualmente son $100 pero podría cambiar en cualquier momento.
Nulo: Nada.*/

object derechoExportacionEstatista{
    method importeDerechoExp(costoProd, unidadesCultivadas){
        var valor = 300
        if(costoProd > 1000){
            valor = 200
        }
        return valor
    }  
}

object derechoExportacionPrivatizador {
    method importeDerechoExp(costoProd, unidadesCultivadas) = 50 + (unidadesCultivadas/10)
}

object derechoExportacionDemagogico {
    var valor = 100

    method importeDerechoExp(costoProd, unidadesCultivadas) = valor
}

object derechoExportacionNulo {
    method importeDerechoExp(costoProd, unidadesCultivadas) = 0
}

