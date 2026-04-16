// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio01: View {
    @State private var nome: String = ""
    @State private var nota1: String = ""
    @State private var nota2: String = ""
    @State private var nota3: String = ""
    @State private var resultado: String = ""

    var body: some View {
        ZStack {

            VStack(spacing: 20) {
                Text("Exercício 01")
                    .font(.title).bold()

                VStack(alignment: .leading, spacing: 10) {
                    TextField("Nome do aluno", text: $nome)
                        .textFieldStyle(.roundedBorder)

                    HStack {
                        TextField("Nota 1", text: $nota1)
                        TextField("Nota 2", text: $nota2)
                        TextField("Nota 3", text: $nota3)
                    }
                    .textFieldStyle(.roundedBorder)
                }
                .padding()

                Button(action: {
                    let n1 = Double(nota1) ?? 0
                    let n2 = Double(nota2) ?? 0
                    let n3 = Double(nota3) ?? 0
                    let media = (n1 + n2 + n3) / 3
                    let situacao = media >= 7 ? "Aprovado" : "Reprovado"
                    
                    resultado = "Aluno: \(nome)\nMédia: \(String(format: "%.1f", media))\nSituação: \(situacao)"
                }) {
                    ZStack {
                        Capsule()
                            .frame(height: 50)
                            .foregroundColor(.blue)
                        Text("Calcular")
                            .foregroundColor(.white).bold()
                    }
                }
                .padding(.horizontal)

                // Área de exibição do resultado usando TextEditor
                VStack(alignment: .leading) {
                    Text("Resultado:")
                        .font(.caption)
                    TextEditor(text: $resultado)
                        .frame(height: 100)
                        .cornerRadius(8)
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

// Pré-visualização
struct Exercicio01_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio01()
    }
}
