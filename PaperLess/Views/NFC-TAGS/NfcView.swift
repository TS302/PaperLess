//
//  NfcView.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import SwiftUI

struct NfcView: View {
    @StateObject private var viewModel = NFCViewModel()
    @State private var showAddNfcTag = false
    @State private var showFilterOptions = false
    
    private var filteredIndices: [Int] {
        viewModel
            .filteredAndSorted
            .compactMap { viewModel.index(of: $0) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredIndices, id: \.self) { idx in
                    NavigationLink {
                        NfcDetailView(nfcDocument: $viewModel.nfcDocuments[idx])
                    } label: {
                        NfcDocumentRow(nfcDocument: viewModel.nfcDocuments[idx])
                    }
                }
                .onDelete(perform: viewModel.delete)
                .onMove(perform: viewModel.move)
            }
            .navigationTitle("NFC-Dokumente")
            .searchable(text: $viewModel.searchText, prompt: "Suchen")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Alphabetisch") { viewModel.sortOption = .name }
                        Button("Status")       { viewModel.sortOption = .status }
                        Button("Geräteart")    { viewModel.sortOption = .category }
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.circle")
                    }
                    .tint(.appPrimary)
                    Button {
                        showAddNfcTag.toggle()
                    } label: {
                        Image(systemName: "widget.small.badge.plus")
                    }
                    .tint(Color.appPrimary)
                }
            }
            .sheet(isPresented: $showAddNfcTag) {
                AddNFCTag(nfcDocuments: $viewModel.nfcDocuments)
            }
        }
    }
}
#Preview {
    NfcView()
}
