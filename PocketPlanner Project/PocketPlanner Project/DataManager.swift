import Foundation

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
        let data = try Data(contentsOf: storagePath)
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
