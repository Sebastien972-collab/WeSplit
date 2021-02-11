//
//  ContentView.swift
//  WeSplit
//
//  Created by DAGUIN Sébastien on 26/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var montantAddition = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15 , 20, 25, 0]
    
   
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let montantDeAddition = Double(montantAddition) ?? 0
        let tipValue = montantDeAddition / 100 * tipSelection
        let montantTotal = montantDeAddition + tipValue
        let montantParPersonne = montantTotal / peopleCount
        return montantParPersonne
    }
    
    
    var body: some View {
        NavigationView {
            Form{
                Section(header : Text("Saisir un montant et le nombre de personne")){
                    TextField("Montant", text: $montantAddition).keyboardType(.decimalPad)
                    
                    Picker("Nombre de personnes  ", selection: $numberOfPeople){
                        ForEach(2..<99){
                            Text("\($0) personnes")
                        }
                    }
                }
                Section(header:Text("Quel pourcentage de pourboire voulez-vous laisser ?") ){
                    
                    Picker("Pourcentage de pourboire", selection : $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header : Text("Montant total :")){
                   
                    let tipSelection = Double(tipPercentages[tipPercentage])
                    let montantDeAddition = Double(montantAddition) ?? 0
                    let tipValue = montantDeAddition / 100 * tipSelection
                    let montantTotal = montantDeAddition + tipValue
                    
                    Text("\(montantTotal, specifier: "%.2f")")
                }
                Section(header: Text("Le montant par personne ")){
                    
                    Text(" \(totalPerPerson, specifier: "%.2f")")
                    
                }
            }
            .navigationBarTitle("Votre addition")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
