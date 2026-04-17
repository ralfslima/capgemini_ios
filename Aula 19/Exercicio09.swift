// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio9: View {
    // Estado para o input do usuário
    @State private var celsiusInput: String = ""

    // Variável computada que faz o cálculo em tempo real
    var fahrenheitResultado: String {
        if let celsius = Double(celsiusInput) {
            let resultado = (celsius * 9/5) + 32
            return String(format: "%.1f", resultado) + " °F"
        } else {
            return "---"
        }
    }

    var body: some View {
        ZStack {
            // Fundo padrão consistente
            Rectangle()
                .fill(Color(white: 0.94))
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // Elemento visual (Termômetro)
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 80, height: 80)
                    Image(systemName: "thermometer.medium")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }

                Text("Conversor de Temperatura")
                    .font(.title).bold()

                VStack(spacing: 15) {
                    Text("Graus Celsius (°C)")
                        .font(.caption).bold()
                        .foregroundColor(.gray)
                    
                    TextField("Ex: 32", text: $celsiusInput)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad) // Permite números com vírgula
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding(.horizontal, 50)
                }

                // Card de Resultado
                VStack(spacing: 10) {
                    Text("Equivale a:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(fahrenheitResultado)
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(.red)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                .padding(.horizontal)

                Spacer()
                
                Text("Cálculo: (C × 9/5) + 32")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(.top, 40)
        }
    }
}

// Pré-visualização
struct Exercicio9_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio9()
    }
}
