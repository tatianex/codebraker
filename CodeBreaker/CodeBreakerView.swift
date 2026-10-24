import SwiftUI
import Playgrounds
    
// Views and viewmodifiers are 90% of the UI composing
// Order does matter

struct CodeBreakerView: View {
    let game: CodeBreaker = CodeBreaker()
    var body: some View {
        VStack {
            // we do .red because swift is infering the type of Color
            pegs(colors: [Color.red, .green, .yellow, .blue])
            pegs(colors: [.blue, .blue, .red, .green])
            pegs(colors: [.yellow, .green, .yellow, .blue])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 24)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact])
        }
    }
}

#Preview {
    CodeBreakerView()
}
