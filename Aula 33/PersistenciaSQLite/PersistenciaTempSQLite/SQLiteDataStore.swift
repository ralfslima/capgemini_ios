import Foundation
import GRDB

class SQLiteDataStore: ObservableObject {
    @Published var itens: [PessoaSQLite] = []
    private var dbQueue: DatabaseQueue

    init() {
        do {
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                .appendingPathComponent("db.sqlite")
            dbQueue = try DatabaseQueue(path: path.path)
            
            try criarTabela()
            fetchDados()
        } catch {
            fatalError("Erro ao iniciar banco: \(error)")
        }
    }

    private func criarTabela() throws { // Usamos 'throws' na assinatura
        try dbQueue.write { db in
            try db.create(table: "pessoas", ifNotExists: true) { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("nome", .text).notNull()
                t.column("cidade", .text).notNull()
            }
        }
    }

    func adicionar(nome: String, cidade: String) {
        var nova = PessoaSQLite(nome: nome, cidade: cidade)
        try? dbQueue.write { db in
            try nova.insert(db)
        }
        fetchDados()
    }

    func fetchDados() {
        try? dbQueue.read { db in
            self.itens = try PessoaSQLite.fetchAll(db)
        }
    }
    
    func deletar(id: Int64) {
        do {
            try dbQueue.write { db in
                // O GRDB transforma isso em: DELETE FROM pessoas WHERE id = ?
                _ = try PessoaSQLite.filter(Column("id") == id).deleteAll(db)
            }
            fetchDados() // Atualiza a lista na tela imediatamente
        } catch {
            print("Erro ao deletar: \(error)")
        }
    }
}
