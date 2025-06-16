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
    @Published var newTool: Tool
    
    private let getTools: LoadToolsUseCase
    private let deleteTool: DeleteToolUseCase
    private let addTool: AddToolUseCase
    private let makeEmptyTool: MakeEmptyToolUseCase
    
    init() {
        let repository = ToolRepository()
        self.getTools = LoadToolsUseCase(repository: repository)
        self.addTool = AddToolUseCase(repository: repository)
        self.makeEmptyTool = MakeEmptyToolUseCase(repository: repository)
        self.deleteTool = DeleteToolUseCase(repository: repository)
        
        self.newTool = makeEmptyTool.execute()
    }
    
    func loadTools() {
        tools = getTools.execute()
    }
    
    func deleteTool(id: UUID) {
        deleteTool.execute(id: id)
        loadTools()
    }
    
    func addTool(newTool: Tool) {
        addTool.execute(newTool: newTool)
        loadTools()
    }
    
    func emptyNewTool() {
        newTool = makeEmptyTool.execute()
    }
    
    
}
