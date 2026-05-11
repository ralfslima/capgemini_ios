// Importar SwiftUI
import SwiftUI

// Estrutura do componente
struct ContentView: View {
    
    // Variável responsável por gerenciar dados no SQLite
    @StateObject private var store = SQLiteDataStore()
    
    // Variáveis do app
    @State private var txtNome = ""
    @State private var txtCidade = ""
    
    // Body
    var body: some View {
        
        // Alinhamento de componentes na vertical
        NavigationStack {
            
            // Formulário
            Form {
                
                // Sessão de cadastro
                Section(header: Text("Cadastro SQLite")) {
                    
                    // Campos de texto
                    TextField("Nome", text: $txtNome)
                    TextField("Cidade", text: $txtCidade)
                    
                    // Botão para cadastrar
                    Button("Salvar no Banco") {
                        if !txtNome.isEmpty {
                            store.adicionar(nome: txtNome, cidade: txtCidade)
                            txtNome = ""; txtCidade = ""
                        }
                    }
                }

                // Sessão de listagem de dados
                Section(header: Text("Dados no SQLite")) {
                    List {
                        ForEach(store.itens) { pessoa in
                            VStack(alignment: .leading) {
                                Text(pessoa.nome).font(.headline)
                                Text(pessoa.cidade).font(.subheadline).foregroundColor(.gray)
                            }
                        }
                        .onDelete { indexSet in
                            // Percorre os itens selecionados para deleção
                            indexSet.forEach { index in
                                let pessoa = store.itens[index]
                                if let id = pessoa.id {
                                    store.deletar(id: id)
                                }
                            }
                        }
                    }
                }
            }
            
            // Título do NavigationStack
            .navigationTitle("Persistência: SQLite")
            
        } // NavigationStack
        
    } // Body
    
} // Struct
