//
//  EditProfileView.swift
//  GameStream
//
//  Created by AltoMobile on 04/04/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var imagenPerfil : Image? = Image("profile-pic-example")
    @State var isCameraActive = false
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Editar Perfil").fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                        .padding()
                    
                    Button(action: { isCameraActive = true }, label: {
                        ZStack {
                            imagenPerfil!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive, content: {
                                    SUImagePickerView(sourceType: .camera, image: self.$imagenPerfil, isPresented: $isCameraActive)
                                } )
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    })
                }.padding(.bottom, 18)
                ModuloEditar()
            }
        }
    }
}

struct ModuloEditar:View{
    
    @State var correo: String = ""
    @State var contraseña: String = ""
    @State var nombre: String = ""
    
    var body: some View{
        VStack(alignment: .leading) {
            
            Text("Correo electrónico").foregroundColor(Color("dark-cian"))
            
            ZStack(alignment: .leading){
                
                if correo.isEmpty{
                    Text("ejemplo@gmail com").font(.caption)
                        .foregroundColor(.gray)
                }
                TextField("", text: $correo).foregroundColor(.white)
            }
            Divider().frame(height:1).background(Color("dark-cian"))
            
            Text("Contraseña").foregroundColor(Color.white)
            
            ZStack(alignment: .leading){
                if contraseña.isEmpty{
                    Text("Introduce contraseña").font(.caption)
                        .foregroundColor(.gray)
                }
                SecureField("", text: $contraseña).foregroundColor(.white)
            }
            Divider().frame(height:1).background(Color.white)
            
            Text("Nombre").foregroundColor(Color.white)
            
            ZStack(alignment: .leading){
                
                if nombre.isEmpty{
                    Text("Introduce tu nombre").font(.caption)
                        .foregroundColor(.gray)
                }
                TextField("", text: $nombre).foregroundColor(.white)
            }
            Divider().frame(height:1).background(Color.white)
                .padding(.bottom,32)
            
            Button(action: {actualizarDatos()}, label: {
                
                Text("ACTUALIZAR DATOS").fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("dark-cian"),lineWidth: 2.0).shadow(color: .white, radius: 6))
            }).padding(.bottom)
        }.padding(.horizontal, 42)
    }
    
    func actualizarDatos(){
        
        let objetoActualizadorDatos = SaveData()
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contraseña: contraseña, nombre: nombre)
        print("se guardaron con exito? \(resultado)")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
