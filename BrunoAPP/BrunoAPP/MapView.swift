//
//  MapView.swift
//  BrunoAPP
//
//  Created by Student on 17/03/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    func printa() {
        return
    }
    
    @State private var mapLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    
    @State var mapRegion = [
        Sensor(name: "Sao Paulo", locationName: "Lugar 1", description: "primeiro sensor", coordinate: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388)),
        Sensor(name: "New York", locationName: "Lugar 2", description: "segundo sensor", coordinate: CLLocationCoordinate2D(latitude: 40.6643, longitude: -73.9385)),
        Sensor(name: "London", locationName: "Lugar 3", description: "terceiro sensor", coordinate: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12))
        
    ]
    
    var body: some View {
        NavigationStack {
            ZStack{
                Map(coordinateRegion: $mapLocation, annotationItems: mapRegion){place in
                    MapAnnotation(coordinate: place.coordinate){
                        NavigationLink{
                            SensorView(sensor: place)
                        }label:{
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(.red)
                        }
                        
                    }
                }
                    .scaledToFill()
                    .ignoresSafeArea()
                
                
                VStack(){
                    Spacer()
                    
                    Button{
                            
                    } label:{
                        Image(systemName: "sensor.fill")
                            .resizable()
                            .frame(width: 40, height: 30)
                    }
                    .padding(.bottom,20)
                    
                    
                }.frame(maxWidth: 360, alignment: .trailing)
                
                
                
            }//zStack
        }//navStack
    }//body
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
