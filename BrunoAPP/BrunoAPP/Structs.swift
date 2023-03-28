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

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
