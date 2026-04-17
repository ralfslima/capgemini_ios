// Importar SwiftUI
import SwiftUI

// 1. Modelo da Tarefa
struct Tarefa: Identifiable {
    let id = UUID()
    var descricao: String
    var concluida: Bool = false
}

// Estrutura
struct Exercicio10: View {
    // Estados
    @State private var novaTarefa: String = ""
    @State private var listaTarefas: [Tarefa] = []

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
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                    Image(systemName: "checklist")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }

                Text("Minhas Tarefas")
                    .font(.title).bold()

                // Campo de entrada e botão Adicionar
                HStack {
                    TextField("Nova tarefa...", text: $novaTarefa)
                        .textFieldStyle(.roundedBorder)

                    Button(action: adicionarTarefa) {
                        ZStack {
                            Capsule()
                                .fill(Color.blue)
                                .frame(width: 100, height: 40)
                            Text("Add")
                                .foregroundColor(.white).bold()
                        }
                    }
                }
                .padding(.horizontal)

                // Lista de Tarefas
                List {
                    ForEach(listaTarefas) { tarefa in
                        HStack {
                            // Botão de Concluir (Círculo de Check)
                            Button(action: { alternarConcluida(tarefa: tarefa) }) {
                                Image(systemName: tarefa.concluida ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(tarefa.concluida ? .green : .gray)
                                    .font(.title3)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            // Texto da Tarefa (com efeito visual se concluída)
                            Text(tarefa.descricao)
                                .strikethrough(tarefa.concluida) // Risca o texto
                                .foregroundColor(tarefa.concluida ? .gray : .primary)
                                .opacity(tarefa.concluida ? 0.6 : 1.0)

                            Spacer()

                            // Botão Remover
                            Button(action: { removerTarefa(tarefa: tarefa) }) {
                                Image(systemName: "xmark.bin")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .cornerRadius(15)
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
        }
    }

    // Funções de Lógica
    func adicionarTarefa() {
        if !novaTarefa.trimmingCharacters(in: .whitespaces).isEmpty {
            let tarefa = Tarefa(descricao: novaTarefa)
            listaTarefas.append(tarefa)
            novaTarefa = ""
            fecharTeclado()
        }
    }

    func alternarConcluida(tarefa: Tarefa) {
        if let index = listaTarefas.firstIndex(where: { $0.id == tarefa.id }) {
            listaTarefas[index].concluida.toggle()
        }
    }

    func removerTarefa(tarefa: Tarefa) {
        listaTarefas.removeAll { $0.id == tarefa.id }
    }

    func fecharTeclado() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// Pré-visualização
struct Exercicio10_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio10()
    }
}
