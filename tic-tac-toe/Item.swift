//
//  Item.swift
//  tic-tac-toe
//
//  Created by Alexey Tsutsoev on 01.03.2025.
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
