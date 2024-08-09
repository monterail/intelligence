import SQLite

public class IntelligenceStorage {
  var onUpdated: (() -> Void)?

  public func attachListener(onUpdated: @escaping () -> Void) {
    self.onUpdated = onUpdated
  }
  
  private func getDbPath() -> String {
    var applicationDirectory = URL.documentsDirectory
    applicationDirectory.append(component: "intelligence.sqlite3")
    return applicationDirectory.absoluteString
  }
  
  private func getDb() throws -> Connection {
    return try Connection(
      getDbPath(),
      readonly: false
    )
  }
  
  private func getEntitiesTable(db: Connection) throws -> Table {
    let table = Table("entities")
    
    let id = SQLite.Expression<Int64>("id")
    let externalId = SQLite.Expression<String>("externalId")
    let representation = SQLite.Expression<String>("representation")
    
    try db.run(table.create(ifNotExists: true) { t in
      t.column(id, primaryKey: true)
      t.column(externalId)
      t.column(representation)
    })
    return table
  }
  
  public func set(items: [(id: String, representation: String)] ) {
    do {
      let db = try getDb()
      let entitiesTable = try getEntitiesTable(db: db)
      
      try db.run(entitiesTable.delete())
      
      let externalId = SQLite.Expression<String>("externalId")
      let representation = SQLite.Expression<String>("representation")
      
      for item in items {
        try db.run(entitiesTable.insert(
          externalId <- item.id,
          representation <- item.representation
        ))
      }
    } catch {
      print("Unable to set entities for intelligence: \(error)")
    }
    if let onUpdated = onUpdated {
      onUpdated()
    }
  }
  
  public func get() -> [(id: String, representation: String)] {
    do {
      let db = try getDb()
      let entitiesTable = try getEntitiesTable(db: db)
      
      let externalId = SQLite.Expression<String>("externalId")
      let representation = SQLite.Expression<String>("representation")
      var entities: [(id: String, representation: String)] = []
      for entity in try db.prepare(entitiesTable) {
        entities.append((
          id: entity[externalId],
          representation: entity[representation]
        ))
      }
      return entities
    } catch {
      print("Unable to list entities for intelligence")
      return []
    }
  }
  
  public func get(for identifiers: [String]) -> [(id: String, representation: String)] {
    do {
      let db = try getDb()
      let entitiesTable = try getEntitiesTable(db: db)
      
      let externalId = SQLite.Expression<String>("externalId")
      let representation = SQLite.Expression<String>("representation")
      var entities: [(id: String, representation: String)] = []
      for entity in try db.prepare(entitiesTable.filter(identifiers.contains(externalId))) {
        entities.append((
          id: entity[externalId],
          representation: entity[representation]
        ))
      }
      return entities
    } catch {
      print("Unable to list entities for intelligence")
      return []
    }
  }
}
