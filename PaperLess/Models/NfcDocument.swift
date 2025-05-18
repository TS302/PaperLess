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
    var category: Category?
    var purchaseDate: Date?
    var serviceIntervalMonth: ServiceInterval?
    var nextServiceDate: Date?
    var status: DeviceStatus = .available
    var location: String?
    var notes: [Note] = []
    var images: [UIImage] = []
}

enum DeviceStatus: String, Codable, CaseIterable, Identifiable {
    case available = "available"
    case loaned    = "loaned"
    case lost      = "lost"
    case defect    = "defect"

    var id: Self { self }
    
    var localizedName: String {
        switch self {
        case .available: return "Verfügbar"
        case .loaned:    return "Verliehen"
        case .lost:      return "Verloren"
        case .defect:    return "Defekt"
        }
    }
    
    var color: Color {
        switch self {
        case .available: return .green
        case .loaned:    return .blue
        case .lost:      return .gray
        case .defect:    return .red
        }
    }
}

enum ServiceInterval: Int, Codable, CaseIterable, Identifiable {
    case three   = 3
    case six     = 6
    case nine    = 9
    case twelve  = 12

    var id: Int { rawValue }

    var localizedName: String {
        switch self {
        case .three:   return "3 Monate"
        case .six:     return "6 Monate"
        case .nine:    return "9 Monate"
        case .twelve:  return "12 Monate"
        }
    }
}

enum Category: String, Codable, CaseIterable, Identifiable {
    case kleingerät = "Kleingerät"
    case werkzeug   = "Werkzeug"
    case maschine   = "Maschine"
    case fahrzeug   = "Fahrzeug"
    
    var id: Self { self }
    var localizedName: String { rawValue }
}

enum SortOption: String, CaseIterable, Identifiable {
    case name, status, category
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .name:
            return "ABC"
        case .status:
            return "Status"
        case .category:
            return "Ketegorie"
        }
    }
}
