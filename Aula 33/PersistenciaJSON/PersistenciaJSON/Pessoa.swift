import SwiftUI

// Modelo
struct PessoaJSON: Codable, Identifiable {
    var id = UUID()
    var nome: String
    var cidade: String
}
