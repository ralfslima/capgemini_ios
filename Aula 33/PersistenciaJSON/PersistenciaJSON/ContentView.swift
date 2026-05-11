// Importar SwiftUI
import SwiftUI

// Estrutura do componente
struct ContentView: View {
    
    // Variável responsável por gerenciar dados no formato JSON
    @StateObject private var store = JSONDataStore()
    
    // Variáveis do app
    @State private var txtNome = ""
    @State private var txtCidade = ""
    
    // Body
    var body: some View {
        
        // Alinhamento de componentes na vertical
        VStack {
            
            // NavigationView
            NavigationStack {
                
                // Formulário
                Form {
                    
                    // Sessão de cadastro
                    Section(header: Text("Cadastro")) {
                        
                        // Campos de texto
                        TextField("Nome", text: $txtNome)
                        TextField("Cidade", text: $txtCidade)
                        
                        // Botão para cadastrar
                        Button("Salvar Dados") {
                            if !txtNome.isEmpty {
                                store.adicionar(nome: txtNome, cidade: txtCidade)
                                txtNome = ""; txtCidade = ""
                            }
                        }
                    }

                    // Sessão de listagem de dados
                    Section(header: Text("Dados Salvos no JSON")) {
                        List(store.itens) { pessoa in
                            VStack(alignment: .leading) {
                                Text(pessoa.nome).font(.headline)
                                Text(pessoa.cidade).font(.subheadline).foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                // Título do NavigationStack
                .navigationTitle("Persistência: JSON")
                
            } // NavigationStack
            
        } // VStack
        
    } // Body
    
} // Struct
