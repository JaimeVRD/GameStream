//
//  GameView.swift
//  GameStream
//
//  Created by AltoMobile on 30/03/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion: String
    var anoPublicacion: String
    var descripcion:String
    var tags:[String]
    var imgsUrl: [String]
    var body: some View {
        
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                video(url: url).frame(height:300)
                ScrollView {
                    videoInfo(
                        titulo: titulo,
                        studio: studio,
                        calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion,
                        tags: tags)
                    .padding(.bottom)
                    
                    Gallery(imgsUrl:imgsUrl)
                    
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct video :View{
    var url:String
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL( string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo :View{
    var titulo:String
    var studio:String
    var calificacion: String
    var anoPublicacion: String
    var descripcion:String
    var tags:[String]
    var body: some View{
        
        VStack(alignment: .leading){
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
            }
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
            
            HStack{
                ForEach(tags, id:\.self){
                    tag in
                    Text("\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top,4)
                        .padding(.leading)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery:View{
    var imgsUrl:[String]
    let formaGrid = [ GridItem(.flexible()) ]
    var body: some View {
        
        VStack(alignment:.leading){
            
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal){
                LazyHGrid(rows: formaGrid, spacing: 8){
                    
                    ForEach(imgsUrl, id:\.self){
                        imgUrl in
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                
            }.frame( height: 180 )
            
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.vertical){
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("blue-gray"))
                        .frame(width: .infinity, height: .infinity)
                    
                    VStack(alignment:.leading){
                        HStack{
                            Image("profile-pic-example")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                                .padding([.top, .leading, .trailing], 10)
                            
                            VStack {
                                Text("Lalo M").foregroundColor(.white).padding([.top, .trailing])
                                Text("Hace 1 día").foregroundColor(.white)
                            }
                        }
                        Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white)
                            .padding()
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("blue-gray"))
                        .frame(width: .infinity, height: .infinity)
                    VStack(alignment:.leading){
                        HStack{
                            Image("profile-pic-example")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .leading)
                                .padding([.top, .leading, .trailing], 10)
                            
                            VStack {
                                Text("Rebecca L").foregroundColor(.white).padding(.top)
                                Text("Hace 2 hrs").foregroundColor(.white)
                            }
                        }
                        Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white)
                            .padding()
                    }
                }
            }.frame( height: 180 )
            
            Text("JUEGOS SIMILARES")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            Image("DEATH STRANDING").resizable()
                .aspectRatio(contentMode: .fill)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(
            url: "ejemplo",titulo:"Sonic The Hedgehog",
            studio: "Sega",
            calificacion: "E+",
            anoPublicacion: "1991",
            descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            tags:["plataformas","mascota"],
            imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
                     ])
    }
}

