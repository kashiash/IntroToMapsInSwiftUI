//
//  BasicsOfMaps.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/25/22.
//

import SwiftUI
import MapKit

struct BasicsOfMaps: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.82010137464469,
            longitude: -122.47877838249447),
        latitudinalMeters: 10000,
        longitudinalMeters: 10000)
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region,
                interactionModes: [] // .PAN ONLY MOVE .ZOOM only zoom
            ).ignoresSafeArea()

        }
            
    }
}

struct BasicsOfMaps_Previews: PreviewProvider {
    static var previews: some View {
        BasicsOfMaps()
    }
}
