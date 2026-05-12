// Importar SwiftUI
import SwiftUI

// Estrutura
struct Exercicio01: View {
    
    // AppStorage
    @AppStorage("emailSalvo")
    var emailSalvo: String = ""
    
    // States
    @State private var email = ""
    @State private var senha = ""
    @State private var salvarEmail = false
    
    // Body
    var body: some View {
        
        // VStack
        VStack(spacing: 20) {
            
            // Título
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            // Campo de e-mail
            TextField("Digite seu e-mail", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            // Campo de senha
            SecureField("Digite sua senha", text: $senha)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            // Toggle
            Toggle("Salvar e-mail", isOn: $salvarEmail)
            
            // Botão
            Button {
                
                // Verificar toggle
                if (salvarEmail) {
                    emailSalvo = email
                } else {
                    emailSalvo = ""
                }
                
            } label: {
                Text("Entrar")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // Mostrar e-mail salvo
            if !emailSalvo.isEmpty {
                
                Text("E-mail salvo:")
                    .font(.headline)
                
                Text(emailSalvo)
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
        } // Fim VStack
        .padding()
        
        // Ao abrir a tela
        .onAppear {
            
            // Recuperar e-mail salvo
            email = emailSalvo
            
            // Ativar toggle se houver e-mail
            salvarEmail = !emailSalvo.isEmpty
        }
    }
}
