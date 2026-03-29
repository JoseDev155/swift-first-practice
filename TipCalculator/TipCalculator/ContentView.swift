//
//  ContentView.swift
//  TipCalculator
//
//  Created by Jose Ramos on 13/3/26.
//

import SwiftUI

struct ContentView: View {
    // VARIABLES DE ESTADO: Almacenan datos que el usuario puede cambiar
    @State private var montoCuenta: String = ""
    @State private var porcentajeSeleccionado = 15.0
    @State private var numeroPersonas = 1.0
    
    // CONSTANTES Y OPERADORES: Lógica de cálculo
    var totalIndividual: Double {
        // Operador de coalescencia nula (??) para evitar errores si el texto está vacío
        let cuenta = Double(montoCuenta) ?? 0.0
        
        // Operadores de multiplicación (*) y división (/)
        let montoPropina = cuenta * (porcentajeSeleccionado / 100)
        
        // Operador de suma (+)
        let granTotal = cuenta + montoPropina
        
        // Operador de división (/) para repartir la cuenta
        return granTotal / numeroPersonas
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Calculadora de Gastos")
                .font(.title)
                .fontWeight(.bold)
            VStack(alignment: .leading) {
                Text("Monto de la factura:")
                    .font(.caption)
                    .foregroundColor(.gray)
                TextField("Ej: 150.00", text: $montoCuenta)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            VStack {
                Text("Propina: \(Int(porcentajeSeleccionado))%")
                Slider(value: $porcentajeSeleccionado, in: 0...30, step: 5)
                    .accentColor(.blue)
            }
            .padding(.horizontal)
            
            VStack {
                Text("Dividir entre: \(Int(numeroPersonas)) personas")
                Slider(value: $numeroPersonas, in: 1...10, step: 1)
                    .accentColor(.green)
            }
            .padding(.horizontal)
            
            Divider()
            
            VStack {
                Text("CADA PERSONA PAGA:")
                    .font(.headline)
                Text("$\(totalIndividual, specifier: "%.2f")")
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}
