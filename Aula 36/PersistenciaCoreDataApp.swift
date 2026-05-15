// Importar SwiftUI
import SwiftUI

// Principal
@main
struct PersistenciaCoreDataApp: App {
    
    // Criar referência do PersistenceController
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            // Injetar o Core Data
            .environment(
                \.managedObjectContext,
                 persistenceController.container.viewContext
            )
            
        }
    }
}
