// Importar SwiftUI
import SwiftUI

// Estrutura principal
struct Exemplo03TabView: View {
    var body: some View {
        
        // TabView
        TabView {
        
            // 1ª Aba
            Text("Home")
                .tabItem {
                    Label(
                        "Home",
                        systemImage: "house")
                }
            
            // 2ª Aba
            Text("Perfil")
                .tabItem {
                    Label(
                        "Perfil",
                        systemImage: "person")
                }
            
            // 3ª Aba
            Text("Suporte")
                .tabItem {
                    Label(
                        "Suporte",
                        systemImage: "message")
                }
            
        }
        
    }
}

// Pré-visualização
struct Exemplo03TabView_Previews: PreviewProvider {
    static var previews: some View {
        Exemplo03TabView()
    }
}
