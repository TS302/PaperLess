//
//  ListRowTextField.swift
//  PaperLess
//
//  Created by Tom Salih on 19.04.25.
//

import SwiftUI

struct NFCListRow<T: NFCTagProtocol>: View {
    @Binding var tag: T
    
    var body: some View {
        HStack {
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
            
            Image(systemName: tag.nfcTag.icon)
                .padding(.trailing, 8)
            Text(tag.nfcTag.status.localizedName)
                .frame(width: 60)
                .padding(4)
                .background((Color(tag.nfcTag.status.color)))
                .foregroundStyle(Color.white)
                .font(.caption2)
                .fontWeight(.bold)
                .cornerRadius(4)
        }
        .padding(.vertical, 8)
    }
}
