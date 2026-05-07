// Importar SwiftUI
import SwiftUI

// Estrutura
struct PersonView: View {
    
    // ViewModel
    @StateObject private var viewModel = PersonViewModel()
    
    // ShowSheet
    @State private var showSheet = false
    
    // Verificar se a pessoa será alterada
    @State private var editPerson: Person?
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // List
            List {
                
                // Laço de repetição
                ForEach(viewModel.persons) { person in
                    
                    // Utilizar o componente PersonRowView
                    PersonRowView(
                        person: person,
                        onEdit: {
                            editPerson = person
                            showSheet = true
                        },
                        onDelete: {
                            if let index = viewModel.persons.firstIndex(where: { $0.id == person.id }) {
                                viewModel.deletePerson(at: IndexSet(integer: index))
                            }
                        }
                    )
                }
            }
            
            // Configurações do NavigationStack
            .navigationTitle("Pessoas")
            .toolbar {
                Button {
                    editPerson = nil
                    showSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showSheet) {
                PersonFormView(viewModel: viewModel, editPerson: editPerson)
            }
        }
    }
}



// Pré-visualização
struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
