// Importar SwiftUI
import SwiftUI

// Estrutura
struct Abas: View {
    var body: some View {
        // Abas
        TabView {
            
            // ABA 1
            VStack {
                Text("PRIMEIRA ABA")
                .font(.custom("Vartigo", size: 50))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red.opacity(0.5))
            
            // ABA 2
            VStack {
                Text("SEGUNDA ABA")
                    .font(.custom("PIXEL CRASH TRIAL", size: 50))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.5))
            
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}

// Pré-visualização
struct Abas_Previews: PreviewProvider {
    static var previews: some View {
        Abas()
    }
}
