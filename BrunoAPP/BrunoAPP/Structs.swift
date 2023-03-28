//
//  Structs.swift
//  BrunoAPP
//
//  Created by Student on 28/03/23.
//

import Foundation
import MapKit

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
