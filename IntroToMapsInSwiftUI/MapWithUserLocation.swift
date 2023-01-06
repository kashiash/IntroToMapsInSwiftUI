//
//  MapWithUserLocation.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/26/22.
//

import SwiftUI
import MapKit

struct MapWithUserLocation: View {
    @StateObject private var locationManager = LocationManager()
    
    var region: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.location else {
            return MKCoordinateRegion.goldenGateRegion().getBinding()
        }
        
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        return region.getBinding()
    }
    
    var body: some View {
        if let region = region {
            Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .ignoresSafeArea()
        }
    }
}

struct MapWithUserLocation_Previews: PreviewProvider {
    static var previews: some View {
        MapWithUserLocation()
    }
}
