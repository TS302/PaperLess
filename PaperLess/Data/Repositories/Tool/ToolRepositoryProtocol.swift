//
//  ToolRepositoryProtocol.swift
//  PaperLess
//
//  Created by Tom Salih on 15.06.25.
//

import Foundation

protocol ToolRepositoryProtocol {
    func getAllTools() -> [Tool]
    func addTool(tool: Tool)
    func makeEmptyTool() -> Tool
    func deleteTool(id: UUID)
    func updateTool(tool: Tool)    
}
