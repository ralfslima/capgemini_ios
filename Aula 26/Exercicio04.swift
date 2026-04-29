import SwiftUI

// Modelo
struct Cartao: Identifiable {
    let id = UUID()
    var banco: String
    var bandeira: String
    var finalNumero: String
    var cor: Color
    var limite: Double
    var vencimento: String
}

// View Principal
struct Exercicio04: View {
    @State private var cartoes: [Cartao] = [
        Cartao(banco: "Nubank", bandeira: "Mastercard", finalNumero: "4452", cor: .purple, limite: 5000.0, vencimento: "15/05"),
        Cartao(banco: "Itaú", bandeira: "Visa", finalNumero: "8890", cor: .orange, limite: 12000.0, vencimento: "10/05"),
        Cartao(banco: "Inter", bandeira: "Mastercard", finalNumero: "1234", cor: .orange.opacity(0.8), limite: 3500.0, vencimento: "20/05")
    ]
    
    // Estado para controlar qual cartão foi selecionado para o modal
    @State private var cartaoSelecionado: Cartao?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(cartoes) { cartao in
                        // O Card visual
                        CardView(cartao: cartao)
                            .onTapGesture {
                                cartaoSelecionado = cartao // Define o cartão para abrir o modal
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Meus Cartões")
            // O Modal que observa a mudança da variável 'cartaoSelecionado'
            .sheet(item: $cartaoSelecionado) { item in
                DetalheCartaoModal(cartao: item)
            }
        }
    }
}

// Componente de Card (Aparência na Lista)
struct CardView: View {
    let cartao: Cartao
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(cartao.banco).bold()
                Spacer()
                Image(systemName: "creditcard.fill")
            }
            .font(.title3)
            
            Spacer()
            
            HStack {
                Text("**** **** **** \(cartao.finalNumero)")
                Spacer()
                Text(cartao.bandeira).italic()
            }
        }
        .padding()
        .foregroundColor(.white)
        .frame(height: 180)
        .background(cartao.cor)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// Tela Modal (O que aparece no Sheet)
struct DetalheCartaoModal: View {
    @Environment(\.dismiss) var dismiss // Para fechar o modal
    let cartao: Cartao
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Miniatura do cartão no topo
                CardView(cartao: cartao)
                    .frame(height: 200)
                    .padding(.top)
                
                List {
                    Section("Informações da Conta") {
                        // CORREÇÃO: Passando o Text formatado dentro do bloco, sem o parâmetro 'value'
                        LabeledContent("Limite Total") {
                            Text("R$ \(cartao.limite, specifier: "%.2f")")
                        }
                        
                        LabeledContent("Vencimento") {
                            Text(cartao.vencimento)
                        }
                        
                        LabeledContent("Status") {
                            Text("Ativo").foregroundColor(.green)
                        }
                    }
                    
                    Section {
                        Button("Bloquear Cartão", role: .destructive) { }
                        Button("Gerar Cartão Virtual") { }
                    }
                }
            }
            .navigationTitle("Detalhes do Cartão")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // CORREÇÃO: Usando navigationBarTrailing para maior compatibilidade
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Fechar") {
                        dismiss()
                    }
                }
            }
        }
    }
}

// Pré-visualização
struct Exercicio04_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio04()
    }
}
