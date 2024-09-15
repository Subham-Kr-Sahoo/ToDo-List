//
//  NoView.swift
//  ToDoList
//
//  Created by Subham  on 07/06/24.
//

import SwiftUI

struct NoView: View {
    @State var animate : Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 30){
                Text("There is no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Add your first item in the todo list")
                NavigationLink(
                    destination: AddView(),
                    label:{
                        Text("Add Something")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.red : Color.accentColor)
                            .cornerRadius(10)
                    }).padding(.horizontal, animate ? 30:50)
                    .scaleEffect(animate ? 1.2 : 1.0)
                    .offset(y : animate ? 7 : 0)
                    .shadow(color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0 , y: animate ? 30 : 10       )
            }.padding(40)
                .onAppear(perform: {
                    addAnimation()
                })
        }.frame(maxWidth: .infinity,maxHeight:.infinity)
    }
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline:.now()+1.5){
            withAnimation(
                Animation
                    .easeInOut(duration:2)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}
#Preview {
    NavigationView{
        NoView().navigationTitle("Title")
    }
}
