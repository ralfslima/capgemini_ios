import Foundation
import GRDB

struct PessoaSQLite: Codable, Identifiable, FetchableRecord, MutablePersistableRecord {
    var id: Int64? // SQLite usa IDs incrementais por padrão
    var nome: String
    var cidade: String

    // Define o nome da tabela
    static var databaseTableName = "pessoas"
}
