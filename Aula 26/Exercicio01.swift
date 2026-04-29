import SwiftUI

// 1º Modelo de dados expandido
struct Fruta: Hashable, Identifiable {
    let id = UUID()
    let nome: String
    let calorias: Int
    let paisesProdutores: [String]
    let icone: String
}

// 2º Listagem de frutas
struct Exercicio01: View {
    let frutas = [
        Fruta(nome: "Maçã", calorias: 52, paisesProdutores: ["China", "EUA", "Turquia"], icone: "🍎"),
        Fruta(nome: "Banana", calorias: 89, paisesProdutores: ["Índia", "China", "Brasil"], icone: "🍌"),
        Fruta(nome: "Laranja", calorias: 47, paisesProdutores: ["Brasil", "China", "Índia"], icone: "🍊")
    ]
    
    var body: some View {
        NavigationStack {
            List(frutas) { fruta in
                // O valor passado para o destino é o objeto completo
                NavigationLink(value: fruta) {
                    HStack {
                        Text(fruta.icone)
                        Text(fruta.nome)
                    }
                }
            }
            .navigationTitle("Frutaria Global")
            .navigationDestination(for: Fruta.self) { fruta in
                DetalheFrutaView(fruta: fruta)
            }
        }
    }
}

// 3º Detalhes
struct DetalheFrutaView: View {
    let fruta: Fruta
    
    var body: some View {
        List {
            Section("Informações Nutricionais") {
                LabeledContent("Calorias (100g)", value: "\(fruta.calorias) kcal")
            }
            
            Section("Principais Produtores") {
                ForEach(fruta.paisesProdutores, id: \.self) { pais in
                    Label(pais, systemImage: "globe.americas.fill")
                }
            }
        }
        .navigationTitle(fruta.nome)
    }
}


// Pré-visualização
struct Exercicio01_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio01()
    }
}
