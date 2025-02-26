import SwiftUI

//Background realizado com ajuda de Inteligência Artificial

// Estrutura para armazenar as propriedades de cada círculo
struct BouncyCircle {
    var position: CGPoint
    var velocity: CGPoint
    var size: CGFloat
    var color: Color
}

struct BouncyBackground: View {
    // Configuração dos círculos
    @State private var circles: [BouncyCircle] = []
    let numberOfCircles = 10
    let minSize: CGFloat = 40
    let maxSize: CGFloat = 120
    
    // Timer para atualizar a posição dos círculos
    @State private var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    init() {
        // Inicializar círculos com valores aleatórios
        _circles = State(initialValue: (0..<numberOfCircles).map { _ in
            BouncyCircle(
                position: CGPoint(
                    x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                    y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                ),
                velocity: CGPoint(
                    x: CGFloat.random(in: -2...2),
                    y: CGFloat.random(in: -2...2)
                ),
                size: CGFloat.random(in: minSize...maxSize),
                color: Color(
                    red: Double.random(in: 0.1...0.2),
                    green: Double.random(in: 0.3...0.9),
                    blue: Double.random(in: 0.7...1.0),
                    opacity: Double.random(in: 0.2...0.5)
                )
            )
        })
    }
    
    var body: some View {
        ZStack {
            // Fundo gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color(.white), Color(.backgroundPrimary)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Círculos animados
            ForEach(0..<circles.count, id: \.self) { index in
                Circle()
                    .fill(circles[index].color)
                    .frame(width: circles[index].size, height: circles[index].size)
                    .position(circles[index].position)
                    .blur(radius: circles[index].size / 8)
            }
        }
        .onReceive(timer) { _ in
            updateCircles()
        }
    }
    
    // Atualiza a posição dos círculos e lida com a colisão com as bordas
    func updateCircles() {
        let bounds = UIScreen.main.bounds
        
        for i in 0..<circles.count {
            // Atualiza a posição com base na velocidade
            circles[i].position.x += circles[i].velocity.x
            circles[i].position.y += circles[i].velocity.y
            
            let radius = circles[i].size / 2
            
            // Verifica colisão com as bordas horizontais
            if circles[i].position.x - radius <= 0 || circles[i].position.x + radius >= bounds.width {
                circles[i].velocity.x = -circles[i].velocity.x
                
                // Ajusta a posição para evitar que fique preso na borda
                if circles[i].position.x - radius <= 0 {
                    circles[i].position.x = radius
                } else {
                    circles[i].position.x = bounds.width - radius
                }
            }
            
            // Verifica colisão com as bordas verticais
            if circles[i].position.y - radius <= 0 || circles[i].position.y + radius >= bounds.height {
                circles[i].velocity.y = -circles[i].velocity.y
                
                // Ajusta a posição para evitar que fique preso na borda
                if circles[i].position.y - radius <= 0 {
                    circles[i].position.y = radius
                } else {
                    circles[i].position.y = bounds.height - radius
                }
            }
        }
    }
}
