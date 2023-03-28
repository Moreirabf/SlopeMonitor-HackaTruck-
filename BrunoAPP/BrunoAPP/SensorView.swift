//
//  SensorView.swift
//  BrunoAPP
//
//  Created by Student11 on 28/03/23.
//

import SwiftUI
import MapKit

struct SensorView: View {
    var sensor : Sensor
    @State private var mapLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    var body: some View {
        VStack {
            Text(sensor.name)
                .font(.title)
                .fontWeight(.bold)
            HStack() {
                VStack {
                    Text(sensor.locationName)
                    Text(sensor.description)
                    Text("Latitude: " + String(sensor.coordinate.latitude))
                    Text("Longitude: " + String(sensor.coordinate.longitude))
                    
                }
                Map(coordinateRegion: $mapLocation)
                    .frame(width: 220, height: 220)
            }
            Spacer()
            //chart
            
        }.onAppear(){
            mapLocation.center = sensor.coordinate
        }
        
    }
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        let sensor = Sensor(name: "Sao Paulo", locationName: "Lugar 1", description: "primeiro sensor", coordinate: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388))
        SensorView(sensor: sensor)
    }
}
