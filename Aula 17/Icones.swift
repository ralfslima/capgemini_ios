// Importar SwiftUI
import SwiftUI

// Estrutura
struct Icones: View {
    var body: some View {
        Image(systemName: "star")
            .font(.system(size: 200))
            .foregroundColor(.yellow)
    }
}

// Pré-visualização
struct Icones_Previews: PreviewProvider {
    static var previews: some View {
        Icones()
    }
}
