//
//  DocumentRowView.swift
//  PaperLess
//
//  Created by Tom Salih on 02.04.25.
//

import SwiftUI

struct DocumentRow: View {
    let document: Document
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "text.page")
                .font(.system(size: 25))
                .frame(width: 50, height: 50)
                .background(Color.appPrimary)
                .clipShape(Circle())
                .foregroundStyle(Color.appSecondary)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(document.title)
                    .font(.caption)
                    .fontWeight(.semibold)
                Text(document.description)
                    .font(.caption2)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    DocumentRow(document: Document(id: UUID(), title: "Test", description: "Lorem ipsum dolor sit amet, consetetur sadip scing elitr, sed diam consetetur sadipscing elitr, sed dia"))
}
