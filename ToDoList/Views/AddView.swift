//
//  AddView.swift
//  ToDoList
//
//  Created by Subham  on 07/06/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var TextFieldtext : String = ""
    
    @State var AlertTitle : String = ""
    @State var ShowAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Write your new todo...", text: $TextFieldtext)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action:SaveButtonPressed , label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding()
                
        }.navigationTitle("Add an Item")
            .alert(isPresented: $ShowAlert, content: {
                getAlert()
            })
    }
    func SaveButtonPressed() {
        if !TextFieldtext.isEmpty{
            listViewModel.addItem(title: TextFieldtext)
            TextFieldtext = ""
            presentationMode.wrappedValue.dismiss()
        }
        else{
            AlertTitle = "Please add a Valid Todo item"
            ShowAlert.toggle()
        }
    }
    func getAlert() -> Alert {
        return Alert(title: Text(AlertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
