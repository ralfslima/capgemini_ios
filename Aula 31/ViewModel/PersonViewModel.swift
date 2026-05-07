// Importar Foundation
import Foundation

// Classe
class PersonViewModel: ObservableObject {
    
    // Ao alterar o conteúdo, a UI será atualizada
    @Published var persons: [Person] = []
    
    // Construtor
    init() {
        addPerson(name: "Larissa", city: "Maringá")
        addPerson(name: "Augusto", city: "Joinville")
        addPerson(name: "Luana", city: "Caxias do Sul")
    }
    
    // Função de cadastro
    func addPerson(name: String, city: String) {
        let newPerson = Person(name: name, city: city)
        persons.append(newPerson)
    }
    
    // Função de alteração
    func updatePerson(person: Person, name: String, city: String) {
        // Obter o índice da pessoa que será alterada no vetor
        guard let index = persons.firstIndex(where: {
            $0.id == person.id
        }) else { return }
        
        // Alterar o nome e a cidade
        persons[index].name = name
        persons[index].city = city
    }
    
    // Função de remoção
    func deletePerson(at offsets: IndexSet) {
        persons.remove(atOffsets: offsets)
    }
    
}











