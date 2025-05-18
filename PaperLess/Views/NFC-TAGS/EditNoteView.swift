//
//  EditNoteView.swift
//  PaperLess
//
//  Created by Tom Salih on 20.04.25.
//

import SwiftUI

struct EditNoteView: View {
    @Binding var note: Note
    @Environment(\.dismiss) private var dismiss
    @State private var text: String
    
    init(note: Binding<Note>) {
        self._note = note
        self._text = State(initialValue: note.wrappedValue.note)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Note", text: $text)
                }
            }
            .navigationBarTitle("Bearbeiten")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        note.note = text
                        dismiss()
                    } label: {
                        Text("Speichern")
                    }
                }
            }
        }
    }
}

#Preview {
    EditNoteView(note: .constant(Note(note: "Text", date: Date())))
}
