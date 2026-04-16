// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio03: View {
    // Contadores de votos
    @State private var votosC1: Int = 0
    @State private var votosC2: Int = 0
    @State private var votosC3: Int = 0
    @State private var resultadoFinal: String = ""

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(white: 0.98))
                .ignoresSafeArea()

            VStack(spacing: 25) {
                Text("Sistema de Votação")
                    .font(.largeTitle).bold()
                
                // Área dos Candidatos
                HStack(spacing: 20) {
                    // Candidato 1
                    VStack {
                        Circle().fill(Color.blue).frame(width: 60)
                        Text("Cand. A")
                        Text("\(votosC1)").font(.title2).bold()
                        Button("Votar") { votosC1 += 1 }
                    }
                    
                    // Candidato 2
                    VStack {
                        Circle().fill(Color.red).frame(width: 60)
                        Text("Cand. B")
                        Text("\(votosC2)").font(.title2).bold()
                        Button("Votar") { votosC2 += 1 }
                    }
                    
                    // Candidato 3
                    VStack {
                        Circle().fill(Color.green).frame(width: 60)
                        Text("Cand. C")
                        Text("\(votosC3)").font(.title2).bold()
                        Button("Votar") { votosC3 += 1 }
                    }
                }
                .padding()

                // Botão Finalizar
                Button(action: finalizarVotacao) {
                    ZStack {
                        Capsule()
                            .fill(Color.black)
                            .frame(height: 50)
                        Text("Finalizar Votação")
                            .foregroundColor(.white).bold()
                    }
                }
                .padding(.horizontal, 40)

                // Relatório Final
                VStack(alignment: .leading) {
                    Text("Resultado:")
                        .font(.caption)
                    TextEditor(text: $resultadoFinal)
                        .frame(height: 120)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.2)))
                }
                .padding()
            }
        }
    }

    func finalizarVotacao() {
        let totais = [("Candidato A", votosC1), ("Candidato B", votosC2), ("Candidato C", votosC3)]
        let maiorVoto = max(votosC1, votosC2, votosC3)
        
        // Filtra quem teve a maior pontuação
        let vencedores = totais.filter { $0.1 == maiorVoto }

        if maiorVoto == 0 {
            resultadoFinal = "Nenhum voto registrado."
        } else if vencedores.count > 1 {
            let nomesEmpatados = vencedores.map { $0.0 }.joined(separator: " e ")
            resultadoFinal = "Empate entre \(nomesEmpatados).\nHaverá segundo turno!"
        } else {
            resultadoFinal = "Vencedor: \(vencedores[0].0)\nTotal de votos: \(vencedores[0].1)"
        }
    }
}

// Pré-visualização
struct Exercicio03_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio03()
    }
}
