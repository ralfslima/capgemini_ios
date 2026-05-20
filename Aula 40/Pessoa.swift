// Importar Foundation
import Foundation

// Modelo Pessoa
struct Pessoa: Codable, Identifiable {
    // Características
    let id: Int
    let nome: String
    let cidade: String
    
    // CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "codigo"
        case nome
        case cidade
    }
}









