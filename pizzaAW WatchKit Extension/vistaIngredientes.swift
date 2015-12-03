//
//  vistaIngredientes.swift
//  pizzaAW
//
//  Created by rocio urtecho on 12/2/15.
//  Copyright © 2015 Carlos Concha. All rights reserved.
//

import WatchKit
import Foundation


class vistaIngredientes: WKInterfaceController {
    
    @IBOutlet var switchJamon: WKInterfaceSwitch!
    @IBOutlet var switchPepperoni: WKInterfaceSwitch!
    @IBOutlet var switchPavo: WKInterfaceSwitch!
    @IBOutlet var switchSalchicha: WKInterfaceSwitch!
    @IBOutlet var switchAceituna: WKInterfaceSwitch!
    @IBOutlet var switchCebolla: WKInterfaceSwitch!
    @IBOutlet var switchPimiento: WKInterfaceSwitch!
    @IBOutlet var switchPiña: WKInterfaceSwitch!
    @IBOutlet var switchAnchoas: WKInterfaceSwitch!
    
    var delegate: InterfaceController?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.setTitle("Atrás")
        self.delegate = context as? InterfaceController
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        switchJamon.setOn((self.delegate?.returnSelectIngrediente(0))!)
        switchPepperoni.setOn((self.delegate?.returnSelectIngrediente(1))!)
        switchPavo.setOn((self.delegate?.returnSelectIngrediente(2))!)
        switchSalchicha.setOn((self.delegate?.returnSelectIngrediente(3))!)
        switchAceituna.setOn((self.delegate?.returnSelectIngrediente(4))!)
        switchCebolla.setOn((self.delegate?.returnSelectIngrediente(5))!)
        switchPimiento.setOn((self.delegate?.returnSelectIngrediente(6))!)
        switchPiña.setOn((self.delegate?.returnSelectIngrediente(7))!)
        switchAnchoas.setOn((self.delegate?.returnSelectIngrediente(8))!)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func btnJamon(value: Bool) {
        let ingrediente = itemsIngredientes[0].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }
    
    @IBAction func btnPepperoni(value: Bool) {
        let ingrediente = itemsIngredientes[1].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }
    
    @IBAction func btnPavo(value: Bool) {
        let ingrediente = itemsIngredientes[2].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }

    @IBAction func btnSalchicha(value: Bool) {
        let ingrediente = itemsIngredientes[3].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }
    
    @IBAction func btnAceituna(value: Bool) {
        let ingrediente = itemsIngredientes[4].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }
    
    @IBAction func btnCebolla(value: Bool) {
        let ingrediente = itemsIngredientes[5].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }
    
    @IBAction func btnPimiento(value: Bool) {
        let ingrediente = itemsIngredientes[6].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }

    @IBAction func btnPiña(value: Bool) {
        let ingrediente = itemsIngredientes[7].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }
    
    @IBAction func btnAnchoas(value: Bool) {
        let ingrediente = itemsIngredientes[8].1
        self.delegate?.didSelectItem(ingrediente,active: value)
    }
    
}
