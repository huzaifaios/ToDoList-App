//
//  ListView.swift
//  TodoList
//
//  Created by M.Huzaifa on 19/04/2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack{
            if listViewModel.items .isEmpty {
                NoitemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                        
                        
                        
                            .onTapGesture {
                                withAnimation(.spring()){
                                    listViewModel.updateCheckmark(item: item)
                                }
                            }
                        
                        
                        
                        
                    }
                    // onDelete Func which is in the listViewModel
                    .onDelete(perform: listViewModel.deleteItem)
                    // onMove func which is in the listViewModel
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddButtonView())
            )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}



