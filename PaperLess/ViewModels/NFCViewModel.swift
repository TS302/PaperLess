//
//  NFCViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 25.05.25.
//

import Foundation
import SwiftUI

final class NFCViewModel: ObservableObject {
    @Published var nfcDocuments: [NfcDocument] = []
    @Published var searchText: String = ""
    @Published var sortOption: SortOption = .name
    @Published var filterOption: FilterOption = .all
    
    init(documents: [NfcDocument] = NfcDocument.sampleData) {
        self.nfcDocuments = documents
    }
    
    var filteredAndSorted: [NfcDocument] {
        let filtered = nfcDocuments.filter { doc in
            (searchText.isEmpty
             || doc.name.localizedCaseInsensitiveContains(searchText)
             || doc.brand.localizedCaseInsensitiveContains(searchText)
             || doc.model.localizedCaseInsensitiveContains(searchText))
            && (filterOption == .all
                || (filterOption == .available && doc.status == .available)
                || (filterOption == .loaned    && doc.status == .loaned)
                || (filterOption == .defect    && doc.status == .defect)
                || (filterOption == .lost      && doc.status == .lost))
        }
        return filtered.sorted(by: sortFunction)
    }
    
    func delete(at offsets: IndexSet) {
        nfcDocuments.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        nfcDocuments.move(fromOffsets: source, toOffset: destination)
    }
    
    // Hilfsfunktion für Binding im View
    func index(of document: NfcDocument) -> Int? {
        nfcDocuments.firstIndex(where: { $0.id == document.id })
    }
    
    // Sortierlogik
    private var sortFunction: (NfcDocument, NfcDocument) -> Bool {
        switch sortOption {
        case .name:
            return { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
            
        case .status:
            let order: [DeviceStatus] = [.available, .loaned, .defect, .lost]
            return { a, b in
                let iA = order.firstIndex(of: a.status) ?? 0
                let iB = order.firstIndex(of: b.status) ?? 0
                return iA != iB ? (iA < iB) : (a.name < b.name)
            }
        case .category:
            let order: [Category] = [.kleingerät, .werkzeug, .maschine, .fahrzeug]
            return { a, b in
                let iA = order.firstIndex(of: a.category ?? .kleingerät) ?? 0
                let iB = order.firstIndex(of: b.category ?? .kleingerät) ?? 0
                return iA != iB ? (iA < iB) : (a.name < b.name)
            }
        }
    }
}

enum FilterOption {
    case all, available, loaned, defect, lost
}
