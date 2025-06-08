//
//  replacingNil.swift
//  PaperLess
//
//  Created by Tom Salih on 22.04.25.
//

import SwiftUI

extension Binding {
    func replacingNil<Wrapped>(or defaultValue: Wrapped) -> Binding<Wrapped>
        where Value == Wrapped? {
            Binding<Wrapped>(
                get: { self.wrappedValue ?? defaultValue },
                set: { self.wrappedValue = $0 }
            )
        }
        
    
}
