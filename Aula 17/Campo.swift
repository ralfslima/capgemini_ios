// Importar SwiftUI
import SwiftUI

// Estrutura
struct Campo: View {
    
    // Variável para armazenar o texto
    @State var texto = ""
    
    var body: some View {
        
        VStack {
            // 1º Exemplo
            Text(texto)
           
            TextField("Digite algo", text: $texto)
                .padding(20)
                .textFieldStyle(.roundedBorder)
            
            // 2º Exemplo
            TextField("Digite algo", text: $texto)
                .padding(20)
                .overlay(
                    Capsule().stroke(Color.red, lineWidth: 2)
                )
                .padding(20)
            
            // 3º Exemplo
            TextField("Digite algo", text: $texto)
                .padding(.all)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2)
                )
                .padding(.horizontal)
            
            // 4º Exemplo
            TextField("Digite algo", text: $texto)
                .padding(.all)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.yellow),
                    alignment: .bottom
                )
                .padding(.horizontal)
            
            // 5º Exemplo
            TextEditor(text: $texto)
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.3))
                .frame(height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2)
                )
                .padding(.horizontal)
            
            // 6º Exemplo
            SecureField("Digite algo", text: $texto)
                .padding(20)
                .overlay(
                    Capsule().stroke(Color.red, lineWidth: 2)
                )
                .padding(20)
            
        
        }
        
    }
}

// Pré-visualização
struct Campo_Previews: PreviewProvider {
    static var previews: some View {
        Campo()
    }
}
