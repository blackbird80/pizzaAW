//
//  InterfaceController.swift
//  pizzaAW WatchKit Extension
//
//  Created by rocio urtecho on 11/30/15.
//  Copyright © 2015 Carlos Concha. All rights reserved.
//

import WatchKit
import Foundation

protocol ModalItemChooserDelegate {
    func didSelectItem(opc:String,itemSelected:Int)
    func didSelectItem(item:String,active:Bool)
    func returnSelectItem(opc:String)->Int
    func returnSelectIngrediente(opc:Int)->Bool
}

class InterfaceController: WKInterfaceController, ModalItemChooserDelegate {
    let valorContexto=Valores()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func btnTamaño() {
        self.presentControllerWithName("IdentificadorTamaño", context: self)
    }
    
    @IBAction func btMasa() {
        self.presentControllerWithName("IdentificadorMasa", context: self)
    }

    @IBAction func btnQueso() {
        self.presentControllerWithName("IdentificadorQueso", context: self)
    }
    
    @IBAction func btnIngredientes() {
        self.presentControllerWithName("IdentificadorIngredientes", context: self)
    }
    
    func didSelectItem(opc:String,itemSelected: Int) {
        switch opc{
            case "TamañoPizza":
                self.valorContexto.tamañoPizza = itemSelected
            case "TipoMasa":
                self.valorContexto.tpoMasa = itemSelected
            case "TipoQueso":
                self.valorContexto.tpoQueso = itemSelected
            default: break
        }
        
    }
    
    func didSelectItem(item:String,active:Bool){
        var index : Int = 0
        if active == true {
            self.valorContexto.ingredientes.append(item)
        }else{
            index = self.valorContexto.ingredientes.indexOf(item)!
            self.valorContexto.ingredientes.removeAtIndex(index)
        }
    }
    
    func returnSelectItem(opc:String) -> Int {
        var val : Int = 0
        switch opc{
        case "TamañoPizza":
            val = valorContexto.tamañoPizza
        case "TipoMasa":
            val = valorContexto.tpoMasa
        case "TipoQueso":
            val = valorContexto.tpoQueso
        default: break
        }
        return val
    }
  
    func returnSelectIngrediente(opc: Int) -> Bool {
        let val = itemsIngredientes[opc].1
        return self.valorContexto.ingredientes.contains(val)
    }
    
    @IBAction func btnConfirmar() {
        let count : Int = valorContexto.ingredientes.count
        let dismissAction = WKAlertAction(title: "Corregir", style: .Default, handler: {})
        let okAction = WKAlertAction(title: "Pizza Confirmada!!!", style: .Default, handler: {})
        
        if valorContexto.tamañoPizza == 0{
            self.presentAlertControllerWithTitle("Error", message: "Seleccione un Tamaño de Pizza", preferredStyle: .Alert, actions: [dismissAction])

        }else if valorContexto.tpoMasa == 0{
            self.presentAlertControllerWithTitle("Error", message: "Seleccione un Tipo de Masa", preferredStyle: .Alert, actions: [dismissAction])
        }else if valorContexto.tpoQueso == 0{
            self.presentAlertControllerWithTitle("Error", message: "Seleccione un Tipo de Queso", preferredStyle: .Alert, actions: [dismissAction])
        }else if count == 0 || count > 5{
            self.presentAlertControllerWithTitle("Error", message: "Debe seleccionar entre 1 a 5 Ingredientes", preferredStyle: .Alert, actions: [dismissAction])
        }
        else{
            let h0 = { self.presentAlertControllerWithTitle("Pizza!!!", message: "Su pizza llegará en 30 minutos!!", preferredStyle: .Alert, actions: [okAction]) }//print("Pizza Confirmada!!!")}
            
            let action1 = WKAlertAction(title: "Confirmar", style: .Default, handler:h0)
            let action2 = WKAlertAction(title: "Cancelar", style: .Destructive) {}
            let action3 = WKAlertAction(title: "Atrás", style: .Cancel) {}
            
            
            presentAlertControllerWithTitle("Confirmar Pedido", message: "¿Desea confirmar su pedido?", preferredStyle: .ActionSheet, actions: [action1, action2,action3])
        }
        
        
    }
    
}
