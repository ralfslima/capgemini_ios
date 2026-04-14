// Importar SwuiftUI
import SwiftUI

// Estrutura de uma estrela
struct StarShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius / 2.5
        let points = 5
        let angleStep = .pi / CGFloat(points)
        
        var path = Path()
        
        for i in 0..<(2 * points) {
            let angle = CGFloat(i) * angleStep - .pi / 2
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            let point = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        path.closeSubpath()
        return path
    }
}

// Estrutura
struct Agrupadores: View {
    var body: some View {
        //VStack -> Agrupamento na vertical
        //HStack -> Agrupamento na horizontal
        //ZStack -> Agrupamento via camadas
        
        ZStack{
            // Propriedades do grupo
            Color.blue
                .ignoresSafeArea()
            // Retângulo / Quadrado
            Rectangle()
                .fill(Color.green)
                .frame(width: 350, height: 350)
            
            // Retângulo / Quadrado (Cantos arredondados)
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.yellow)
                .frame(width: 300, height: 300)
            
            // Cápsula
            Capsule()
                .fill(Color.red)
                .frame(width: 250, height: 200)
            
            // Elipse
            Ellipse()
                .fill(Color.blue)
                .frame(width: 150, height: 190)
            
            // Círculo
            Circle()
                .fill(Color.brown)
                .frame(width: 100, height: 100)
                
            // Forma customizada
            StarShape()
                .fill(Color.yellow)
                .frame(width: 80, height: 80)
            }
        
        
    }
}

// Pré-visualização
struct Agrupadores_Previews: PreviewProvider {
    static var previews: some View {
        Agrupadores()
    }
}
