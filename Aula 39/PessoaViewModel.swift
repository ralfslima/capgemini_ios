// Importar Foundation
import Foundation

// Classe PessoaViewModel (Precisa ser uma classe, o Struct não funciona)
class PessoaViewModel: ObservableObject {
    // Array que atualizará a interface SwiftUI automaticamente ao ser modificado
    @Published var pessoas: [Pessoa] = []
    
    // String publicada para armazenar mensagens de erro caso algo falhe
    @Published var errorText: String = ""
    
    // URL base da sua API carregada do servidor Render
    private let urlBase = URL(string: "https://api-ios-rda6.onrender.com/")!
    
    // FUNÇÃO PARA LISTAR PESSOAS (GET)
    func fetchPessoas() {
        // Concatena o endpoint de listagem à URL base (/listar)
        let urlListar = urlBase.appendingPathComponent("listar")
        
        // Inicia a tarefa de rede para buscar os dados
        URLSession.shared.dataTask(with: urlListar) { data, response, error in
            
            // Verifica se os dados chegaram e tenta decodificar o JSON em um array de Pessoa
            if let data = data, let decoded = try? JSONDecoder().decode([Pessoa].self, from: data) {
                
                // Atualiza a interface gráfica obrigatoriamente na Thread Principal (Main Queue)
                DispatchQueue.main.async {
                    self.pessoas = decoded
                }
                
            } else if let error = error {
                // Captura falhas de rede e envia para a variável de erro
                DispatchQueue.main.async {
                    self.errorText = error.localizedDescription
                }
            }
        }.resume() // O .resume() é obrigatório para iniciar a execução da requisição
    }
    
    // FUNÇÃO PARA CADASTRAR PESSOA (POST)
    func addPessoa(nome: String, cidade: String) {
        // Concatena o endpoint de cadastro à URL base (/cadastrar)
        let urlCadastrar = urlBase.appendingPathComponent("cadastrar")
        
        // Configura os parâmetros da requisição HTTP
        var req = URLRequest(url: urlCadastrar)
        req.httpMethod = "POST"
        
        // Define o cabeçalho informando que o corpo da mensagem é um JSON
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Cria o dicionário correspondente ao corpo (body) esperado pela API Node
        let body: [String: Any] = ["nome": nome, "cidade": cidade]
        
        // Converte o dicionário Swift em dados brutos JSON
        req.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // Executa a requisição de envio
        // Sobre os três underlines:
        // Primeiro _ (data): Ignora os dados/texto brutos que o Node devolveu após salvar.
        // Segundo _ (response): Ignora os dados técnicos da resposta (como o status HTTP 200 OK ou 404 Not Found).
        // Terceiro _ (error): Ignora se houve algum erro de conexão física (como internet caída).
        URLSession.shared.dataTask(with: req) { _, _, _ in
            // Após cadastrar com sucesso, recarrega a lista chamando o GET novamente
            self.fetchPessoas()
        }.resume()
    }
    
    // FUNÇÃO PARA REMOVER PESSOA (DELETE)
    func deletePessoa(codigo: Int) {
        // Concatena o endpoint e o parâmetro de rota à URL base (/remover/ID)
        let urlRemover = urlBase.appendingPathComponent("remover").appendingPathComponent(String(codigo))
        
        // Configura o método HTTP para DELETE
        var req = URLRequest(url: urlRemover)
        req.httpMethod = "DELETE"
        
        // Executa a requisição de remoção
        URLSession.shared.dataTask(with: req) { _, _, _ in
            // Após remover do banco/vetor, recarrega a lista na tela
            self.fetchPessoas()
        }.resume()
    }
}

// EXEMPLO DE CADASTRO QUE RECEBE UMA PESSOA DA API E ATUALIZA O VETOR DINAMICAMENTE
//func addPessoa(nome: String, cidade: String) {
//    let urlCadastrar = urlBase.appendingPathComponent("cadastrar")
//
//    var req = URLRequest(url: urlCadastrar)
//    req.httpMethod = "POST"
//    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let body: [String: Any] = ["nome": nome, "cidade": cidade]
//    req.httpBody = try? JSONSerialization.data(withJSONObject: body)
//
//    // Trocamos os sublinhados pelo 'data' para ler o que a API nos devolveu
//    URLSession.shared.dataTask(with: req) { data, _, _ in
//        // 1. Verifica se recebemos dados de volta da API
//        if let data = data {
//            // 2. Tenta decodificar o JSON que o Node enviou (a pessoa com o ID gerado)
//            if let pessoaCadastrada = try? JSONDecoder().decode(Pessoa.self, from: data) {
//
//                // 3. Modificações de @Published precisam acontecer na Thread Principal
//                DispatchQueue.main.async {
//                    // Adiciona a nova pessoa direto no fim do nosso array local
//                    self.pessoas.append(pessoaCadastrada)
//                }
//            }
//        }
//    }.resume()
//}

