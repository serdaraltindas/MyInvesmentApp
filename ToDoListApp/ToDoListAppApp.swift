import SwiftUI
/*
 |MVVM ARCHITECTURE|
 
 MODEL - Data Point
 VİEW - UI
 VİEWMODEL - Manages Models For View
 */

@main
struct ToDoListAppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
