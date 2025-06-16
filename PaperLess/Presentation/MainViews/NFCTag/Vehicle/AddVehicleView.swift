//
//  AddNFCTag.swift
//  PaperLess
//
//  Created by Tom Salih on 24.05.25.
//

import SwiftUI

struct AddVehicleView: View {
    @EnvironmentObject var vehicleViewModel: VehicleListViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Neues Fahrzeug")
                    .padding(.top, 20)
                    .font(.system(size: 30, weight: .black))
                    .modifier(TextFieldModi())
                    
            Spacer()
                Button {
                    vehicleViewModel.emptyNewVehicle()
                    dismiss()
                } label: {
                    Image(systemName: "x.circle.fill")
                        .padding(.top, 30)
                        .foregroundStyle(Color.error)
                }
            }
            .padding(.horizontal, 30)
            
            List {
                VehicleForm(vehicle: $vehicleViewModel.newVehicle, kmFormatter: Formatters.kmFormatter)
            }
            .modifier(ListStyle(title: ""))
            
            Button {
                vehicleViewModel.addVehicle(vehicle: vehicleViewModel.newVehicle)
                vehicleViewModel.emptyNewVehicle()
                dismiss()
            } label: {
                Text("Speichern")
                    .font(.callout)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.secondary)
                    .padding(10)
                    .background(Color.primary)
                    .cornerRadius(6)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
            }
        }
        .background(Color.secondary)
    }
}


#Preview {
    AddVehicleView()
        .environmentObject(VehicleListViewModel())
}
