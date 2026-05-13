// Importa o framework Core Data, que permite criar e gerenciar banco de dados local no iOS.
import CoreData

// Estrutura responsável por centralizar toda a configuração do Core Data no app.
struct PersistenceController {

    // Cria uma instância única (Singleton).
    // Isso garante que o app inteiro use o mesmo Core Data stack.
    static let shared = PersistenceController()

    // O NSPersistentContainer é o “coração” do Core Data.
    // Ele gerencia o modelo, o contexto e o banco SQLite internamente.
    let container: NSPersistentContainer

    // Construtor / inicializador
    init() {
        
        // Cria o container do Core Data usando o nome do .xcdatamodeld.
        // Esse nome precisa ser EXATAMENTE igual ao arquivo do modelo.
        container = NSPersistentContainer(name: "Model")
        
        // Carrega o banco de dados físico (SQLite) e conecta com o modelo.
        container.loadPersistentStores { _, error in
            
            // Verifica se ocorreu algum erro ao carregar o banco.
            if let error = error as NSError? {
                fatalError("Erro ao carregar Core Data: \(error)")
            }
        }
    }
}
