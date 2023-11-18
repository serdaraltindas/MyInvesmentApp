
import Foundation

/*
 CRUD FUNCTIONS
 Create
 Read
 Update
 Delete
 */

class ListViewModel : ObservableObject {
    @Published var items : [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    let itemsKey : String = "items_list"
    
    init() {
        getItems()
    }

    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        self.items = savedItems
    }
    
    //DeleteItem
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    //MoveItem
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    //AddItem
    func addItem(title : String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    //UpdateItem
    func updateItem(item:ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    //SaveItem
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
