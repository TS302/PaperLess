//
//  NFCViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 25.05.25.
//

import Foundation
import Combine

final class NFCTagViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var selectedSegment = 0
    @Published var showAddVehicle = false
    @Published var showAddTool = false
    @Published var showAddKey = false
    
    @Published var showEditVehicle = false
    @Published var showEditTool = false
    @Published var showEditKey = false
    @Published var filterOption: FilterOption = .all
}


