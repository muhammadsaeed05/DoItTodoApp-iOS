//
//  AddView.swift
//  TodoListAppSwiftUI
//
//  Created by Muhammad Saeed on 31/07/2023.
//

import SwiftUI


struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    
    @State var alertTitle = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add a new item", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame( height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        
                })
                
            }.padding(16)
            
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(alertTitle, isPresented: $showAlert) {
            Text("Ok")
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be 3 characters long 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
    }
}
