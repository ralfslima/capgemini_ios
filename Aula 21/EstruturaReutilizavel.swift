// Importar SwiftUI
import SwiftUI

// Estrutura reutilizável
struct Card: View {
    // Variáveis
    let nome: String
    let idade: Int
    
    // Extrair primeira letra do nome
    var inicial: String {
        String(nome.prefix(1))
    }
    
    var body: some View {
        HStack {
            
            // Círculo e inicial do nome
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.4))
                    .frame(width: 50, height: 50)
                
                Text(inicial)
                    .font(.title2)
                    .foregroundColor(.white)
            }
            
            // Exibir nome e idade
            VStack {
                Text(nome)
                    .font(.headline)
                
                Text(String(idade))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            // Espaçador
            Spacer()
            
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(
            color: .black.opacity(0.3),
            radius: 5, x: 0, y: 2
        )
    }
}



// Estrutura base
struct EstruturaReutilizavel: View {
    var body: some View {
        
        VStack {
            Card(nome: "Fernada", idade: 28)
            Card(nome: "Gustavo", idade: 34)
        }
        .padding()
        
    }
}

// Pré-visualização
struct EstruturaReutilizavel_Previews: PreviewProvider {
    static var previews: some View {
        EstruturaReutilizavel()
    }
}
