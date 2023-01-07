//
//  ContentView.swift
//  IntroToMapsInSwiftUI
//
//  Created by DevTechie on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        VStack{
            
            NavigationStack(path: $path) {
                VStack{
                    Button {
                        path.append("Basic")
                    } label: {
                        Text("Show Basic")
                    }
                    .padding()
                    Button {
                        path.append("MapMarkersAndPins")
                    } label: {
                        Text("Show MapMarkersAndPins")
                    }
                    .padding()
                    
                    Button {
                        path.append("MapAnnotationExamples")
                    } label: {
                        Text("Show MapAnnotationExamples")
                    }
                    .padding()
                }
                   .navigationDestination(for: String.self) { view in
                       if view == "Basic" {
                           BasicsOfMaps()
                       }
                       if view == "MapMarkersAndPins" {
                           MapMarkersAndPins()
                       }
                       if view == "MapAnnotationExamples" {
                           MapAnnotationExamples()
                       }
                   }
               }
            
            NavigationView {
               
                List{
                    NavigationLink(
                        /// 2
                        destination: BasicsOfMaps(),
                        /// 3
                        label: {
                            Text("Basic")
                        })
                    
                    NavigationLink(
                        /// 2
                        destination: MapMarkersAndPins(),
                        /// 3
                        label: {
                            Text("Map Markers And Pins")
                        })
                    
                    NavigationLink(
                        /// 2
                        destination: MapAnnotationExamples(),
                        /// 3
                        label: {
                            Text("Map Annotation")
                        })
                    
                    NavigationLink(
                        /// 2
                        destination: MapTypeExample(),
                        /// 3
                        label: {
                            Text("MapTypeExample")
                        })
                    
                    NavigationLink(
                        /// 2
                        destination: MapWithUserLocation(),
                        /// 3
                        label: {
                            Text("Map With User Location")
                        })
                    
                    NavigationLink(
                        /// 2
                        destination: CustomMapAnnotations(),
                        /// 3
                        label: {
                            Text("CustomMapAnnotations")
                        })
                }
            }
     
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
