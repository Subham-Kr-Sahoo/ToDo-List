//
//  ListView.swift
//  ToDoList
//
//  Created by Subham  on 07/06/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoView().transition(AnyTransition.opacity.animation(.easeInOut))
            }else{
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.UpdateItem(item:item)
                                }
                            }
                    }.onDelete(perform:listViewModel.deleteItem)
                    .onMove(perform:listViewModel.MovingItem)
                }
                .listStyle(PlainListStyle())
            }
        }
            .navigationTitle("Todo List")
            .navigationBarItems(
                leading: EditButton(),
                trailing:NavigationLink("Add" , destination: {
                    AddView()
                }))
            
    }
}

#Preview {
    NavigationView{
        ListView()
    }.environmentObject(ListViewModel())
}

