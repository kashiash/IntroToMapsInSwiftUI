//
//  CustomMapAnnotations.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/27/22.
//

import SwiftUI
import MapKit

struct CustomMapAnnotations: View {
    @State private var region = MKCoordinateRegion(center: MapPlace.mapPlaces[0].coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
    @State private var mapType: MKMapType = .hybrid
    
    var body: some View {
        UIKitMapView_Annotation(region: region, mapType: mapType, places: MapPlace.mapPlaces)
            .ignoresSafeArea(.all)
    }
}

struct CustomMapAnnotations_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapAnnotations()
    }
}

final class MapPlace: NSObject, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let location: CLLocation
    
    init(name: String, image: String, location: CLLocation) {
        self.name = name
        self.image = image
        self.location = location
    }
}

extension MapPlace {
    static var mapPlaces: [MapPlace] {
        [
            MapPlace(name: "Golden Gate Bridge", image: "GG", location: CLLocation(latitude: 37.83266647135866, longitude: -122.47709319891423)),
            MapPlace(name: "Statue of Liberty", image: "SOL", location: CLLocation(latitude: 40.700005935766036, longitude: -74.044917569399)),
            MapPlace(name: "Eiffel Tower", image: "ET", location: CLLocation(latitude: 40.748570526797614, longitude: -73.98560002833449)),
            MapPlace(name: "Gilroy Garlic", image: "GGarlic", location: CLLocation(latitude: 36.988917901109794, longitude: -121.55013690759337)),
            MapPlace(name: "Sea World", image: "SW", location: CLLocation(latitude: 32.761804202349005, longitude: -117.2255336727055))
        ]
    }
}

extension MapPlace: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        location.coordinate
    }
    
    var title: String? {
        name
    }
}

struct UIKitMapView_Annotation: UIViewRepresentable {
    let region: MKCoordinateRegion
    let mapType: MKMapType
    let places: [MapPlace]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: true)
        mapView.mapType = mapType
        mapView.isRotateEnabled = false
        mapView.delegate = context.coordinator
        mapView.addAnnotations(places)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType
    }
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator()
    }
    
    final class MapCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let mapPlace = annotation as? MapPlace else { return nil }
            
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "customMapAnnotation") as? MKMarkerAnnotationView ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "customMapAnnotation")
            
            annotationView.canShowCallout = true
            annotationView.glyphText = "⛳️"
            annotationView.markerTintColor = .systemPink
            annotationView.titleVisibility = .visible
            annotationView.detailCalloutAccessoryView = UIImage(named: mapPlace.image).map(UIImageView.init)
            
            return annotationView
        }
    }
}
