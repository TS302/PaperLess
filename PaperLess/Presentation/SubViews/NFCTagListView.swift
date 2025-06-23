//
//  NFCTagListView.swift
//  PaperLess
//
//  Created by Tom Salih on 04.06.25.
//

import SwiftUI

/// Generische List-Komponente, die nur die Items anzeigt,
/// für die `filter(item) == true` gilt.
struct NFCTagListView<
    T: NFCTagProtocol & Identifiable,
    Destination: View
>: View {
    @Binding var items: [T]
    let filter: (T) -> Bool
    let destination: (Binding<T>) -> Destination
    let onDelete: (T) -> Void

    var body: some View {
        // 1) lokale Variable: Indizes filtern
        let filteredIndices = items.indices.filter { filter(items[$0]) }
        
        // 2) über gefilterte Indizes iterieren
        ForEach(filteredIndices, id: \.self) { idx in
            let binding = $items[idx]       // echtes Binding auf Original-Array

            NavigationLink {
                destination(binding)
            } label: {
                NFCListRow(tag: binding)
            }
            .listRowBackground(Color.secondary)
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    onDelete(items[idx])
                } label: {
                    Label("Löschen", systemImage: "trash")
                }
                .tint(Color.error)
            }
        }
    }
}

