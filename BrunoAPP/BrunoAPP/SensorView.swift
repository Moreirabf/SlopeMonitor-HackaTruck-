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
    let timer = Timer.publish(every: 2, tolerance: 1, on: .main, in: .common).autoconnect()
    @StateObject var viewModel = ViewModel()
    
    var sensor : Sensor
    @State private var mapLocat = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10, longitude: 10), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Sensor")) {
                        HStack() {
                            VStack(alignment: .leading) {
                                
                                Text(sensor.locationName)
                                    .font(Font.custom("Satoshi-Black", size: 26))
                                Text(sensor.description)
                                    .font(Font.custom("Satoshi-Black", size: 17))
                                Text("Latitude: " + String(sensor.coordinate.latitude))
                                    .font(Font.custom("Satoshi-Black", size: 16))
                                Text("Longitude: " + String(sensor.coordinate.longitude))
                                    .font(Font.custom("Satoshi-Black", size: 16))
                                
                                if let lastElement = sensorData.data.last {
                                    Text("Risco: " + String(lastElement.raw.risco))
                                        .font(Font.custom("Satoshi-Black", size: 16))
                                }
                                
                                
                                
                            }
                            Map(coordinateRegion: $mapLocat)
                                .frame(width: 160, height: 160)
                                .cornerRadius(10)
                        }//Section sensor
                }
                    Section(header: Text("Umidade")){
                        Chart {
                            ForEach(sensorData.data, id: \.self) { item in
                                let lastDate = Date.now.addingTimeInterval(-300)
                                let sensorDate = viewModel.formatDate(date: item.date)
                                if (sensorDate > lastDate){
                                    LineMark(
                                        x: .value("Time", sensorDate),
                                        y: .value("Umidity", item.raw.umidade))
                                }
                                
                            }
                        }.frame(width: 300, height: 300)
                    }//sensor umidade
                    Section(header: Text("inclinação")){
                        if let lastElement = sensorData.data.last {
                            Text("Inclinação: " + lastElement.inclinacao)
                            Image("\(Int(lastElement.raw.inclinacaoSegmentos))")
                                .resizable()
                                .frame(width: 310, height: 310)
                        }
                    }//Section inclincao
            }
            .onAppear(){
                mapLocat.center = sensor.coordinate
                viewModel.fetch()
            }
            .onReceive(timer) { time in
                viewModel.fetch()
                mapLocat.center = sensor.coordinate
            }
            .navigationTitle(sensor.name)
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
