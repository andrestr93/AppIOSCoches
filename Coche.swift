//
//  Coche.swift
//  ProyectoFireBase
//
//  Created by andres on 10/02/2020.
//  Copyright © 2020 andres. All rights reserved.
//

import Foundation

class Coche {
    var id: String
    var modelo: String?
    var marca: String?
    var matricula: String?
    var precio: Double?
    
    internal init(id: String, modelo: String?, marca: String?, matricula: String?, precio: Double?) {
        self.id = id
        self.modelo = modelo
        self.marca = marca
        self.matricula = matricula
        self.precio = precio
    }
}
 
 
