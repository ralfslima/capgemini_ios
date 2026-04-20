// Importar SwiftUI
import SwiftUI

// Estrutura
struct Seletor: View {
    
    // Opções de seleção
    let opcoes = [
        "Opção 1",
        "Opção 2",
        "Opção 3"
    ]
    
    // Armazenar opção selecionada
    @State var opcaoSelecionada = "Opção 1"
    
    var body: some View {
        VStack {
            
            Text("A opção selecionada é: \(opcaoSelecionada)")
            
            Picker(
                "Selecionar opção",
                selection: $opcaoSelecionada)
            {
                ForEach(opcoes, id: \.self) {
                    valorOpcao in Text(valorOpcao)
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
        }
    }
}

// Pré-visualização
struct Seletor_Previews: PreviewProvider {
    static var previews: some View {
        Seletor()
    }
}
