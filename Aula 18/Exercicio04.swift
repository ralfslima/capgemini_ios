// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio04: View {
    @State private var textoUsuario: String = ""
    @State private var resultado: String = ""

    var body: some View {
        ZStack {
            // Fundo
            Rectangle()
                .fill(Color(white: 0.96))
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Detector de Palíndromos")
                    .font(.title2).bold()

                VStack(alignment: .leading) {
                    Text("Digite sua palavra ou frase:")
                        .font(.caption)
                    
                    // Usando TextEditor conforme solicitado
                    TextEditor(text: $textoUsuario)
                        .frame(height: 100)
                        .cornerRadius(8)
                }
                .padding()

                Button(action: verificarPalindromo) {
                    ZStack {
                        Capsule()
                            .fill(Color.orange)
                            .frame(height: 50)
                        Text("Verificar")
                            .foregroundColor(.white).bold()
                    }
                }
                .padding(.horizontal)

                // Área de Resultado
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(height: 80)
                    
                    Text(resultado)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding()

                Spacer()
            }
            .padding()
        }
    }

    func verificarPalindromo() {
        // Remove espaços, pontuação e transforma em minúsculo para comparar
        let textoLimpo = textoUsuario
            .lowercased()
            .filter { $0.isLetter || $0.isNumber }
        
        if textoLimpo.isEmpty {
            resultado = "Por favor, digite algo."
            return
        }

        // Inverte a string e compara
        let textoInvertido = String(textoLimpo.reversed())

        if textoLimpo == textoInvertido {
            resultado = "✅ É um palíndromo!"
        } else {
            resultado = "❌ Não é um palíndromo."
        }
    }
}

// Pré-visualização
struct Exercicio04_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio04()
    }
}
