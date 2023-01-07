//
//  Coordinator.swift
//  IntroToMapsInSwiftUI
//
//  Created by Jacek Kosinski U on 07/01/2023.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func show<V>(_ viewType: V.Type) where V: View {
        path.append(String(describing: viewType.self))
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
