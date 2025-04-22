//
//  NfcDocument.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import Foundation
import PhotosUI
import SwiftUI

struct NfcDocument: Identifiable {
    let id: UUID = UUID()
    var name: String
    var brand: String
    var model: String
    var serialNumber: String?
    var category: String?
    var purchaseDate: Date?
    var serviceIntervalMonth: Int?
    var nextServiceDate: Date?
    var status: DeviceStatus = .available
    var location: String?
    var notes: [Note] = []
    var images: [UIImage] = []
}

enum DeviceStatus: String, Codable {
    case available = "available"
    case loaned = "loaned"
    case lost = "lost"
    case defect = "defect"
}
