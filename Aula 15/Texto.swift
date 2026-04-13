// Importar o SwiftUI
import SwiftUI

// Estrutura do projeto (Tela)
struct Texto: View {
    
    var body: some View {
        
        VStack{
            Text("Olá mundo!")
            
            Spacer()
            
            Text("Aprendendo SwiftUI")
                //.font(.largeTitle)
                .font(.custom("Arial", size: 30))
                .foregroundColor(.indigo)
                .bold()
                .italic()
                //.underline()
                .kerning(2)
                .shadow(
                    color: .black.opacity(0.5),
                    radius: 5, x: 10, y: 10
                    //radius: 5
                )
                .padding(20)
                .border(Color.green, width: 4)
        }
         
    }
    
}

// Pré-visualizar do projeto (Tela)
struct Texto_Previews: PreviewProvider {
    static var previews: some View {
        Texto()
    }
}
