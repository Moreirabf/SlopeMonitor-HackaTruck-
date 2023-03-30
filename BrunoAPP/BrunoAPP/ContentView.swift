//
//  ContentView.swift
//  BrunoAPP
//
//  Created by Student on 17/03/23.
//

import SwiftUI
import MapKit



struct SensorSheet: View{
    
    @Binding var isPresented : Bool
    
    @State var mapRegion = [
        Sensor(name: "Sao Paulo", locationName: "Lugar 1", description: "primeiro sensor", coordinate: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388)),
        Sensor(name: "New York", locationName: "Lugar 2", description: "segundo sensor", coordinate: CLLocationCoordinate2D(latitude: 40.6643, longitude: -73.9385)),
        Sensor(name: "London", locationName: "Lugar 3", description: "terceiro sensor", coordinate: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12))
        
    ]
    
    var body: some View{
            List{
                ForEach(mapRegion) { region in
                    Button(region.name){
                        mapLocation.center = region.coordinate
                        isPresented = false
                    }
                }
            }
    }
}



struct ContentView: View {
    let timer = Timer.publish(every: 2, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @StateObject var notificationModel = NotificationModel()
    private var mapLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    
    var body: some View {
        
        
        VStack {
           
            TabView{
                Group{
                    MapView().tabItem(){
                        Label("Map", systemImage: "map")
                    }
                    
                    NotificationView(notifications: notificationModel.notifications)
                        .badge("!")
                        .tabItem(){
                        Label("Notifications", systemImage: "exclamationmark.triangle")
                    }
                    SensorSubView().tabItem(){
                        Label("Add Sensor", systemImage: "antenna.radiowaves.left.and.right")
                    }
                    UserConfigView().tabItem(){
                        Label("Configuration", systemImage: "gearshape.fill")
                    }
                    
                }
                .toolbarBackground(.visible,for: .tabBar)
                
            }
            
            
        }.onReceive(timer) { time in
            notificationModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
