//
//  NFCTagListView.swift
//  PaperLess
//
//  Created by Tom Salih on 04.06.25.
//

import SwiftUI

/// Ein generischer List-View, der für alle Typen `T` funktioniert,
/// die NFCTagProtocol + Identifiable erfüllen.
/// - `items`: gebundene Liste von T
/// - `destination`: Closure, die für jedes einzelne `Binding<T>` den Ziel-View zurückgibt
struct NFCTagListView<
    T: NFCTagProtocol & Identifiable,
    Destination: View
>: View {
    /// Gebundene Liste von Objekten vom Typ T (z.B. Binding<[Vehicle]> oder Binding<[Tool]>)
    @Binding var items: [T]
    
    /// Für jedes Element in `items` erzeugt diese Closure den Ziel-View (z.B. VehicleDetailView)
    let destination: (Binding<T>) -> Destination
    
    var body: some View {
        ForEach($items) { $item in
            NavigationLink {
                // Detail-View übergeben
                destination($item)
            } label: {
                // Row-Ansicht (sollte NFCListRow<T> sein)
                NFCListRow(tag: $item)
            }
            // Optional: hier kannst du z.B. .listRowSeparator(...) oder .padding() hinzufügen,
            // falls du für jede Zeile spezielle Modifikatoren brauchst.
            .listRowBackground(Color.secondary)
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    delete($item)
                } label: {
                    Label("Löschen", systemImage: "trash")
                }
                .tint(Color.error)
            }
        }
    }
    
    private func delete(_ element: Binding<T>) {
            // Finde den Index des gehakten Elements und entferne es
            if let idx = items.firstIndex(where: { $0.id == element.wrappedValue.id }) {
                items.remove(at: idx)
            }
        }
}

