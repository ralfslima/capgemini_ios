// Importar SwiftUI
import SwiftUI

// Estrutura
struct Visibilidade: View {
    
    @State var visivel = true
    
    var body: some View {
        
        VStack {
            
            //1º Exemplo - Hidden
            //Rectangle()
            //    .frame(width: 300, height: 150)
            //    .foregroundColor(.green)
            //    .hidden()
            
            //2º Exemplo - Condicional
            //if(visivel) {
            //    Rectangle()
            //        .frame(width: 300, height: 150)
            //        .foregroundColor(.green)
            //}
            
            //3º Exemplo - Opacidade
            Rectangle()
                .frame(width: 300, height: 150)
                .foregroundColor(.green)
                .opacity(visivel ? 1 : 0)
                .animation(
                    .linear(duration: 0.5), value: visivel
                )
            
            
            Button("Clique aqui"){
                visivel = !visivel
            }
            
        }
        
    }
}

// Pré-visualização
struct Visibilidade_Previews: PreviewProvider {
    static var previews: some View {
        Visibilidade()
    }
}
