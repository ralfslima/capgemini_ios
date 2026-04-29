// Importar SwiftUI
import SwiftUI

// Estrutura principal
struct Exemplo04ProgrammaticNavigation: View {
    
    // Lista de países
    let paises = ["Brasil", "Argentina", "Portugal", "Estados Unidos", "Canadá", "Japão"]
    
    // State
    @State var paisSelecionado: String? = nil
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
            
            // Condicional - Tela
            if let pais = paisSelecionado {
                
                // VStack
                VStack {
                    
                    // Exibir o nome do país
                    Text(pais)
                        .font(.largeTitle)
                    
                    // Botão para voltar
                    Button("Voltar") {
                        paisSelecionado = nil
                    }
                    
                }
                
            } else {
                
                // Listar países
                List(paises, id: \.self) {
                    pais in Button(pais) {
                        paisSelecionado = pais
                    }
                }
                
            }
            
        }
        
    }
}

// Pré-visualização
struct Exemplo04ProgrammaticNavigation_Previews: PreviewProvider {
    static var previews: some View {
        Exemplo04ProgrammaticNavigation()
    }
}
