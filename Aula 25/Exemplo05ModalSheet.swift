// Importar SwiftUI
import SwiftUI

// Estrutura do modal
struct MeuModal: View {
    
    // Referência para fechar o modal
    @Environment(\.dismiss) var fechar
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
            
            // Texto
            Text("Olá! Modal em funcionamento.")
                .font(.largeTitle)
            
            // Botão para fechar o modal
            Button("Fechar modal") {
                fechar()
            }
            
        }
        
    }
    
}

// Estrutura principal
struct Exemplo05ModalSheet: View {
    
    // State
    @State var modal = false
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
            
            // Botão para exibir o modal
            Button("Exibir modal") {
                modal = true
            }
            
        }
        .sheet(isPresented: $modal) {
            MeuModal()
        }
        
    }
}

// Pré-visualização
struct Exemplo05ModalSheet_Previews: PreviewProvider {
    static var previews: some View {
        Exemplo05ModalSheet()
    }
}
