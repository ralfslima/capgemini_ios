// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio6: View {
    // Estados
    @State private var numeroInput: String = ""
    @State private var resultadoTabuada: String = "Insira um número para ver a tabuada"
    
    var body: some View {
        ZStack {
            // Fundo consistente com o Exercicio 5
            Rectangle()
                .fill(Color(white: 0.94))
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Elemento visual no topo (Ícone de multiplicação)
                ZStack {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 80, height: 80)
                    Text("×")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                }

                Text("Gerador de Tabuada")
                    .font(.title).bold()

                HStack {
                    TextField("Digite um número", text: $numeroInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)

                    Button(action: gerarTabuada) {
                        ZStack {
                            Capsule()
                                .fill(Color.orange)
                                .frame(width: 120, height: 40)
                            Text("Gerar")
                                .foregroundColor(.white).bold()
                        }
                    }
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("Resultado:")
                        .font(.caption).bold()
                    
                    // Exibindo a tabuada
                    TextEditor(text: .constant(resultadoTabuada)) // .constant torna apenas leitura
                        .frame(height: 250)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                }
                .padding()

                Button(action: limpar) {
                    Text("Limpar")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
        }
    }

    func gerarTabuada() {
        // Valida se o input é um número
        guard let numero = Int(numeroInput) else {
            resultadoTabuada = "Por favor, digite um número válido."
            return
        }
        
        var tabela = "Tabuada do \(numero):\n\n"
        
        for i in 1...10 {
            let resultado = numero * i
            tabela += "\(numero) × \(i) = \(resultado)\n"
        }
        
        resultadoTabuada = tabela
        
        // Fecha o teclado após gerar
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func limpar() {
        numeroInput = ""
        resultadoTabuada = "Insira um número para ver a tabuada"
    }
}

// Pré-visualização
struct Exercicio6_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio6()
    }
}
