import SwiftUI

// Modelo de Dados
struct Aluno: Identifiable {
    let id = UUID()
    var nome: String
    var notas: [String: Double] // Matéria: Nota
    var faltas: Int
    var endereco: String
    var telefone: String
    
    // Propriedade computada para calcular a média geral
    var mediaGeral: Double {
        let soma = notas.values.reduce(0, +)
        return notas.isEmpty ? 0 : soma / Double(notas.count)
    }
}

// View Principal
struct Exercicio02: View {
    // Dados de exemplo
    @State private var alunos: [Aluno] = [
        Aluno(nome: "João Silva", notas: ["Matemática": 8.5, "Português": 7.0, "História": 9.0], faltas: 4, endereco: "Rua das Flores, 123", telefone: "(11) 99999-0000"),
        Aluno(nome: "Maria Souza", notas: ["Matemática": 6.0, "Português": 9.5, "História": 8.0], faltas: 12, endereco: "Av. Central, 500", telefone: "(11) 88888-1111")
    ]
    
    var body: some View {
        NavigationStack {
            List(alunos) { aluno in
                NavigationLink(destination: DetalheAlunoView(aluno: aluno)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(aluno.nome).font(.headline)
                            Text("Média Geral: \(aluno.mediaGeral, specifier: "%.1f")")
                                .font(.subheadline).foregroundColor(.secondary)
                        }
                        Spacer()
                        // Indicador rápido de frequência
                        Image(systemName: "circle.fill")
                            .foregroundColor(aluno.faltas > 10 ? .red : .green)
                            .font(.system(size: 10))
                    }
                }
            }
            .navigationTitle("Alunos")
        }
    }
}

// Tela de Detalhes
struct DetalheAlunoView: View {
    let aluno: Aluno
    
    var body: some View {
        List {
            Section("Desempenho Acadêmico") {
                ForEach(aluno.notas.sorted(by: { $0.key < $1.key }), id: \.key) { materia, nota in
                    LabeledContent(materia) {
                        Text("\(nota, specifier: "%.1f")")
                            .foregroundColor(nota >= 7 ? .blue : .red)
                    }
                }
                LabeledContent("Média Final") {
                    Text("\(aluno.mediaGeral, specifier: "%.1f")").bold()
                }
            }
            
            Section("Frequência") {
                HStack {
                    Text("Total de Faltas")
                    Spacer()
                    Text("\(aluno.faltas)")
                        .padding(.horizontal, 10)
                        .background(aluno.faltas > 10 ? Color.red : Color.gray.opacity(0.2))
                        .foregroundColor(aluno.faltas > 10 ? .white : .primary)
                        .cornerRadius(5)
                }
            }
            
            Section("Informações de Contato") {
                LabeledContent("Endereço", value: aluno.endereco)
                LabeledContent("Telefone", value: aluno.telefone)
            }
            
            Button(action: {
                print("Ligando para \(aluno.telefone)...")
            }) {
                Label("Entrar em Contato", systemImage: "phone.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .listRowBackground(Color.clear)
        }
        .navigationTitle(aluno.nome)
        .navigationBarTitleDisplayMode(.inline)
    }
}


// Pré-visualização
struct Exercicio02_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio02()
    }
}
