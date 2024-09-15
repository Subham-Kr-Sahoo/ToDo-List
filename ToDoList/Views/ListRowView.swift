//
//  ListRowView.swift
//  ToDoList
//
//  Created by Subham  on 07/06/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName:item.isCompleted ? "checkmark.circle" : "circle" )
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical,8)
    }
}
var item1 = ItemModel(title: "First list", isCompleted: false)
var item2 = ItemModel(title: "Second item", isCompleted: true)
#Preview {
        ListRowView(item: item2)
}
