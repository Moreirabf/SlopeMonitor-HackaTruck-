//
//  MapView.swift
//  BrunoAPP
//
//  Created by Student on 17/03/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var mapLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.5489, longitude: -46.6388), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $mapLocation)
            .scaledToFill()
            .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
