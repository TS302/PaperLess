//
//  HomeViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 18.06.25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {

    @Published var selectedSegment = 0
    @Published var user: User = User(
        firstname: "Max",
        lastname: "Mustermann",
        email: "max@mustermann.de",
        password: "121212",
        isLoggedIn: true
    )
    @Published var isLoggedIn: Bool = true
    @Published var favoriteVehicles: [Vehicle] = []
    @Published var showAddDocument: Bool = false
    @Published var showAddNFC: Bool = false
    @Published var documentArray: [Document] = [
        Document(id: UUID(), title: "Mietvertrag", description: "Mietvertrag von der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Nebenkostenabrechnung", description: "Nebenkostenabrechnung für das Jahr 2024 der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Übergabeprotokoll", description: "Protokoll zur Wohnungsübergabe in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Kündigungsschreiben", description: "Kündigung des Mietverhältnisses für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Mängelliste", description: "Aufstellung von Mängeln in der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Einzugsermächtigung", description: "SEPA-Einzugsermächtigung für die Mietzahlungen der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Mieterhöhung", description: "Mitteilung zur Mieterhöhung für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Hausordnung", description: "Hausordnung für das Mehrfamilienhaus in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Wohnungsbewerbung", description: "Bewerbungsschreiben für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Betriebs- und Heizkostenabrechnung", description: "Abrechnung der Betriebs- und Heizkosten für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Wohnungsübergabebericht", description: "Bericht zur Übergabe der Wohnung in der Musterstraße 121 in Tübingen"),
        
    ]
}
