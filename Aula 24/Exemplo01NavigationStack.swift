// Importar SwiftUI
import SwiftUI

// Estrutura secundária
struct InfoLinguagem: View {
    // Referência para armazenar o nome da linguagem
    let nome: String
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
            
            // Texto
            Text("Linguagem: \(nome)")
                .font(.largeTitle)
                .bold()
        }
        
    }
}

// Estrutura principal
struct Exemplo01NavigationStack: View {
    
    // Vetor de linguagens
    let linguagens = ["Java", "Kotlin", "Python", "Swift"]
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // Listar as linguagens
            List(linguagens, id: \.self) {
                
                linguagem in NavigationLink(value: linguagem) {
                    Text(linguagem)
                }
                
            }
            .navigationTitle("Linguagem")
            .navigationDestination(for: String.self) {
                linguagemSelecionada in InfoLinguagem(nome: linguagemSelecionada)
            }
            
        }
        
    }
}









// Pré-visualização
struct Exemplo01NavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        Exemplo01NavigationStack()
    }
}
