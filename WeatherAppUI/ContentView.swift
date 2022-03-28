//
//  ContentView.swift
//  WeatherAppUI
//
//  Created by Oriakhi Collins on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isDark=false
    var body: some View {
        
        ZStack{
            background_view(topColor: .white, bottomColor: isDark ? .black: .blue)
            VStack{
                Text("Cupertino, CA").font(.title).bold().foregroundColor(.white).padding()

                VStack{
                    build_weather_icon(icon: isDark ?    "moon.stars" : "cloud.sun.fill", color: isDark ?
                                        .white : .yellow)
                    Text("72").font(.system(size: 70)).bold().foregroundColor(.white)
                }
                Spacer()
                HStack(spacing: 20){
                   
                    weather_info(  day:"Mon", icon: "cloud.sun.fill", degree: 80
                    )
                    weather_info(  day:"Tues", icon: "cloud.moon.rain.fill", degree: 34
                    )
                    weather_info(  day:"Wed", icon: "cloud.heavyrain", degree: 54
                    )
                    weather_info(  day:"Thurs", icon: "cloud.fog", degree: 23
                    )
                    weather_info(  day:"Fri", icon: "cloud.bolt", degree: 67
                    )
//                    weather_info(  day:"Sat", icon: "cloud.sun.bolt", degree: 12
//                    )
                }
                Spacer()
                Button{
                    isDark.toggle()
                }
                label:{
                    Text("Change Day Time").frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.white).cornerRadius(12).font(.system(size: 20, weight: .bold, design:.default))
                }
                
                Spacer()
        
                
            
            }
                        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct weather_info: View {
    var day:String
    var icon:String
    var degree:Int
    var body: some View {
        VStack{
            Text(day).font(.system(size: 16)).bold().foregroundColor(.white)
            Image(systemName: icon).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).foregroundColor(.white)
            Text("\(degree)").font(.system(size: 28)).bold().foregroundColor(.white)
        }
    }
}



struct background_view: View {
    var topColor:Color
     var bottomColor:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
struct build_weather_icon: View {
    var icon:String
    var color:Color
    var body: some View {
        Image(systemName: icon).resizable().scaledToFit().aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180).foregroundColor(color)
    }
}

