import Foundation

final class DataManagers {
    static let notes = try! DataManager<Note>()
    static let todos = try! DataManager<ToDo>()
    static let events = try! DataManager<Event>()
}

final class DataManager<T: Codable & Equatable> {
    var autosave = true
    var data: [T] = [] {
        didSet {
            guard autosave, data != oldValue else { return }
            do {
                try save()
            } catch {
                print("Encountered error saving \(String(describing: T.self))")
            }
        }
    }
    
    var storagePath: URL = {
        let filename = String(describing: T.self)
        return FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent(filename)
            .appendingPathExtension("json")
    }()
    
    init() throws {
        try load()
    }
    
    func save() throws {
        let encodedData = try JSONEncoder().encode(data)
        try encodedData.write(to: storagePath)
        print("Saved!")
    }
    
    func load() throws {
        let data: Data
        do {
            data = try Data(contentsOf: storagePath)
        } catch {
            print("Encountered error loading data: \(error)")
            return
        }
        let oldAutosave = autosave
        defer { autosave = oldAutosave }
        autosave = false
        self.data = try JSONDecoder().decode([T].self, from: data)
    }
    
    func clear() {
        let oldAutosave = autosave
        autosave = true
        data = []
        autosave = oldAutosave
    }
}
