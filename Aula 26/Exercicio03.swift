import SwiftUI

// Modelos
enum Segmento: String, CaseIterable, Identifiable {
    case alimentos = "Alimentos", eletronicos = "Eletrônicos", casa = "Casa"
    var id: String { self.rawValue }
}

struct Produto: Identifiable {
    let id = UUID()
    var nome: String
    var marca: String
    var segmento: Segmento
    var valor: Double
}

// MARK: - View Principal
struct Exercicio03: View {
    @State private var produtos: [Produto] = []

    var body: some View {
        TabView {
            ProdutosView(produtos: $produtos)
                .tabItem { Label("Estoque", systemImage: "archivebox") }

            EstatisticasView(produtos: produtos)
                .tabItem { Label("Relatórios", systemImage: "chart.line.uptrend.xyaxis") }

            SobreView()
                .tabItem { Label("Sobre", systemImage: "person.text.rectangle") }
        }
    }
}

// 1ª Aba: Cadastro e Listagem
struct ProdutosView: View {
    @Binding var produtos: [Produto]
    
    @State private var nome = ""
    @State private var marca = ""
    @State private var segmento: Segmento = .alimentos
    @State private var valor = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Cadastrar Novo Item") {
                    TextField("Nome do Produto", text: $nome)
                    TextField("Marca", text: $marca)
                    
                    Picker("Segmento", selection: $segmento) {
                        ForEach(Segmento.allCases) { seg in
                            Text(seg.rawValue).tag(seg)
                        }
                    }
                    
                    TextField("Preço Unitário", text: $valor)
                        .keyboardType(.decimalPad)
                    
                    Button(action: adicionar) {
                        Label("Salvar no Inventário", systemImage: "checkmark.seal")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(nome.isEmpty || marca.isEmpty || valor.isEmpty)
                }
                
                Section("Itens Registrados") {
                    if produtos.isEmpty {
                        Text("Nenhum produto cadastrado.").italic().foregroundColor(.secondary)
                    } else {
                        ForEach(produtos) { produto in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(produto.nome).font(.headline)
                                    Text("\(produto.marca) • \(produto.segmento.rawValue)")
                                        .font(.caption).foregroundColor(.secondary)
                                }
                                Spacer()
                                Text("R$ \(produto.valor, specifier: "%.2f")")
                                    .fontWeight(.semibold)
                            }
                        }
                        // Note: .onDelete removido conforme solicitado
                    }
                }
            }
            .navigationTitle("Produtos")
        }
    }
    
    private func adicionar() {
        if let v = Double(valor.replacingOccurrences(of: ",", with: ".")) {
            let p = Produto(nome: nome, marca: marca, segmento: segmento, valor: v)
            produtos.append(p)
            // Limpar campos
            nome = ""; marca = ""; valor = ""
        }
    }
}

// 2ª Aba: Relatórios
struct EstatisticasView: View {
    let produtos: [Produto]

    var body: some View {
        NavigationStack {
            List {
                Section("Métricas por Marca") {
                    let marcas = Array(Set(produtos.map { $0.marca })).sorted()
                    
                    if marcas.isEmpty { Text("Aguardando dados...") }
                    
                    ForEach(marcas, id: \.self) { marca in
                        let filtrados = produtos.filter { $0.marca == marca }
                        LinhaInfo(titulo: marca, lista: filtrados)
                    }
                }
                
                Section("Métricas por Segmento") {
                    ForEach(Segmento.allCases) { seg in
                        let filtrados = produtos.filter { $0.segmento == seg }
                        LinhaInfo(titulo: seg.rawValue, lista: filtrados)
                    }
                }
            }
            .navigationTitle("Análise")
        }
    }
}

struct LinhaInfo: View {
    let titulo: String
    let lista: [Produto]
    
    var body: some View {
        let media = lista.isEmpty ? 0 : lista.map(\.valor).reduce(0, +) / Double(lista.count)
        HStack {
            Text(titulo)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(lista.count) un.").bold()
                Text("Méd: R$ \(media, specifier: "%.2f")").font(.caption2)
            }
        }
    }
}

// 3ª Aba: Sobre
struct SobreView: View {
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.indigo)
            
            Text("Desenvolvedor iOS")
                .font(.title).bold()
            
            Text("Este projeto demonstra o uso de TabView, State e Bindings no SwiftUI para controle de fluxo de dados.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.secondary)
            
            Divider().padding()
            
            Text("Versão 1.0 - Ralf Lima")
                .font(.footnote)
            Spacer()
        }
    }
}


// Pré-visualização
struct Exercicio03_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio03()
    }
}
