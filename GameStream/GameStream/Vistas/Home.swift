//
//  Home.swift
//  GameStream
//
//  Created by AltoMobile on 22/03/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tagSetected = 2
    var body: some View {
        
        TabView(selection: $tagSetected) {
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
            
        }.accentColor(.white)
    }
    
    //color de la tabview
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("blue-gray"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        print("Iniciando las vistas de home")
    }
}

struct PantallaHome :View {
    @State var textoBusqueda = ""
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            VStack {
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250).padding(.horizontal, 11)
                ScrollView(showsIndicators: false){
                    
                    SubModuloHome()
                }
            }.padding(.horizontal, 18)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    struct SubModuloHome:View {
        
        @State var isGameInfoEmpty = false
        @State var textoBusqueda = ""
        
        @ObservedObject var juegoEncontrado = SearchGame()
        @State var isGameViewActive = false
        
        @State var url:String = ""
        @State var titulo:String = ""
        @State var studio:String = ""
        @State var calificacion: String = ""
        @State var anoPublicacion: String = ""
        @State var descripcion:String = ""
        @State var tags:[String] = [""]
        @State var imgsUrl: [String] = [""]
        /*
         //    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
         //
         //    @State var isPlayerActive = false
         //
         //    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
         */
        var body: some View{
            
            VStack {
                HStack{
                    Button(action: {
                        watchGame(name: textoBusqueda)
                    },
                           label:{
                        Image(systemName: "magnifyingglass")
                        .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("dark-cian"))})
                    .alert(isPresented: $isGameInfoEmpty){
                        Alert(title: Text("ERROR"), message: Text("No se encontro juego"), dismissButton: .default(Text("Entendido")))
                    }
                    ZStack(alignment: .leading){
                        
                        if textoBusqueda.isEmpty{
                            Text("Buscar un video").foregroundColor(.white)
                        }
                        
                        TextField("", text: $textoBusqueda).foregroundColor(.white)
                    }
                }.padding([.top,.leading,.bottom],11.0)
                    .background(Color("blue-gray"))
                    .clipShape(Capsule())
                
                Text("LOS MÁS POPULARES")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                ZStack{
                    Button(action: {watchGame(name: "The Witcher 3")
                    }, label: {
                        VStack(spacing: 0){
                            Image("The Witcher 3").resizable().scaledToFit()
                            Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .background(Color("blue-gray"))
                        }
                    } )
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                
                Text("CATEGORÍAS SUGERIDAS PARA TI")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("blue-gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("Vector-shot")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                            }
                        })
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("blue-gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("rpg-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                            }
                        })
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("blue-gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("open-world-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                            }
                        })
                    }
                }
                
                Text("RECOMENDADO PARA TI")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        Button(action: {watchGame(name: "Abzu")}, label: {
                            
                            Image("Abzu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        })
                        
                        Button(action: {watchGame(name: "Crash Bandicoot")}, label: {
                            Image("Crash Bandicoot")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        })
                        
                        Button(action: {watchGame(name: "DEATH STRANDING")}, label: {
                            Image("DEATH STRANDING")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        })
                    }
                }
                
                Text("VIDEOS QUE PODRÍAN GUATARTE")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        Button(action:
                                {watchGame(name: "Cuphead")}, label: {
                            Image("Cuphead")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        })
                        Button(action:
                                {watchGame(name: "Hades")}, label: {
                            Image("Hades")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        })
                        
                        Button(action:
                                {watchGame(name: "Grand Theft Auto V")}, label: {
                            Image("Grand Theft Auto V")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        })
                    }
                }
                
                NavigationLink(
                    destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
                    isActive: $isGameViewActive,
                    label: {
                        EmptyView()
                    })}
        }
        
        func watchGame(name:String){
            juegoEncontrado.search(gameName: name)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
                
                print("Cantidad E:\(juegoEncontrado.gameInfo.count)")
                if juegoEncontrado.gameInfo.count == 0{
                    isGameInfoEmpty = true
                } else {
                    url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                    titulo = juegoEncontrado.gameInfo[0].title
                    studio = juegoEncontrado.gameInfo[0].studio
                    calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                    anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                    descripcion = juegoEncontrado.gameInfo[0].description
                    tags = juegoEncontrado.gameInfo[0].tags
                    imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                    isGameViewActive = true
                }
            }
        }
    }
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
    
}
