//
//  Structs.swift
//  BrunoAPP
//
//  Created by Student on 28/03/23.
//

import Foundation
import MapKit
import SwiftUI

struct Notification : Hashable{
    let type : String
    let sensor : String
    let date : String
}

struct Sensor: Identifiable {
    let id = UUID()
    // pegar id do banco de dados
    let name: String
    let locationName: String
    let description: String
    let coordinate: CLLocationCoordinate2D
}

struct mapLocation {
    
    //var teste = MKCoordinateRegion()
    static var center = CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388)
    static var span =  MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
    
}

struct sensorData {
    static var data : [SensorData] = []
}
