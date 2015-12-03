//
//  Valores.swift
//  pizzaAW
//
//  Created by rocio urtecho on 11/30/15.
//  Copyright © 2015 Carlos Concha. All rights reserved.
//

import WatchKit

var itemsTamaño : [(String,String)] = [
    ("0" , ""),
    ("1" , "Chica"),
    ("2" , "Mediana"),
    ("3" , "Grande")
]

var itemsMasa : [(String,String)] = [
    ("0" , ""),
    ("1" , "Delgada"),
    ("2" , "Crujiente"),
    ("3" , "Gruesa")
]

var itemsQueso : [(String,String)] = [
    ("0" , ""),
    ("1" , "Mozzarella"),
    ("2" , "Cheddar"),
    ("3" , "Parmesano"),
    ("4" , "Sin Queso")
]

var itemsIngredientes : [(String,String)] = [
    ("1","Jamón"),
    ("2","Pepperoni"),
    ("3","Pavo"),
    ("4","Salchicha"),
    ("5","Aceituna"),
    ("6","Cebolla"),
    ("7","Pimiento"),
    ("8","Piña"),
    ("9","Anchoas"),
]

class Valores: NSObject {
    var tamañoPizza : Int = 0
    var tpoMasa : Int = 0
    var tpoQueso : Int = 0
    var ingredientes : [String] = []

    override init() {
        tamañoPizza = 0
        tpoMasa = 0
        tpoQueso = 0
        ingredientes = []
    }
}
