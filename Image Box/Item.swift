//
//  Item.swift
//  Image Box
//
//  Created by Kinda on 2024/11/29.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
