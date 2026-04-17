// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio8: View {
    // Estado para controlar o tema (false = Claro, true = Escuro)
    @State private var modoEscuro: Bool = false

    // Definição de cores dinâmicas baseadas no estado
    var corFundo: Color {
        modoEscuro ? Color(white: 0.15) : Color(white: 0.94)
    }
    
    var corTexto: Color {
        modoEscuro ? .white : .black
    }
    
    var corBotao: Color {
        modoEscuro ? .yellow : .indigo
    }

    var body: some View {
        ZStack {
            // Fundo Dinâmico
            Rectangle()
                .fill(corFundo)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // Elemento visual no topo (Ícone que muda com o tema)
                ZStack {
                    Circle()
                        .fill(corBotao)
                        .frame(width: 80, height: 80)
                    Image(systemName: modoEscuro ? "moon.stars.fill" : "sun.max.fill")
                        .font(.largeTitle)
                        .foregroundColor(modoEscuro ? .black : .white)
                }

                VStack(spacing: 10) {
                    Text("Alternador de Tema")
                        .font(.title).bold()
                        .foregroundColor(corTexto)
                    
                    Text("O tema atual é: \(modoEscuro ? "Escuro" : "Claro")")
                        .foregroundColor(corTexto.opacity(0.7))
                }

                // Botão de Alternância
                Button(action: {
                    withAnimation(.easeInOut) { // Transição suave
                        modoEscuro.toggle()
                    }
                }) {
                    ZStack {
                        Capsule()
                            .fill(corBotao)
                            .frame(width: 200, height: 50)
                        
                        Text(modoEscuro ? "Mudar para Claro" : "Mudar para Escuro")
                            .foregroundColor(modoEscuro ? .black : .white)
                            .bold()
                    }
                }
                
                // Exemplo de como outros elementos se adaptariam
                RoundedRectangle(cornerRadius: 15)
                    .fill(modoEscuro ? Color(white: 0.25) : Color.white)
                    .frame(height: 100)
                    .overlay(
                        Text("Este card também muda de cor!")
                            .foregroundColor(corTexto)
                    )
                    .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 50)
        }
    }
}

// Pré-visualização
struct Exercicio8_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio8()
    }
}
