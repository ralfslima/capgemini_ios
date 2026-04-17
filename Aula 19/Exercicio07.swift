// Importar SwiftUI
import SwiftUI

//Modelo de dados para a Pessoa
struct Pessoa: Identifiable {
    let id = UUID()
    let nome: String
    let idade: String
}

// Estrutura
struct Exercicio7: View {
    // Estados
    @State private var nomeInput: String = ""
    @State private var idadeInput: String = ""
    @State private var listaPessoas: [Pessoa] = [] // Vetor que armazenará os cadastros

    var body: some View {
        ZStack {
            // Fundo padrão
            Rectangle()
                .fill(Color(white: 0.94))
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Elemento visual no topo
                ZStack {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 80, height: 80)
                    Image(systemName: "person.badge.plus")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }

                Text("Cadastro de Pessoas")
                    .font(.title).bold()

                // Formulário de Entrada
                VStack(spacing: 10) {
                    TextField("Nome completo", text: $nomeInput)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Idade", text: $idadeInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    
                    Button(action: cadastrarPessoa) {
                        ZStack {
                            Capsule()
                                .fill(Color.purple)
                                .frame(height: 45)
                            Text("Cadastrar")
                                .foregroundColor(.white).bold()
                        }
                    }
                }
                .padding(.horizontal)

                // Lista de Cadastrados
                VStack(alignment: .leading) {
                    Text("Pessoas Cadastradas:")
                        .font(.caption).bold()
                        .padding(.leading)
                    
                    List {
                        ForEach(listaPessoas) { pessoa in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(pessoa.nome)
                                        .font(.headline)
                                    Text("\(pessoa.idade) anos")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                
                                // Botão Remover
                                Button(action: { removerPessoa(pessoa: pessoa) }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                                .buttonStyle(BorderlessButtonStyle()) // Importante para botões dentro de List
                            }
                        }
                    }
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
        }
    }

    // Função para adicionar ao vetor
    func cadastrarPessoa() {
        if !nomeInput.isEmpty && !idadeInput.isEmpty {
            let novaPessoa = Pessoa(nome: nomeInput, idade: idadeInput)
            listaPessoas.append(novaPessoa)
            
            // Limpa os campos
            nomeInput = ""
            idadeInput = ""
            fecharTeclado()
        }
    }

    // Função para remover do vetor
    func removerPessoa(pessoa: Pessoa) {
        listaPessoas.removeAll { $0.id == pessoa.id }
    }

    func fecharTeclado() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// Pré-visualização
struct Exercicio7_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio7()
    }
}
