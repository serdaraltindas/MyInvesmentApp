
import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                .bold()
                .foregroundColor(.green)
                .font(.title2)
            Text(item.title)
                .bold()
                .foregroundColor(.primary)
                .font(.headline)
            Spacer()
        }
        .padding(5)
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "Bugün 10 Adet INDES aldım.", isCompleted: true))
        ListRowView(item: ItemModel(title: "Bugün 10 Adet INDES aldım.", isCompleted: false))
    }
}
