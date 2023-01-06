//
//  MapTypeExample.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/26/22.
//

import SwiftUI
import MapKit

struct MapTypeExample: View {
    
    @State private var region = MKCoordinateRegion(center: AnnotationItem.POI[0].coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    @State private var mapType: MKMapType = .standard
    
    var body: some View {
        ZStack {
            UIKitMapView(region: region, mapType: mapType)
            
            VStack {
                Spacer()
                Picker("", selection: $mapType) {
                    Text("Standard").tag(MKMapType.standard)
                    Text("Hybrid").tag(MKMapType.hybrid)
                    Text("Satellite").tag(MKMapType.satellite)
                }
                .pickerStyle(.segmented)
                .background(.thickMaterial)
            }
            .offset(y: -40)
        }
        .ignoresSafeArea(.all)
    }
}

struct MapTypeExample_Previews: PreviewProvider {
    static var previews: some View {
        MapTypeExample()
    }
}
