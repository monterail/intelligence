import SQLite

public struct IntelligenceStorage {
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
}
