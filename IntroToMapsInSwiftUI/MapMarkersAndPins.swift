//
//  MapMarkersAndPins.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/26/22.
//

import SwiftUI
import MapKit

struct MapMarkersAndPins: View {
    @State private var region = MKCoordinateRegion(center: AnnotationItem.POI[0].coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
       
       var body: some View {
           TabView {
               markerView
                   .tabItem {
                       Label("Map Marker", systemImage: "mappin.circle.fill")
                   }
               
               pinView
                   .tabItem {
                       Label("Map Pin", systemImage: "mappin")
                   }
           }
       }
    
    private var markerView: some View {
        Map(coordinateRegion: $region, annotationItems: AnnotationItem.POI) { item in
            MapMarker(coordinate: item.coordinate, tint: .green)
        }
    }
    
    private var pinView: some View {
        Map(coordinateRegion: $region, annotationItems: AnnotationItem.POI) { item in
            MapPin(coordinate: item.coordinate, tint: .orange)
        }
    }
}

struct MapMarkersAndPins_Previews: PreviewProvider {
    static var previews: some View {
        MapMarkersAndPins()
    }
}
