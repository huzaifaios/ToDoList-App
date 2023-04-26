//
//  AddButtonView.swift
//  TodoList
//
//  Created by M.Huzaifa on 19/04/2023.
//

import SwiftUI

struct AddButtonView: View {
    
    @EnvironmentObject var listVieModel: ListViewModel
    @State var textFieldText: String = ""
    @Environment(\.presentationMode) var Mode
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type title here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            }
            .padding()
            
        }
        .navigationTitle("Add item ✏️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
        
    }
    func saveButtonPressed() {
        
        if textisAppropriate() {
            
            listVieModel.addItem(title: textFieldText)
            Mode.wrappedValue.dismiss()
        }
    }
    
    func textisAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your Todo List title must be at least 3 Character long! 😳😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddButtonView()
        }
        .environmentObject(ListViewModel())
    }
}
