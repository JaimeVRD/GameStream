//
//  ProfileView.swift
//  GameStream
//
//  Created by AltoMobile on 04/04/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Lorem"
    @State var ImagenPerfil: UIImage = UIImage(named: "profile-pic-example")!
    var body: some View {
        ZStack {
            
            Color("Marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack {
                Text("Perfil").foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .padding()
                
                VStack{
                    Image(uiImage: ImagenPerfil )
                        .resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                    
                    Text(nombreUsuario)
                        .fontWeight(.bold)
                        .foregroundColor(Color .white)
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
                
                ModuloAjustes()
                Spacer()
            }
        }.onAppear(
            
            perform: {
                if returnUiImage(named: "fotoperfil") != nil{
                    ImagenPerfil = returnUiImage(named: "fotoperfil")!
                }else{
                    print("no encontro foto ")
                }
                print("revisar si tengo datos de usuario")
            }
        )
    }
    
    func returnUiImage(named:String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}

struct ModuloAjustes:View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body:some View {
        VStack(spacing: 3) {
            Button (action: { }, label: {
                HStack {
                    Text("Cuenta").foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle (cornerRadius:1))
                .padding(.top, 0)
            
            Button (action: { }, label: {
                HStack {
                    Text("Notificaciones").foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle (cornerRadius:1))
                .padding(.top,0)
            
            Button (action: {isEditProfileViewActive = true}, label: {
                HStack {
                    Text("Editar Perfil").foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle (cornerRadius:1))
            
            Button (action: { }, label: {
                HStack {
                    Text("Califica esta App").foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">").foregroundColor(.white)
                }.padding()
            }).background(Color("blue-gray"))
                .clipShape(RoundedRectangle (cornerRadius:1))
            
            NavigationLink(
                destination: EditProfileView(),
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
