//
//  SaveData.swift
//  GameStream
//
//  Created by AltoMobile on 05/04/22.
//

import Foundation

class SaveData {
    
    var correo : String = ""
    var contraseña : String = ""
    var nombre : String = ""
    
    func guardarDatos(correo:String, contraseña:String, nombre:String) -> Bool {
        
        print("En la func obtuve: \(correo) + \(contraseña) + \(nombre)")
        
        //Para guardar datos pequeños como el texto del nombre o correo
        UserDefaults.standard.set([correo,contraseña,nombre], forKey: "datosUsuario" )
        return true
    }
    
    func recuperarDatos() -> [String]{
        
        let datosUsuario:[String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("En recuperarDatos este fue el resultado: \(datosUsuario)")
        
        return datosUsuario
    }
    
    func validar(correo:String, contraseña: String) -> Bool {
        
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print ("Revisando datos en userDefaults en el correo \(correo) y pass \(contraseña)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("El correo guardado es: \(correoGuardado) y la pass guardada \(contraseñaGuardada)")
            
            if (correo == correoGuardado && contraseña == contraseñaGuardada){
                
                return true
                
            }else{
                return false
            }
        }else{
            print("No hay datos de usuario guardados en el user defaults")            
            return false
        }
    }
}
