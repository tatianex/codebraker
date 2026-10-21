struct MatchMarkers: View {
    var body: some View {
        HStack {
            VStack {
                Circle().fill(Color.green)
                Circle().stroke(Color.primary, lineWidth: 1)
            }
            VStack {
                Circle()
                // opacity zero completely desapear 1 total visible 0.5 half visible
                Circle().opacity(0)
            }
        }
    }
}