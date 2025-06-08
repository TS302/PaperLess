//
//  NFCViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 25.05.25.
//

import Foundation
import SwiftUI

final class NFCTagViewModel: ObservableObject {
    
    @Published var selectedSegment = 0
    @Published var showAddTool = false
    @Published var showAddKey = false
    @Published var searchText: String = ""
    @Published var sortOption: SortOption = .name
    @Published var filterOption: FilterOption = .all
    
    
    
    @Published var tools: [Tool] = [
        Tool(nfcTag: NFCTag(id: UUID(), tagID: "003", name: "Henry 2000", status: DeviceStatus.available, icon: ObjectIcon.tool.rawValue), brand: "Henry", toolType: ToolType.staubsauger),
        Tool(nfcTag: NFCTag(id: UUID(), tagID: "004", name: "MultiTool 2000", status: DeviceStatus.defect, icon: ObjectIcon.tool.rawValue), brand: "MultiTool", toolType: ToolType.mobilerKran)
    ]
    
    @Published var keys: [Key] = [
        Key(nfcTag: NFCTag(id: UUID(), tagID: "005", name: "KFZ-Schlüssel", status: DeviceStatus.loaned, icon: ObjectIcon.key.rawValue), keyNumber: "111-A11-2234"),
        Key(nfcTag: NFCTag(id: UUID(), tagID: "006", name: "Briefkastenschlüssel", status: DeviceStatus.available, icon: ObjectIcon.key.rawValue), keyNumber: "AB1-BC11-2234")
    ]
    
    

}

enum FilterOption {
    case all, available, loaned, defect, lost
}
