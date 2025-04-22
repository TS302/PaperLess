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
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.appPrimary)
            Spacer()
            Button(action: addNoteAction) {
                Image(systemName: "note.text.badge.plus")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.appPrimary)
            }
        }) {
            if notes.isEmpty {
                Text("Keine Notizen vorhanden.")
                    .modifier(ListRowSubtitle())
            } else {
                ForEach($notes, id: \.id) { $note in
                    NavigationLink(destination: EditNoteView(note: $note)) {
                        HStack {
                            Image(systemName: "note.text")
                                .font(.system(size: 30))
                                .foregroundStyle(Color.appPrimary)
                                .padding(.leading, -5)
                                .padding(.trailing, 4)
                            
                        }
                        VStack (alignment: .leading) {
                            HStack {
                                Text(note.date, style: .date)
                                    .font(AppFonts.body)
                                    .foregroundStyle(Color.appPrimary)
                                    .opacity(0.5)
                                Spacer()
                                Text(note.date, style: .time)
                                    .font(AppFonts.body)
                                    .foregroundStyle(Color.appPrimary)
                                    .opacity(0.5)
                            }
                            .padding(.vertical, 2)
                            Text(note.note)
                                .lineLimit(1)
                                .font(AppFonts.body)
                                .foregroundStyle(Color.black)
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
                notes: .constant([
                    Note(note: "Gerät mit NFC-Sticker registriert.", date: Date()),
                    Note(note: "Batteriestatus geprüft: 85 % Restkapazität", date: Date())
                ]),
                addNoteAction: {
                    print("Add Note tapped")
                }
            )
            NoteSection(
                notes: .constant([]),
                addNoteAction: { print("Add Note tapped") }
            )
        }
        .navigationTitle("Notizen Preview")
    }
}
