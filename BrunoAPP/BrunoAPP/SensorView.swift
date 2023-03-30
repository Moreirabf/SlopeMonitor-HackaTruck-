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
    @StateObject var viewModel = ViewModel()
    
    // umidity data
    let spUmidityData = [
        UmidityData(year: 2023, month: 1, day: 1, umidity: 23),
        UmidityData(year: 2023, month: 1, day: 2, umidity: 12),
        UmidityData(year: 2023, month: 1, day: 3, umidity: 14),
        UmidityData(year: 2023, month: 1, day: 4, umidity: 18),
        UmidityData(year: 2023, month: 1, day: 5, umidity: 23),
        UmidityData(year: 2023, month: 1, day: 6, umidity: 22),
        UmidityData(year: 2023, month: 1, day: 7, umidity: 21),
        UmidityData(year: 2023, month: 1, day: 8, umidity: 27),
        UmidityData(year: 2023, month: 1, day: 9, umidity: 39),
        UmidityData(year: 2023, month: 1, day: 10, umidity: 35),
        UmidityData(year: 2023, month: 1, day: 11, umidity: 28)
    ]
    
    var sensor : Sensor
    @State private var mapLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    var body: some View {
        NavigationStack {
            
                
                
                    VStack {
                        List {
                            Section(header : Text("Sensor")){
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
                                        
                                            
                                        
                                    }
                                    Map(coordinateRegion: $mapLocation)
                                        .frame(width: 160, height: 160)
                                        .cornerRadius(10)
                                }//section sensor
                            }//HSTACK
                            Section(header : Text("Umidade")){
                                
                                Chart {
                                    
                                    ForEach(viewModel.sensorData, id: \.self) { item in
                                        LineMark(
                                            x: .value("Time", viewModel.formatDate(date: item.date)),
                                            y: .value("Umidity", item.raw.umidade))
                                    }
                                }.frame(width: 300, height: 300)
                            }//section umidade
                            
                            Section(header : Text("inclinação")){
                                if let lastElement = viewModel.sensorData.last {
                                    Text("Inclinação: " + String( lastElement.raw.inclinacaoSegmentos))
                                    
                                }
                            }//Section inclinacao
                        }
                        .navigationTitle(sensor.name)
                            .onAppear(){
                            mapLocation.center = sensor.coordinate
                            viewModel.fetch()
                            }
                        }
                    }//VSTACk
                
            
        }
        
    }

struct SensorView_Previews: PreviewProvider {
    static var previews: some View {
        let sensor = Sensor(name: "Sao Paulo", locationName: "Lugar 1", description: "primeiro sensor", coordinate: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388))
        SensorView(sensor: sensor)
    }
}
