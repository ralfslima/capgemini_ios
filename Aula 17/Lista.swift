// Importar SwiftUI
import SwiftUI

// Estrutura
struct Lista: View {
    
    // Vetor de nomes
    let nomes = ["Alice", "Douglas", "Fernanda", "Renato", "Alice"]
    
    // Modelo (Struct) - Pessoa
    struct Pessoa: Identifiable {
        var id: UUID = UUID()
        var nome: String
        var idade: Int
    }
    
    // Vetor de pessoas
    let pessoas = [
        Pessoa(nome: "Alice",    idade: 22),
        Pessoa(nome: "Douglas",  idade: 34),
        Pessoa(nome: "Fernanda", idade: 38)
    ]
    
    
    var body: some View {
        
        VStack{
            
            // 1ª Lista
            List(nomes, id: \.self) {
                nome in Text(nome)
            }
            .listStyle(.plain)
            
            // 2ª Lista - Índices
            List(nomes.indices, id: \.self) {
                indice in Text("\(indice) - \(nomes[indice])")
            }
            
            // 3ª Lista - Objetos
            List(pessoas) {
                p in Text("\(p.nome) - \(p.idade)")
            }
            
        }
        
    }
}

// Pré-visualização
struct Lista_Previews: PreviewProvider {
    static var previews: some View {
        Lista()
    }
}
