//
//  AddNoteView.swift
//  PaperLess
//
//  Created by Tom Salih on 19.04.25.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var notes: [Note]
    @State private var newText = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Neue notiz") {
                    TextEditor(text: $newText)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("Neue Notiz")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Speichern") {
                        let note = Note(note: newText, date: Date())
                        notes.append(note)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNoteView(notes: .constant([
        Note(note: "Test", date: Date())
    ])
    )
}
