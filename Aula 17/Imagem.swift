// Importar SwiftUI
import SwiftUI

// Estrutura
struct Imagem: View {
    var body: some View {
        
        Image("swift")
            .resizable()
            .frame(width: 100, height: 100)
        
    }
}

// Pré-visualização
struct Imagem_Previews: PreviewProvider {
    static var previews: some View {
        Imagem()
    }
}
