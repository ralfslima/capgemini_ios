// Importar SwiftUI
import SwiftUI

// View responsável por renderizar uma única linha na lista de pessoas.
// Ao isolar esta View, ganhamos performance e facilidade de leitura na View principal.
struct PersonRowView: View {
    
    // O modelo de dados que esta linha representa.
    let person: Person
    
    // Usamos closures para avisar a View "pai" que uma ação ocorreu.
    let onEdit: () -> Void
    let onDelete: () -> Void

    // Body
    var body: some View {
        // Layout principal da célula
        VStack(alignment: .leading) {
            Text(person.name)
                .font(.headline)
            
            Text(person.city)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        
        // Ação da direita para a esquerda (Trailing)
        .swipeActions(edge: .trailing) {
            // O role .destructive faz com que o iOS entenda que esta ação apaga dados
            Button(role: .destructive, action: onDelete) {
                Label("Remover", systemImage: "trash")
            }
            .tint(.orange)
        }
        
        // Ação da esquerda para a direita (Leading)
        .swipeActions(edge: .leading) {
            Button(action: onEdit) {
                Label("Alterar", systemImage: "pencil")
            }
            .tint(.blue)
        }
    }
}
