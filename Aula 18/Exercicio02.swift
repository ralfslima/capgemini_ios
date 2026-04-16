// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio02: View {
    @State private var nomeProduto: String = ""
    @State private var valorString: String = ""
    @State private var usouPix: Bool = false
    @State private var resultado: String = ""

    var body: some View {
        ZStack {
            // Fundo
            Rectangle()
                .fill(Color(white: 0.97))
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Topo visual com Shape
                ZStack {
                    Rectangle()
                        .fill(Color.purple)
                        .frame(height: 40)
                    Text("Checkout de Vendas")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top)

                VStack(alignment: .leading, spacing: 15) {
                    TextField("Nome do Produto", text: $nomeProduto)
                        .textFieldStyle(.roundedBorder)

                    TextField("Valor (R$)", text: $valorString)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)

                    HStack {
                        Text("Pagamento via Pix?")
                        Toggle("", isOn: $usouPix)
                            .labelsHidden()
                    }
                }
                .padding()

                Button(action: {
                    let valorOriginal = Double(valorString.replacingOccurrences(of: ",", with: ".")) ?? 0
                    var valorFinal = valorOriginal
                    var mensagemDesconto = "Sem desconto aplicado."

                    // Lógica: Se >= 1000 E Pix, aplica 5%
                    if valorOriginal >= 1000 && usouPix {
                        valorFinal = valorOriginal * 0.95
                        mensagemDesconto = "Desconto de 5% aplicado!"
                    }

                    resultado = """
                    Produto: \(nomeProduto)
                    Valor Original: R$ \(String(format: "%.2f", valorOriginal))
                    Pagou com Pix: \(usouPix ? "Sim" : "Não")
                    \(mensagemDesconto)
                    Total a Pagar: R$ \(String(format: "%.2f", valorFinal))
                    """
                }) {
                    ZStack {
                        Capsule()
                            .fill(Color.purple)
                            .frame(height: 50)
                        Text("Processar Compra")
                            .foregroundColor(.white).bold()
                    }
                }
                .padding(.horizontal)

                VStack(alignment: .leading) {
                    Text("Resumo da Transação:")
                        .font(.caption).bold()
                    TextEditor(text: $resultado)
                        .frame(height: 120)
                        .border(Color.gray.opacity(0.2), width: 1)
                }
                .padding()

                Spacer()
            }
        }
    }
}

// Pré-visualização
struct Exercicio02_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio02()
    }
}
