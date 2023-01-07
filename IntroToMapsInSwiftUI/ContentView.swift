//
//  ContentView.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @StateObject private var coordinator = Coordinator()
    var body: some View {
        VStack{
            
            NavigationStack(path: $coordinator.path) {
                VStack{
                    Button {
                        coordinator.show(BasicsOfMaps.self)
                    } label: {
                        Text("Show Basic")
                    }
                    .padding()
                    Button {
                        coordinator.show(MapMarkersAndPins.self)
                       
                    } label: {
                        Text("Show MapMarkersAndPins")
                    }
                    .padding()
                    
                    Button {
                        coordinator.show(MapAnnotationExamples.self)
                       
                    } label: {
                        Text("Show MapAnnotationExamples")
                    }
                    .padding()
                    
                    Button {
                        coordinator.show(MapTypeExample.self)
                       
                    } label: {
                        Text("Show MapTypeExample")
                    }
                    .padding()
                    
                    
                    Button {
                        coordinator.show(MapWithUserLocation.self)
                       
                    } label: {
                        Text("Show MapWithUserLocation")
                    }
                    .padding()
                    
                    Button {
                        coordinator.show(CustomMapAnnotations.self)
                       
                    } label: {
                        Text("Show CustomMapAnnotations")
                    }
                    .padding()
                }
                   .navigationDestination(for: String.self) { view in
                       if view == String(describing: BasicsOfMaps.self) {
                           BasicsOfMaps()
                       }
                       if view == String(describing: MapMarkersAndPins.self) {
                           MapMarkersAndPins()
                       }
                       if view == String(describing: MapAnnotationExamples.self) {
                           MapAnnotationExamples()
                       }
                       if view == String(describing: MapTypeExample.self) {
                           MapTypeExample()
                       }
                       if view == String(describing: MapWithUserLocation.self) {
                           MapWithUserLocation()
                       }
                       if view == String(describing: CustomMapAnnotations.self) {
                           CustomMapAnnotations()
                       }
                   }
               }
            
//            NavigationView {
//
//                List{
//                    NavigationLink(
//                        /// 2
//                        destination: BasicsOfMaps(),
//                        /// 3
//                        label: {
//                            Text("Basic")
//                        })
//
//                    NavigationLink(
//                        /// 2
//                        destination: MapMarkersAndPins(),
//                        /// 3
//                        label: {
//                            Text("Map Markers And Pins")
//                        })
//
//                    NavigationLink(
//                        /// 2
//                        destination: MapAnnotationExamples(),
//                        /// 3
//                        label: {
//                            Text("Map Annotation")
//                        })
//
//                    NavigationLink(
//                        /// 2
//                        destination: MapTypeExample(),
//                        /// 3
//                        label: {
//                            Text("MapTypeExample")
//                        })
//
//                    NavigationLink(
//                        /// 2
//                        destination: MapWithUserLocation(),
//                        /// 3
//                        label: {
//                            Text("Map With User Location")
//                        })
//
//                    NavigationLink(
//                        /// 2
//                        destination: CustomMapAnnotations(),
//                        /// 3
//                        label: {
//                            Text("CustomMapAnnotations")
//                        })
//                }
//            }
     
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
