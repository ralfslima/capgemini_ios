// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio5: View {
    // Estados do Jogo
    @State private var numeroSecreto = Int.random(in: 1...100)
    @State private var palpiteUsuario: String = ""
    @State private var tentativas: Int = 0
    @State private var historicoDicas: String = "Tente adivinhar o número entre 1 e 100!"
    @State private var jogoFinalizado: Bool = false

    var body: some View {
        ZStack {
            // Fundo com Rectangle
            Rectangle()
                .fill(Color(white: 0.94))
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Elemento visual no topo
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 80, height: 80)
                    Text("?")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                }

                Text("Jogo da Adivinhação")
                    .font(.title).bold()

                HStack {
                    TextField("Seu palpite", text: $palpiteUsuario)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .disabled(jogoFinalizado)

                    Button(action: verificarPalpite) {
                        ZStack {
                            Capsule()
                                .fill(jogoFinalizado ? Color.gray : Color.blue)
                                .frame(width: 100, height: 40)
                            Text("Palpitar")
                                .foregroundColor(.white).bold()
                        }
                    }
                    .disabled(jogoFinalizado)
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("Histórico e Dicas:")
                        .font(.caption).bold()
                    
                    // Exibindo progresso no TextEditor
                    TextEditor(text: $historicoDicas)
                        .frame(height: 150)
                        .cornerRadius(10)
                }
                .padding()

                if jogoFinalizado {
                    Button(action: reiniciarJogo) {
                        ZStack {
                            Capsule()
                                .fill(Color.green)
                                .frame(height: 50)
                            Text("Jogar Novamente")
                                .foregroundColor(.white).bold()
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding()
        }
    }

    func verificarPalpite() {
        guard let palpite = Int(palpiteUsuario) else { return }
        tentativas += 1
        
        let diferenca = abs(palpite - numeroSecreto)
        var dicaAtual = ""

        if palpite == numeroSecreto {
            dicaAtual = "PARABÉNS! Você acertou em \(tentativas) tentativas."
            jogoFinalizado = true
        } else {
            if diferenca <= 5 {
                dicaAtual = "Muito perto"
            } else if diferenca <= 10 {
                dicaAtual = "Perto"
            } else if diferenca <= 15 {
                dicaAtual = "Longe"
            } else {
                dicaAtual = "Muito longe"
            }
            dicaAtual += " (Palpite: \(palpite))"
        }

        historicoDicas = dicaAtual + "\n" + historicoDicas
        palpiteUsuario = ""
    }

    func reiniciarJogo() {
        numeroSecreto = Int.random(in: 1...100)
        palpiteUsuario = ""
        tentativas = 0
        historicoDicas = "Novo jogo iniciado! Tente adivinhar o número."
        jogoFinalizado = false
    }
}


// Pré-visualização
struct Exercicio5_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio5()
    }
}
