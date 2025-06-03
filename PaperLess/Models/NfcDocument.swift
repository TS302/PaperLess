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
    
    static var sampleData: [NfcDocument] = [
        NfcDocument(
            name: "SmartLamp LUX",
            brand: "Lumina",
            model: "LX-01",
            serialNumber: "SL-2025-A1",
            category: .kleingerät,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 10)),
            serviceIntervalMonth: .twelve,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 12, to: Date()),
            status: .available,
            location: "Büro-Ecke",
            notes: [Note(note: "Letztes Firmware-Update im März 2025.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "PocketSensor P1",
            brand: "SenseIt",
            model: "P1",
            serialNumber: "PS-1002",
            category: .kleingerät,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 5)),
            serviceIntervalMonth: .six,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 6, to: Date()),
            status: .loaned,
            location: "Laborausgang",
            notes: [Note(note: "Wird aktuell in Projekt X verwendet.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "MiniHeater 200",
            brand: "HeatHome",
            model: "MH-200",
            serialNumber: "MH-200-334",
            category: .kleingerät,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 11, day: 21)),
            serviceIntervalMonth: .twelve,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 12, to: Date()),
            status: .lost,
            location: "Lagerraum B",
            notes: [Note(note: "Letzter Standort unklar.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "SmartPlug X",
            brand: "PlugTech",
            model: "SP-X",
            serialNumber: "SPX-5589",
            category: .kleingerät,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 2)),
            serviceIntervalMonth: .nine,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 9, to: Date()),
            status: .defect,
            location: "Elektrikraum",
            notes: [Note(note: "Defektes Relais, Austausch geplant.", date: Date())],
            images: []
        ),
        // Vier Werkzeuge
        NfcDocument(
            name: "TurboDrill 500",
            brand: "DrillMaster",
            model: "DM-500",
            serialNumber: "TD-5500-B2",
            category: .werkzeug,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 22)),
            serviceIntervalMonth: .six,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 6, to: Date()),
            status: .available,
            location: "Werkstatt",
            notes: [Note(note: "Regelmäßige Ölung empfohlen.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "FlexSaw 200",
            brand: "CutEase",
            model: "FS-200",
            serialNumber: "FS-200-778",
            category: .werkzeug,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 5, day: 14)),
            serviceIntervalMonth: .nine,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 9, to: Date()),
            status: .loaned,
            location: "Baustelle Süd",
            notes: [Note(note: "Ausgeliehen an Josef.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "QuickWrench Pro",
            brand: "WrenchWorks",
            model: "QW-Pro",
            serialNumber: "QWP-3311",
            category: .werkzeug,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2021, month: 9, day: 30)),
            serviceIntervalMonth: .twelve,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 12, to: Date()),
            status: .lost,
            location: "Unbekannt",
            notes: [Note(note: "Verloren beim Kundenbesuch.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "PrecisionScrewdriver 300",
            brand: "ScrewTech",
            model: "PS-300",
            serialNumber: "PS300-445",
            category: .werkzeug,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 18)),
            serviceIntervalMonth: .three,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 3, to: Date()),
            status: .defect,
            location: "Reparaturstation",
            notes: [Note(note: "Bits abgenutzt, neues Set bestellt.", date: Date())],
            images: []
        ),
        // Vier Maschinen
        NfcDocument(
            name: "FiberLaser X2",
            brand: "CutTech",
            model: "FT-X2",
            serialNumber: "FL-00234",
            category: .maschine,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 4, day: 5)),
            serviceIntervalMonth: .nine,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 9, to: Date()),
            status: .available,
            location: "Produktionshalle",
            notes: [Note(note: "Wartung letzte Woche abgeschlossen.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "EcoMover 1000",
            brand: "GreenMove",
            model: "GM-1000",
            serialNumber: "EM-1000-C3",
            category: .maschine,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2021, month: 11, day: 12)),
            serviceIntervalMonth: .twelve,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 12, to: Date()),
            status: .loaned,
            location: "Lager A",
            notes: [Note(note: "Verliehen an Außendienst.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "AutoPress 5000",
            brand: "PressTech",
            model: "AP-5000",
            serialNumber: "AP5K-7788",
            category: .maschine,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 20)),
            serviceIntervalMonth: .six,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 6, to: Date()),
            status: .lost,
            location: "Produktionslinie",
            notes: [Note(note: "Zuletzt im Schichtwechsel gesehen.", date: Date())],
            images: []
        ),
        NfcDocument(
            name: "RoboWelder 900",
            brand: "WeldMaster",
            model: "RW-900",
            serialNumber: "RW900-1122",
            category: .maschine,
            purchaseDate: Calendar.current.date(from: DateComponents(year: 2020, month: 7, day: 8)),
            serviceIntervalMonth: .twelve,
            nextServiceDate: Calendar.current.date(byAdding: .month, value: 12, to: Date()),
            status: .defect,
            location: "Reparaturwerkstatt",
            notes: [Note(note: "Schweißarm kalibriert, jedoch Achse blockiert.", date: Date())],
            images: []
        )
    ]
    
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




