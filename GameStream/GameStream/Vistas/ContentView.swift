//
//  ContentView.swift
//  GameStream
//
//  Created by AltoMobile on 15/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Spacer()
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                
                VStack{
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    
                    inicioYRegistroView()
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct inicioYRegistroView : View {
    @State var tipoInicioSesion = true
    var body : some View {
        VStack{
            HStack {
                Spacer()
                
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    print("pantalla de inicio")}
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("pantalla de registro")}
                .foregroundColor(tipoInicioSesion ? .gray  : .white)
                Spacer()
            }
            
            Spacer(minLength: 42)
            if tipoInicioSesion == true {
                InicioSesionView()
            }else {
                RegistroView()
            }
        }
    }
    
    struct InicioSesionView : View {
        
        @State var correo = ""
        @State var contraseña = ""
        @State var isPantallaHomeActive = false
        
        var body: some View {
            ScrollView {
                
                VStack(alignment:.leading) {
                    
                    Text("Correo electrónico").foregroundColor(Color("dark-cian"))
                    
                    ZStack(alignment:.leading){
                        
                        if correo.isEmpty {
                            Text(verbatim: "ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                        }
                        
                        TextField("", text: $correo).foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                    
                    Text("Contraseña").foregroundColor(Color.white)
                    
                    ZStack(alignment:.leading){
                        if contraseña.isEmpty {
                            Text("*******").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $contraseña).foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(.white).padding(.bottom)
                    
                    Text("¿Olvidaste tu contraseña?").foregroundColor(Color("dark-cian")).font(.caption).frame(width: 300, alignment: .trailing).padding(.bottom)
                    
                    Button(action: iniciarSesion, label: {
                        Text("INICIAR SESIÓN")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("dark-cian"),lineWidth: 2.0).shadow(color: .white, radius: 6))
                    }).padding(.bottom, 60)
                    
                    Text("Inicia sesión con redes sociales").foregroundColor(.white).frame(width: 300, alignment: .center).padding(.bottom, 30)
                    
                    HStack{
                        Button{print("f")}
                    label: {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(.blue,lineWidth: 2.0))
                            .background(.blue)
                    }
                        Spacer()
                        
                        Button{print("t")}
                    label: {
                        Text("Twitter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(.blue,lineWidth: 2.0))
                            .background(.blue)
                    }
                        
                    }.frame(width: 300, alignment: .center)
                }.padding(.horizontal, 77)
                
                NavigationLink(
                    destination: Home(),
                    isActive: $isPantallaHomeActive,
                    label: {
                        EmptyView()
                    })
            }
        }
        
        func iniciarSesion() {
            
            print("iniciar")
            isPantallaHomeActive = true
        }
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            
            ContentView()
        }
    }
}

struct RegistroView : View {
    
    @State var correo = ""
    @State var contraseña = ""
    @State var confirmarContraseña = ""
    var body: some View {
        
        ScrollView {
            VStack(alignment:.center) {
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla mas adelante")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: tomarFoto, label:{
                    
                    ZStack {
                        Image("profile-pic-example")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80, alignment: .center)
                            .opacity(0.7)
                            .padding(.bottom, 30)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                } )
                
                VStack(alignment:.leading) {
                    VStack(alignment:.leading) {
                        Text("Correo electrónico*").foregroundColor(Color("dark-cian"))
                        
                        ZStack(alignment:.leading){
                            if correo.isEmpty {
                                Text(verbatim: "ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                            }
                            TextField("", text: $correo).foregroundColor(.white)
                        }
                        Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                        
                        Text("Contraseña*").foregroundColor(Color.white)
                        
                        ZStack(alignment:.leading){
                            
                            if contraseña.isEmpty {
                                Text("*******").font(.caption).foregroundColor(.gray)
                            }
                            
                            SecureField("", text: $contraseña).foregroundColor(.white)
                        }
                        Divider().frame(height: 1).background(.white).padding(.bottom)
                        
                        Text("Confirmar Contraseña*").foregroundColor(Color.white)
                        
                        ZStack(alignment:.leading){
                            if confirmarContraseña.isEmpty {
                                Text("*******").font(.caption).foregroundColor(.gray)
                            }
                            SecureField("", text: $confirmarContraseña).foregroundColor(.white)
                        }
                        Divider().frame(height: 1).background(.white).padding(.bottom)
                    }
                    
                    Button(action: registrate, label: {
                        Text("REGÍSTRATE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("dark-cian"),lineWidth: 2.0).shadow(color: .white, radius: 6))
                    }).padding(.bottom)
                    
                    Text("Inicia sesión con redes sociales").foregroundColor(.white).frame(width: 300, alignment: .center).padding(.bottom, 30)
                    
                    HStack{
                        Button{print("f")}
                    label: {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(.blue,lineWidth: 2.0))
                            .background(.blue)
                    }
                        Spacer()
                        
                        Button{print("t")}
                    label: {
                        Text("Twitter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(.blue,lineWidth: 2.0))
                            .background(.blue)
                    }
                    }.frame(width: 300, alignment: .center)
                }.padding(.horizontal, 77)
            }
        }
    }
}


func tomarFoto() {
    print("foto")
}

func registrate(){
    print("r")
}
