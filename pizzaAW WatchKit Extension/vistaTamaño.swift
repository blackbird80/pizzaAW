//
//  vistaTamaño.swift
//  pizzaAW
//
//  Created by rocio urtecho on 11/30/15.
//  Copyright © 2015 Carlos Concha. All rights reserved.
//

import WatchKit
import Foundation

class vistaTamaño: WKInterfaceController {

    @IBOutlet var pickerTamaño: WKInterfacePicker!
    
    var delegate: InterfaceController?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.setTitle("Atrás")
        
        self.delegate = context as? InterfaceController
        
        let pickerItems : [WKPickerItem] = itemsTamaño.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        pickerTamaño.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        var val : Int? = self.delegate?.returnSelectItem("TamañoPizza")
        if val == nil{
            val = 0
        }
        pickerTamaño.setSelectedItemIndex(val!)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func selecTamaño(value: Int) {
        self.delegate?.didSelectItem("TamañoPizza",itemSelected: value)
    }
}
