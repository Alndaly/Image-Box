//
//  RouterManager.swift
//  Image Box
//
//  Created by Kinda on 2024/12/1.
//

import Foundation
import SwiftUI

// Define your route enum to manage different destinations
enum HomeRoute: Hashable {
    case addIEView;
}

enum UserRouter: Hashable {
    
}

// NavigationRouter class to manage NavigationPath
class Router<Route: Hashable>: ObservableObject {
    
    @Published var path = [Route]()
    
    public func open(_ url: String) {
        guard let url = URL(string: url) else {
            return
        }
        UIApplication.shared.open(url)
    }
    
    public func navigate(_ route: Route) {
        path.append(route)
    }
    
    public func goBack() {
        path.removeLast()
    }
}
