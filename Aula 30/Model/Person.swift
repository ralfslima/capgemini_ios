// Importar Foundation
import Foundation

// Estrutura
struct Person: Identifiable, Equatable {
    var id: UUID = UUID()
    var name: String
    var city: String
}
