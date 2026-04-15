// Importar SwiftUI
import SwiftUI

// Estrutura
struct Alternar: View {
    
    // Variável lógica
    @State var lampadaAcesa = false
    
    var body: some View {
        
        // Grupo para alinhar verticalmente
        VStack {
            
            // Status da lâmpada
            Text("Status da lâmpada: \(String(lampadaAcesa))")
            
            // Toggle
            Toggle(isOn: $lampadaAcesa) {
                Text(lampadaAcesa ? "Lâmpada ligada" : "Lâmpada desligada")
            }
            .tint(Color.yellow)
            .frame(width: 250, height: 100)
            
        }
        
        
    }
}

// Pré-visualização
struct Alternar_Previews: PreviewProvider {
    static var previews: some View {
        Alternar()
    }
}
