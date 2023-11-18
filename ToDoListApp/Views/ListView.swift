import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
//    let backgroundColor = Color("ThirdColor")
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
            .navigationTitle("My Invesments 📋")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                leading: EditButton()
                    .foregroundColor(.primary)
                    .bold()
                    .font(.title3),
                trailing: NavigationLink("Add", destination: AddView()))
                .foregroundColor(.primary)
                .bold()
            .font(.title3)
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}


