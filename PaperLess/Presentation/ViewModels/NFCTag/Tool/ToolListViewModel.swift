//
//  ToolListViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 15.06.25.
//

import SwiftUI
import Combine

class ToolListViewModel: ObservableObject {
    
    @Published var showAddTool = false
    @Published var searchText: String = ""
    @Published var showEditTool = false
    @Published var selectedSegment = 0
    @Published var tools: [Tool] = []
    @Published var tool: Tool? = nil
    
    private let getTools: LoadToolsUseCase
    private let deleteTool: DeleteToolUseCase
    
    
    
    init() {
        let repository = ToolRepository()
        self.getTools = LoadToolsUseCase(repository: repository)
        self.deleteTool = DeleteToolUseCase(repository: repository)
    }
    
    func loadTools() {
        tools = getTools.execute()
    }
    
    func deleteTool(id: UUID) {
        deleteTool.execute(id: id)
        loadTools()
    }
   
    
    
}
