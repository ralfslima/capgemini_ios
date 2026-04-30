// Importar SwiftUI
import SwiftUI

// Criar um modelo de perfil
struct ModeloPerfil: Identifiable, Hashable {
    let id: Int
    let nome: String
    let cidade: String
}

// Rotas
enum Rotas: Hashable {
    case inicio
    case sobre
    case perfil(ModeloPerfil)
}

// Gerenciador de rotas
class Roteador: ObservableObject {
    
    @Published var caminho = NavigationPath()
    
    // Acessar tela/rota específica
    func navegar(_ rota: Rotas) {
        caminho.append(rota)
    }
    
    // Função para voltar (back)
    func voltar() {
        caminho.removeLast()
    }
    
}

// Telas
struct Sobre: View {
    
    // Referenciar o roteador
    @EnvironmentObject var roteador: Roteador
    
    // Body
    var body: some View {
        
        // Texto
        Text("Sobre")
            .font(.largeTitle)
        
        // Botões
        Button("Perfil"){
            let obj = ModeloPerfil(id: 1, nome: "Alice", cidade: "São Paulo")
            
            roteador.navegar(.perfil(obj))
        }
        
        Button("Voltar"){
            roteador.voltar()
        }
        
    }
    
}

struct Perfil: View {
    
    // Referenciar o roteador
    @EnvironmentObject var roteador: Roteador
    
    // Objeto do tipo ModeloPerfil
    let obj: ModeloPerfil
    
    // Body
    var body: some View {
        
        // Textos
        Text("Perfil")
            .font(.largeTitle)
        
        Text("Identificador: \(obj.id)")
            .font(.headline)
        
        Text("Nome: \(obj.nome)")
            .font(.headline)
        
        Text("Cidade: \(obj.cidade)")
            .font(.headline)
        
        // Botões
        Button("Sobre"){
            roteador.navegar(.sobre)
        }
        
        Button("Voltar"){
            roteador.voltar()
        }
        
    }
    
}

struct Inicio: View {
    
    // Referenciar o roteador
    @EnvironmentObject var roteador: Roteador
    
    // Body
    var body: some View {
        
        // Texto
        Text("Início")
            .font(.largeTitle)
        
        // Botões
        Button("Sobre"){
            roteador.navegar(.sobre)
        }
        
        Button("Perfil"){
            let obj = ModeloPerfil(id: 1, nome: "Alice", cidade: "São Paulo")
            
            roteador.navegar(.perfil(obj))
        }
    
    }
    
}

// Estrutura principal
struct Exemplo06Rotas: View {
    
    // Objeto de estado
    @StateObject var roteador = Roteador()
    
    // Body
    var body: some View {
        
        // Estrutura (pilhas)
        NavigationStack(path: $roteador.caminho) {
            
            // Exibir a tela inicial
            Inicio()
                .navigationDestination(for: Rotas.self) {
                    rota in construirTela(rota)
                }
            
        }
        .environmentObject(roteador)
        
    }
    
    // ViewBuilder
    @ViewBuilder
    func construirTela(_ rota: Rotas) -> some View {
        switch rota {
            case .inicio: Inicio()
            case .sobre: Sobre()
            case .perfil(let perfil): Perfil(obj: perfil)
        }
    }
    
    
}

// Pré-visualização
struct Exemplo06Rotas_Previews: PreviewProvider {
    static var previews: some View {
        Exemplo06Rotas()
    }
}
