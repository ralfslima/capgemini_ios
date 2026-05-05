// Importar SwiftUI
import SwiftUI

// Estrutura principal
struct PersonView: View {
    
    // Importar as funcionalidades da camada ViewModel
    @StateObject var viewModel = PersonViewModel()
    
    // Body
    var body: some View {
        // Listagem de pessoas
        List{
            
            // Laço de repetição
            ForEach(viewModel.persons) { person in
            
                // Englobar informações verticalmente
                VStack(alignment: .leading) {
                    Text(person.name)
                        .font(.headline)
                    
                    Text(person.city)
                        .font(.subheadline)
                }
                
            }
            // Remover pessoas
            .onDelete(perform: viewModel.deletePerson)
            
        }
    }
}

// Pré-visualização
struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
