//
//  UIKitMapView.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/26/22.
//

import Foundation
import SwiftUI
import MapKit

struct UIKitMapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    let region: MKCoordinateRegion
    let mapType: MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.mapType = mapType
        mapView.isRotateEnabled = false
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
    }
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator()
    }
    
    
    
    final class MapCoordinator: NSObject, MKMapViewDelegate {}
}
