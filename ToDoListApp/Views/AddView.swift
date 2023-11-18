import SwiftUI
import UIKit

struct AddView: View {
    @State var textFieldText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewmodel : ListViewModel
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    TextField("The stock you want to add...", text: $textFieldText)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .bold()
                        .background(Color(UIColor.secondarySystemBackground))
                        .opacity(1)
                        .cornerRadius(10)
                        .padding(.vertical)
                    
                    Button(action: saveButtonPressed, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.primary)
                            .cornerRadius(10)
                            .font(.headline)
                    })
                }
                .padding(15)
            }
            .navigationTitle("Add Investment 📝")
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
            .bold()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.primary)
                        .bold()
                        .font(.title3)
                }
        })
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewmodel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Tuşlara biraz daha basabilirsek süper olur! 🥶"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
