// Importar SwiftUI
import SwiftUI

// Estrutura
struct Conceito: View {
    
    // Enums de temas
    enum Tema: String, CaseIterable {
        case azul
        case verde
        case amarelo
        case vermelho
    }
    
    // Função para retornar a cor (Color)
    func corDoTema(_ tema: Tema) -> Color {
        switch tema {
            case .azul:
            return .blue
            
            case .verde:
            return .green
            
            case .amarelo:
            return .yellow
            
            case .vermelho:
            return .red
        }
    }
    
    // Definir a cor de fundo do retângulo
    @AppStorage("temaSelecionado")
    var temaSelecionado: Tema = .azul
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
        
            // Listar botões contendo os temas (cores)
            //ForEach([Tema.azul, Tema.verde, Tema.amarelo, Tema.vermelho], id: \.self) {}
            
            ForEach(Tema.allCases, id: \.self) { tema in
                
                // Botão
                Button {
                    temaSelecionado = tema
                } label: {
                    Text(tema.rawValue.capitalized)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(corDoTema(tema))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            } // Fim do ForEach
            
            // Espaçamento
            Spacer()
            
            // Retângulo com a cor selecionada
            RoundedRectangle(cornerRadius: 20)
                .fill(corDoTema(temaSelecionado))
                .frame(height: 200)
            
        } // Fim VStack
        .padding()
    }
}
