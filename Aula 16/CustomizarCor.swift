// Importar SwuiftUI
import SwiftUI

// Estrutura
struct CustomizarCor: View {
    var body: some View {
        
        Rectangle()
            .fill(Color(red:32/255, green:201/255, blue:142/255))
        
            .frame(width: 300, height: 200)
        
    }
}

// Pré-visualização
struct CustomizarCor_Previews: PreviewProvider {
    static var previews: some View {
        CustomizarCor()
    }
}
