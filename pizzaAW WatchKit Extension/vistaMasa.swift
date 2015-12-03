//
//  vistaMasa.swift
//  pizzaAW
//
//  Created by rocio urtecho on 12/2/15.
//  Copyright © 2015 Carlos Concha. All rights reserved.
//

import WatchKit
import Foundation


class vistaMasa: WKInterfaceController {

    @IBOutlet var pickerMasa: WKInterfacePicker!
    
    var delegate: InterfaceController?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.setTitle("Atrás")
        
        self.delegate = context as? InterfaceController
        
        let pickerItems : [WKPickerItem] = itemsMasa.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        pickerMasa.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        var val : Int? = self.delegate?.returnSelectItem("TipoMasa")
        if val == nil{
            val = 0
        }
        pickerMasa.setSelectedItemIndex(val!)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func selecMasa(value: Int) {
        self.delegate?.didSelectItem("TipoMasa",itemSelected: value)
    }

}
