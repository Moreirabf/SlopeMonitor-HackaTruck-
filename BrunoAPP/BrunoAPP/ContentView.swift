//
//  ContentView.swift
//  BrunoAPP
//
//  Created by Student on 17/03/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        
        
        VStack {
           
            TabView{
                Group{
                    MapView().tabItem(){
                        Label("Map", systemImage: "map")
                    }
                    
                    NotificationView().tabItem(){
                        Label("Notifications", systemImage: "exclamationmark.triangle")
                    }
                    SensorSubView().tabItem(){
                        Label("Subscription", systemImage: "square")
                    }
                    UserConfigView().tabItem(){
                        Label("Configuration", systemImage: "gearshape.fill")
                    }
                    
                }
                .toolbarBackground(.visible,for: .tabBar)
                
            }
            .padding(.bottom,-15)
            
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
