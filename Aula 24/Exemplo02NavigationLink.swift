// Importar SwiftUI
import SwiftUI

// Estrutura de Cidade (para gerar objetos)
struct Cidade: Identifiable {
    var id: Int
    var nome: String
    var estado: String
}

// Estrutura para exibir os dados da cidade (id, nome e estado)
struct InfoCidade: View {
    
    // Referêcia para obter um objeto do tipo Cidade
    let cidade : Cidade
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
            
            // Exibir nome da cidade
            Text(cidade.nome)
                .font(.largeTitle)
            
            // Exibir o nome do estado
            Text(cidade.estado)
                .font(.title)
            
            // Exibir o id da cidade
            Text(String(cidade.id))
                .font(.subheadline)
            
        }
        
    }
    
}

// Estrutura Hello World!
struct HelloWorld: View {
    var body: some View {
        Text("Hello World!")
    }
}

// Estrutura principal
struct Exemplo02NavigationLink: View {
    
    // Vetor
    let cidades = [
        Cidade(
            id: 1,
            nome: "Campinas",
            estado: "São Paulo"
        ),
        Cidade(
            id: 2,
            nome: "Nterói",
            estado: "Rio de Janeiro"
        ),
        Cidade(
            id: 3,
            nome: "Joinville",
            estado: "Santa Catarina"
        ),
        Cidade(
            id: 4,
            nome: "Bagé",
            estado: "Rio Grande do Sul"
        ),
        Cidade(
            id: 5,
            nome: "Caruaru",
            estado: "Pernambuco"
        ),
        Cidade(
            id: 6,
            nome: "Salvador",
            estado: "Bahia"
        ),
    ]
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // List
            List {
                
                // Cidades
                ForEach(cidades) {
        cidade in NavigationLink(cidade.nome) {
                        InfoCidade(cidade: cidade)
                    }
                }
        
                // NavigationLink
                NavigationLink("Clique aqui") {
                    HelloWorld()
                }
                
            }
        
        }
        .navigationTitle("Cidades")
        
    }
}

// Pré-visualização
struct Exemplo02NavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        Exemplo02NavigationLink()
    }
}
