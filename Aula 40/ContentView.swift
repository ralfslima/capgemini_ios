// Importar SwiftUI
import SwiftUI

// Estrutura
struct ContentView: View {
    
    // Referenciar arquivo PessoaViewModel
    @StateObject private var viewModel = PessoaViewModel()
    
    // States - Nome e Cidade
    @State private var nome = ""
    @State private var cidade = ""
    
    // Body
    var body: some View {
        
        // VStack para agrupar formulário + listagem
        VStack(spacing: 0) {
            
            // ***** FORMULÁRIO PARA CADASTRAR PESSOAS
            VStack {
                TextField("Nome", text: $nome)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Cidade", text: $cidade)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    // Função para cadastrar pessoas na API
                    viewModel.addPessoa(nome: nome, cidade: cidade)
                    
                    // Limpar os TextFields de nome e cidade
                    (nome, cidade) = ("", "")
                    //nome = ""
                    //cidade = ""
                } label: {
                    Text("Cadastrar")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            
            // ***** LISTAGEM DE PESSOAS
            // Lista
            List {
                // ForEach
                ForEach(viewModel.pessoas) { pessoa in
                    
                    // VStack
                    VStack(alignment: .leading) {
                        Text("Nome: \(pessoa.nome)")
                        Text("Cidade: \(pessoa.cidade)")
                    } // Término do VStack
                    
                } // Término do ForEach
                .onDelete {
                    viewModel.deletePessoa(codigo: viewModel.pessoas[$0.first!].id)
                }
                
            } // Término do List
            .onAppear(perform: viewModel.fetchPessoas)
            
        } // Término do VStack
        
    } // Término do Body
    
} // Término da estrutura (Struct)
