//
//  replacingNil.swift
//  PaperLess
//
//  Created by Tom Salih on 22.04.25.
//

import SwiftUI

extension Binding where Value == String? {
    func replacingNil(_ defaultValue: String) -> Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? defaultValue },
            set: { self.wrappedValue = $0 }
        )
    }
}
