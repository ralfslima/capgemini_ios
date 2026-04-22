//
//  Temp.swift
//  UI
//
//  Created by Ralf Schweder de Lima on 19/04/26.
//

import SwiftUI

// View principal
struct EstruturaReutilizavel2: View {
    
    // Componente reutilizável que representa uma linha com título + toggle
    struct ComponenteReutilizado: View {
        let titulo: String              // Texto exibido
        @Binding var estaLigado: Bool  // Binding para controlar o estado do toggle
        
        var body: some View {
            HStack {
                Text(titulo)
                    .font(.headline)
                
                Spacer() // Empurra o toggle para a direita
            
                // Toggle sem label (apenas o botão)
                Toggle("", isOn: $estaLigado)
                    .labelsHidden()
            }
            .padding()
            .background(
                Color.white
                    .cornerRadius(10) // Borda arredondada
            )
            .shadow(radius: 2) // Sombra leve
        }
    }
    
    // Modelo de dados para cada item de configuração
    struct ItemConfig: Identifiable {
        let id = UUID()     // Identificador único (necessário para ForEach)
        let nome: String    // Nome da configuração
        var status: Bool    // Estado (ligado/desligado)
    }
    
    // Lista de configurações (estado da View)
    @State var configuracoes = [
        ItemConfig(nome: "Notificações", status: true),
        ItemConfig(nome: "Modo Escuro", status: false),
        ItemConfig(nome: "Wi-Fi", status: true),
        ItemConfig(nome: "Bluetooth", status: false)
    ]
    
    // Variável não utilizada (pode ser removida)
    @State var teste = true
    
    var body: some View {
        
        VStack {
            
            // Título da tela
            Text("Configurações Avançadas")
                .font(.title2)
                .bold()
                .padding()
            
            // Lista de componentes com binding direto (permite alterar o estado)
            ForEach($configuracoes) { $item in
                ComponenteReutilizado(
                    titulo: item.nome,
                    estaLigado: $item.status
                )
            }
            
            Spacer()
            
            // Exibição do estado atual das configurações
            ForEach(configuracoes) { item in
                HStack {
                    Text(item.nome)
                    
                    Spacer()
                    
                    Text(item.status ? "ATIVO" : "INATIVO")
                        .foregroundColor(item.status ? .green : .red)
                        .bold()
                }
            }
            .padding()
            
        }
    }
}

// Preview para visualização no Xcode
struct EstruturaReutilizavel2_Previews: PreviewProvider {
    static var previews: some View {
        EstruturaReutilizavel2()
    }
}
