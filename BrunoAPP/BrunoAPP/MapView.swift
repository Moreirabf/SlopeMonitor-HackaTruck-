//
//  MapView.swift
//  BrunoAPP
//
//  Created by Student on 17/03/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //@Binding var isPresented: Bool
    
    @State var showingSheet = false
    
    @State var mapLocat = MKCoordinateRegion(center: mapLocation.center, span: mapLocation.span)
    
    @State var mapRegion = [
        Sensor(name: "Sao Paulo", locationName: "Lugar 1", description: "primeiro sensor", coordinate: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388)),
        Sensor(name: "New York", locationName: "Lugar 2", description: "segundo sensor", coordinate: CLLocationCoordinate2D(latitude: 40.6643, longitude: -73.9385)),
        Sensor(name: "London", locationName: "Lugar 3", description: "terceiro sensor", coordinate: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12))
        
    ]
    
    var body: some View {
        NavigationStack {
            ZStack{
                Map(coordinateRegion: $mapLocat, annotationItems: mapRegion){place in
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
                        showingSheet.toggle()
                    } label:{
                        Image(systemName: "sensor.fill")
                            .resizable()
                            .frame(width: 40, height: 30)
                    }
                    .padding(.bottom,20)
                    .sheet(isPresented: $showingSheet, onDismiss: {
                        mapLocat.center = mapLocation.center
                      }, content: {
                          SensorSheet(isPresented: $showingSheet)
                      })
            
                    
                    
                }.frame(maxWidth: 360, alignment: .trailing)
                
                
                
            }.onAppear(){
                mapLocat.center = mapLocation.center
            }
            //zStack
            
        }//navStack
    }//body
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        
        MapView()
    }
}
