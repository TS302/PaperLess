//
//  NoteSection.swift
//  PaperLess
//
//  Created by Tom Salih on 20.04.25.
//

import SwiftUI

struct NoteSection: View {
    @Binding var notes: [Note]
    let addNoteAction: () -> Void
    
    var body: some View {
        Section(header: HStack {
            Text("Notizen")
                .modifier(ListRowSubtitle())
            Spacer()
            Button(action: addNoteAction) {
                Image(systemName: "note.text.badge.plus")
                    .foregroundStyle(Color.appPrimary)
            }
        }) {
            if notes.isEmpty {
                Text("Keine Notizen vorhanden. Klicke auf den Plus-Knopf, um eine zu erstellen.")
                    .modifier(ListRowSubtitle())
            } else {
                ForEach($notes, id: \.id) { $note in
                    NavigationLink(destination: EditNoteView(note: $note)) {
                        VStack (alignment: .leading) {
                            HStack {
                                Text(note.date, style: .date)
                                    .modifier(ListRowSubtitle())
                                Spacer()
                                Text(note.date, style: .time)
                                    .modifier(ListRowSubtitle())
                            }
                            .padding(.vertical, 2)
                            Text(note.note)
                                .font(AppFonts.body)
                                .foregroundStyle(Color.appPrimary)
                        }
                    }
                }
                .onDelete { indexSet in
                    notes.remove(atOffsets: indexSet)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        List {
            NoteSection(
                notes: .constant(Note.sampleData),
                addNoteAction: { }
            )
        }
        .listStyle(InsetGroupedListStyle())
    }
}
