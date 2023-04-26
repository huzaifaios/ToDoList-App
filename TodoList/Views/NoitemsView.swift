//
//  NoitemsView.swift
//  TodoList
//
//  Created by M.Huzaifa on 20/04/2023.
//

import SwiftUI

struct NoitemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the add button to add items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddButtonView()) {
                    HStack{
                        
                        Image(systemName: "plus")
                        Text("Add something! 🥳")
                    }
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? Color("AccentColor") : Color("SecondaryAccentColor") )
                    .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: animate ? Color("AccentColor").opacity(0.7) : Color("SecondaryAccentColor").opacity(0.7) ,
                    radius: animate ? 30 : 10,
                        x: 0,
                    y: animate ? 50 : 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // for only Animation
    func addAnimation() {
        // make sure we are not doing animation twice!!
        // guard make sure animate is not true(animate is false) because if its true we are gonna get out of this function and we are not gonna go through DispatchQueue.
        guard !animate else { return }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoitemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            
            NoitemsView()
                .navigationTitle("Ttile")
        }
    }
}
