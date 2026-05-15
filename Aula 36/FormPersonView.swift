// Importar SwiftUI
import SwiftUI

// Estrutura principal
struct FormPersonView: View {
    
    // Referência responsável por: cadastrar, alterar e remover
    @Environment(\.managedObjectContext)
    private var viewContext
    
    // Referência responsável pelo fechamanto do FormPersonView
    @Environment(\.dismiss)
    private var dismiss
    
    // Referência Pessoa para cadastrar ou alterar
    var person: Person?
    
    // Armazenar nome e cidade do TextField
    @State private var name = ""
    @State private var city = ""
    
    // Função para efetuar o cadastro ou alteração
    private func salvar() {
        
        // Dados atuais da pessoa
        let currentPerson = person ?? Person(context: viewContext)
        
        // Verificar se existe id
        if person == nil {
            currentPerson.id = UUID()
        }
        
        // Atualizar o nome e a cidade
        currentPerson.name = name
        currentPerson.city = city
        
        // Efetuar o cadastro ou alteração
        try? viewContext.save()
        //do {
        //    try viewContext.save()
        //} catch {
        //    print("Falha ao cadastrar ou alterar")
        //}
        
    }
    
    // Body
    var body: some View {
        
        // Formulário
        Form {
        
            // Campo para armazenar o nome
            TextField("Nome", text: $name)
            
            // Campo para armazenar a cidade
            TextField("Cidade", text: $city)
            
            // Botão para salvar (cadastrar ou alterar)
            Button {
                // Executar a função para cadastrar ou alterar
                salvar()
                
                // Fechar o formulário
                dismiss()
            } label: {
                Text("Salvar")
            }
            
        } // Término do formulário
        .navigationTitle(person == nil ? "Cadastrar" : "Editar")
        .onAppear{
            
            // Verificar se foi disponibilizada uma pessoa
            if let p = person {
                
                // Manipular o nome da pessoa
                name = p.name ?? ""
                
                // Manipular a cidade da pessoa
                city = p.city ?? ""
                
            }
        }
        
        
    }
    
}
