//
//  SensorView.swift
//  BrunoAPP
//
//  Created by Student11 on 28/03/23.
//

import SwiftUI
import MapKit
import Charts

struct UmidityData: Identifiable {
    let id = UUID()
    let date: Date
    let umidity: Double
    
    init(year: Int, month: Int, day: Int, umidity: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.umidity = umidity
    }
}

struct SensorView: View {
    let timer = Timer.publish(every: 5, tolerance: 1, on: .main, in: .common).autoconnect()
    @StateObject var viewModel = ViewModel()
    
    var sensor : Sensor
    @State private var mapLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    var body: some View {
        ScrollView {
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
                Chart {
                    ForEach(sensorData.data, id: \.self) { item in
                        LineMark(
                            x: .value("Time", viewModel.formatDate(date: item.date)),
                            y: .value("Umidity", item.raw.umidade))
                    }
                }.frame(width: 300, height: 300)
                
                if let lastElement = sensorData.data.last {
                    Text("Inclinação: " + lastElement.inclinacao)
                }
            }
            .onAppear(){
                mapLocation.center = sensor.coordinate
                viewModel.fetch()
            }
            .onReceive(timer) { time in
                print("The time is now \(time)")
                viewModel.fetch()
            }
        }
    }
}

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        let sensor = Sensor(name: "Sao Paulo", locationName: "Lugar 1", description: "primeiro sensor", coordinate: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388))
        SensorView(sensor: sensor)
    }
}
