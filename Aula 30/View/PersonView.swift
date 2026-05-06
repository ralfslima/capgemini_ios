// Importar SwiftUI
import SwiftUI

// Estrutura principal
struct PersonView: View {
    
    // Importar as funcionalidades da camada ViewModel
    @StateObject var viewModel = PersonViewModel()
    
    // Visibilidade da propriedade sheet (Exibir ou ocultar folha)
    @State var showSheet = false
    
    // Verificar se haverá um cadastro ou edição
    @State var editPerson: Person?
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
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
                    // Remover pessoas
                    .swipeActions(edge: .trailing) {
                        Button {
                            
                            if let index = viewModel.persons.firstIndex(where: { $0.id == person.id }) {
                                viewModel.deletePerson(at: IndexSet(integer: index))
                            }
                            
                        } label: {
                            Label ("Remover", systemImage: "trash")
                        }
                        .tint(.orange)
                    }
                    // Alterar pessoas
                    .swipeActions(edge: .leading) {
                        Button {
                            editPerson = person
                            showSheet = true
                        } label: {
                            Label ("Alterar", systemImage: "pencil")
                        }
                        .tint(.blue)
                    }
                    
                }
                // Remover pessoas
                //.onDelete(perform: viewModel.deletePerson)
                
            } // Término da lista
            
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
            
        } // NavigationStack
        // Disponibilizar a propriedade sheet
        .sheet(isPresented: $showSheet) {
            PersonFormView(viewModel: viewModel, editPerson: editPerson)
        }
        
    } // body
} // struct

// Estrutura para exibir uma folha (Sheet)
struct PersonFormView: View {
    
    // Referência para fechar a folha
    @Environment(\.dismiss) var dismiss
    
    // ViewModel
    @ObservedObject var viewModel: PersonViewModel
    
    // Obter a pessoa que terá seus dados alterados
    var editPerson: Person?
    
    // States
    @State var name: String = ""
    @State var city: String = ""
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            // Formulário
            Form {
                TextField("Nome",   text: $name)
                TextField("Cidade", text: $city)
            }
            
            // Características do NavigationStack
            .navigationTitle(editPerson == nil ? "Cadastrar" : "Alterar")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    
                    if let person = editPerson {
                        Button("Alterar") {
                            viewModel.updatePerson(person: person, name: name, city: city)
                            dismiss()
                        }
                        .disabled(name.isEmpty || city.isEmpty)
                    } else {
                        Button("Cadastrar") {
                            viewModel.addPerson(name: name, city: city)
                            dismiss()
                        }
                        .disabled(name.isEmpty || city.isEmpty)
                    } // Finaliza o if
                    
                } // Finaliza o ToolbarItem
            } // Finaliza o Toolbar
            
            // Ao carregar o formulário
            .onAppear {
                if let person = editPerson {
                    name = person.name
                    city = person.city
                }
            }
            
        } // Finaliza o NavigationStack
        
        
    }
    
}









// Pré-visualização
struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
