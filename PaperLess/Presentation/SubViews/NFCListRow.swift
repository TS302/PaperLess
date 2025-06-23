//
//  ListRowTextField.swift
//  PaperLess
//
//  Created by Tom Salih on 19.04.25.
//


import SwiftUI

/// Generische List-Row für alle Typen `T: NFCTagProtocol`.
/// Zeigt automatisch typ-spezifische Eigenschaften für Vehicle, Tool und Key an.
struct NFCListRow<T: NFCTagProtocol>: View {
    @Binding var tag: T
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // Linke Spalte: Name und TagID
            VStack(alignment: .leading) {
                Text(tag.nfcTag.name)
                    .font(.headline)
                HStack {
                    
                    Image(systemName: "widget.small")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15)
                    
                    Text(tag.nfcTag.tagID)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }
            
            Spacer()
            
            HStack {
                Image(systemName: tag.nfcTag.icon)
                Image(systemName: "ellipsis.rectangle.fill")
                    .foregroundStyle(Color(tag.nfcTag.status.color))
                
                // Typ-spezifische Felder und Favoriten-Status
                if let vehicle = tag as? Vehicle {
                    Image(systemName: "star.fill")
                        .foregroundColor(vehicle.isFavorite ? .yellow : Color.primary.opacity(0.3))
                } else if let tool = tag as? Tool {
                    Image(systemName: "star.fill")
                        .foregroundColor(tool.isFavorite ? .yellow : Color.primary.opacity(0.3))
                } else if let key = tag as? Key {
                    Image(systemName: "star.fill")
                        .foregroundColor(key.isFavorite ? .yellow : Color.primary.opacity(0.3))
                }
            }
        }
        .padding(.vertical, 8)
    }
}

