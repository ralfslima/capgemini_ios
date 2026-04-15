// Importar SwuiftUI
import SwiftUI

// Estrutura do projeto
struct Botao: View {
    
    // Variável dinâmica (altera a visualização)
    @State var alerta: Bool = false
    
    var body: some View {
        
        Button("Clique aqui") { alerta = true }
            .padding(15)
            .background(Color.green)
            .cornerRadius(10)
            .foregroundColor(.white)
            .alert(
                "Título do meu alerta!",
                isPresented: $alerta
            ){
                Button("Ok", role: .cancel){}
            }
                message: {
                    Text("Hello World!")
                }
            
            
        
    }
}

// Pré-visualização
struct Botao_Previews: PreviewProvider {
    static var previews: some View {
        Botao()
    }
}
