// Importar o SwiftUI
import SwiftUI

// Importar o Core Data
import CoreData

// Estrutura
struct ContentView: View {
    
    // Referência responsável por: cadastrar, alterar e remover
    @Environment(\.managedObjectContext)
    private var viewContext
    
    // Referência responsável por listar (ordenar e filtrar)
    @FetchRequest(sortDescriptors: [])
    var persons: FetchedResults<Person>
    
    // Função para remover pessoas
    private func deletePerson(offsets: IndexSet) {
        
        // Percorrer o parâmetro offsets para remover os registros
        for index in offsets {
            viewContext.delete(persons[index])
        }
        
        // Salvar as alterações realizadas (remoção de pessoas)
        try? viewContext.save()
        
    }
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // Listar pessoas
            List {
                
                // ForEach
                ForEach(persons) { person in
                    
                    // NavigationLink
                    NavigationLink {
                        FormPersonView(person: person)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(person.name!)
                            Text(person.city ?? "")
                        }
                    }
                    
                } // ForEach
                .onDelete(perform: deletePerson)
                
            } // List
            .navigationTitle("Persons")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        FormPersonView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        } // NavigationStack
    } // Body
} // ContentView
