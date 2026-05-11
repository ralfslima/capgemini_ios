import Foundation

// Gerenciador
class JSONDataStore: ObservableObject {
    
    // Vetor contendo os dados em formato JSON
    @Published var itens: [PessoaJSON] = [] {
        didSet { salvar() }
    }
    
    // Arquivo utilizado para armazenar o JSON localmente
    private let arquivoURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("dados_aula.json")

    // Construtor
    init() { carregar() }

    // Função de cadastro
    func adicionar(nome: String, cidade: String) {
        let nova = PessoaJSON(nome: nome, cidade: cidade)
        itens.append(nova)
    }

    // Salvar dados da lista no arquivo local
    private func salvar() {
        if let data = try? JSONEncoder().encode(itens) {
            try? data.write(to: arquivoURL)
            print("Arquivo JSON atualizado em: \(arquivoURL.path)")
        }
    }

    // Função de listagem
    private func carregar() {
        if let data = try? Data(contentsOf: arquivoURL),
           let carregados = try? JSONDecoder().decode([PessoaJSON].self, from: data) {
            self.itens = carregados
        }
    }
}


