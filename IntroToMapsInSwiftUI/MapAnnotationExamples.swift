//
//  MapAnnotationExamples.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/25/22.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

extension AnnotationItem {
    static var POI: [AnnotationItem] {
        [
            AnnotationItem(name: "Golden Gate Bridge", coordinate: CLLocationCoordinate2D(latitude: 37.82010137464469, longitude: -122.47877838249447)),
            AnnotationItem(name: "San Diego Zoo", coordinate: CLLocationCoordinate2D(latitude: 33.095829, longitude: -117.008797)),
            AnnotationItem(name: "Statue Of Liberty", coordinate: CLLocationCoordinate2D(latitude: 40.689247, longitude: -74.044502)),
            AnnotationItem(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.74853801503154, longitude: -73.98590043614894))
        ]
    }
}

struct MapAnnotationExamples: View {
    @State private var region = MKCoordinateRegion(center: AnnotationItem.POI[0].coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: AnnotationItem.POI) { item in
            MapAnnotation(coordinate: item.coordinate, anchorPoint: CGPoint(x: 0.5, y: 1.5)) {
                ZStack {
                    Image(systemName: "arrow.down")
                        .offset(y: 20)
                        .font(.title.bold())
                    Image(systemName: "flag.circle.fill")
                        .font(.largeTitle)
                    Text(item.name)
                        .font(.footnote)
                        .offset(y: -30)
                }
                .foregroundStyle(LinearGradient(colors: [Color.green, .pink], startPoint: .top, endPoint: .bottom))
            }
        }
        .ignoresSafeArea()
    }
}

struct MapAnnotationExamples_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationExamples()
    }
}
