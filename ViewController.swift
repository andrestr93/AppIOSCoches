//
//  ViewController.swift
//  ProyectoFireBase
//  Created by andres on 06/02/2020.
//  Copyright © 2020 andres. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    var arrayCoches : Array<Coche> = Array()
   
    var oCoche = Coche(id: "0", modelo: "Modelo", marca: "Marca", matricula: "Matricula", precio: 1900.0)
    
    @IBOutlet weak var tableview: UITableView!
    

    
    let datos:[[String]]=[["Uno" , "Dos" , "Tres"]]
    
    
    
    
    
    //let headers :[String] = ["Números"]//, "Letras"]
    
    let pie:[String] = [" "]
    //,"Pie Letras"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        let ref =  Database.database().reference().child("Concesionario").child("listacoches");
        
        ref.observe(.value, with: {DataSnapshot in
            for childs in DataSnapshot.children {
                let snap = childs as! DataSnapshot
                print("asdasdasd",snap)
                
                var identificador=snap.value as? String
                var marca=snap.value as? String
                var matricula=snap.value as? String
                var modelo=snap.value as? String
                var precio=snap.value as? Double
                
                self.arrayCoches.append(Coche(id:"1",modelo:modelo,marca:marca, matricula:matricula, precio:precio))
                print(self.arrayCoches.count)
            }
       
            self.tableview.reloadData()
        }
    )}
    
        

            
          

    @IBAction func bAltaCoche(_ sender: Any) {
        let ref = Database.database().reference().child("Concesionario").child("listacoches");
        if(arrayCoches.isEmpty){
            arrayCoches.append(oCoche)
        }else{
            //oCoche.id=(arrayCoches.count)
            //arrayCoches.append(oCoche)
        }
        print("hola" ,arrayCoches.count)
        //ref.child("Concesionario/listaCoches").setValue("Andres")
        for i in arrayCoches{
            var ident=String(oCoche.id)
            var cadena="Concesionario/listacoches/"+ident
            ref.child(cadena).child("ID").setValue(oCoche.id)
            ref.child(cadena).child("Marca").setValue(oCoche.marca)
ref.child(cadena).child("Matricula").setValue(oCoche.matricula)
            ref.child(cadena).child("Modelo").setValue(oCoche.modelo)
            ref.child(cadena).child("Precio").setValue(oCoche.precio)
           
            
        }
        
    }
    
    @IBAction func bBajaCoche(_ sender: Any) {
        
    }
    //retorna los datos de lo que hay en el array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCoches.count

    }
    
    /*
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return headers[section]
     }
    
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return pie [section]
    
    }
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayCoches.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        let label = cell.viewWithTag(123) as! UILabel
        label.text = ""
        cell.textLabel?.text = "andres"
        return cell
    }
    
 

    



}

