// Importar SwiftUI
import SwiftUI

struct PersonFormView: View {
    // Permite fechar a View atual (a folha/sheet) programaticamente
    @Environment(\.dismiss) var dismiss
    
    // Recebe a ViewModel que gerencia a lógica de dados.
    // @ObservedObject indica que esta View deve observar mudanças nesse objeto.
    @ObservedObject var viewModel: PersonViewModel
    
    // Se esta propriedade for preenchida, a View entra em modo de "Edição".
    // Se for nula (nil), a View assume o modo de "Cadastro".
    var editPerson: Person?

    // Armazena temporariamente o que o usuário digita antes de salvar.
    @State private var name: String = ""
    @State private var city: String = ""

    // Propriedade computada que centraliza a regra de negócio do formulário.
    // Evita repetição de código no modificador .disabled()
    private var isFormInvalid: Bool {
        name.isEmpty || city.isEmpty
    }

    // Body
    var body: some View {
        NavigationStack {
            Form {
                // Binding ($) permite que o SwiftUI atualize o @State conforme o usuário digita
                TextField("Nome", text: $name)
                TextField("Cidade", text: $city)
            }
            // Define o título dinamicamente com base na presença ou não de um objeto para edição
            .navigationTitle(editPerson == nil ? "Cadastrar" : "Alterar")
            .toolbar {
                // Botão de Cancelar no canto padrão do sistema para cancelamento (esquerda no iOS)
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                
                // Botão de Confirmação no canto padrão (direita no iOS)
                ToolbarItem(placement: .confirmationAction) {
                    Button(editPerson == nil ? "Cadastrar" : "Salvar") {
                        save()
                    }
                    .disabled(isFormInvalid) // Impede o salvamento de dados vazios
                }
            }
            // Ciclo de Vida: Quando a tela aparece, preenche os campos se for uma edição
            .onAppear {
                if let person = editPerson {
                    name = person.name
                    city = person.city
                }
            }
        }
    }

    // Centraliza a lógica de salvamento para decidir entre criar um novo registro ou atualizar um existente.
    private func save() {
        if let person = editPerson {
            viewModel.updatePerson(person: person, name: name, city: city)
        } else {
            viewModel.addPerson(name: name, city: city)
        }
        
        // Fecha a View após a operação ser concluída com sucesso
        dismiss()
    }
}
