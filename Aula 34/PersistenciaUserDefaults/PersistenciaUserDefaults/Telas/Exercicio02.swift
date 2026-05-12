// Importar SwiftUI
import SwiftUI

// Modelo da página
struct Pagina {
    let titulo: String
    let descricao: String
    let imagem: String
    let cor: Color
}

// Estrutura
struct Exercicio02: View {
    
    // Página atual
    @AppStorage("paginaAtual")
    var paginaAtual = 0
    
    // Conteúdo das páginas
    let paginas: [Pagina] = [
        
        Pagina(
            titulo: "Capítulo 1",
            descricao: "Era uma vez um reino distante...",
            imagem: "castle",
            cor: .blue
        ),
        
        Pagina(
            titulo: "Capítulo 2",
            descricao: "O guerreiro iniciou sua aventura.",
            imagem: "figure.walk",
            cor: .green
        ),
        
        Pagina(
            titulo: "Capítulo 3",
            descricao: "Uma criatura apareceu na floresta.",
            imagem: "tortoise.fill",
            cor: .orange
        ),
        
        Pagina(
            titulo: "Fim",
            descricao: "Fim da história.",
            imagem: "star.fill",
            cor: .purple
        )
    ]
    
    var body: some View {
        
        // Obter as informações da página atual
        let pagina = paginas[paginaAtual]
        
        // VStack
        VStack(spacing: 30) {
            
            // Número da página
            Text("Página \(paginaAtual + 1)")
                .font(.headline)
            
            Spacer()
            
            // Ícone
            Image(systemName: pagina.imagem)
                .font(.system(size: 100))
                .foregroundColor(pagina.cor)
            
            // Título
            Text(pagina.titulo)
                .font(.largeTitle)
                .bold()
            
            // Descrição
            Text(pagina.descricao)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            // Botões
            HStack {
                
                // Voltar
                Button {
                    
                    if paginaAtual > 0 {
                        paginaAtual -= 1
                    }
                    
                } label: {
                    Text("Voltar")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(paginaAtual == 0)
                
                // Próxima
                Button {
                    
                    if paginaAtual < paginas.count - 1 {
                        paginaAtual += 1
                    }
                    
                } label: {
                    Text("Próxima")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(paginaAtual == paginas.count - 1)
            }
            
        }
        // Configurações do VStack (espaçamento e animação)
        .padding()
        .animation(.easeInOut, value: paginaAtual)
    }
}
