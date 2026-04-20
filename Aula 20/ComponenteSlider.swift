// Importar SwiftUI
import SwiftUI

// Estrutura
struct ComponenteSlider: View {
    
    // Variável para armazenar o valor do slider
    @State var valor: Double = 20.0
    
    var body: some View {
        VStack {
            Text("Valor: \(valor)")
                .font(.system(size: valor))
            
            Slider(value: $valor, in: 10...50)
        }
    }
}

// Pré-visualização
struct ComponenteSlider_Previews: PreviewProvider {
    static var previews: some View {
        ComponenteSlider()
    }
}
