//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Tatiane Pedrelli on 20/10/26.
//
import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers : View {
    var matches: Array<Match>
    // this are the same thing but written differently
//    var matches: [Match]
    
    var body: some View {
        HStack {
            VStack {
                mactchMarker(peg: 0)
                mactchMarker(peg: 1)
            }
            VStack {
                mactchMarker(peg: 2)
                mactchMarker(peg: 3)
                // opacity zero completely desapear 1 total visible 0.5 half visible
//                Circle().opacity(0)
            }
        }
    }
    
    // could also be a ViewBuilder without return
    func mactchMarker(peg: Int) -> some View {
        // this is the first version of exactCount presented
        // let exactCount: Int = matches.count(where: { match in match == .exact})
        // if the type can be inferred, let it be inferred
        
        // this is the version of exactCount with the func isExact
        // let exactCount = matches.count(where: isExact)
        
        // this is the version after the explanation above
        let exactCount: Int = matches.count { $0 == .exact }
        // we copied the arguments and return that was in the isExact func first
        // and it turned into this:
        // let exactCount = matches.count(where: { (match: Match) -> Bool in match == Macht.exact })
        // inline functions don't need a name, so we can get rid off : Match because it knows
        // and again we can get rid off Bool because it knows
        
        // let exactCount = matches.count(where: { (match) in match == Match.exact })
        
        // and then we can get rid off the parenthesis that is doing nothing anymore
        
        // let exactCount = matches.count(where: { match in match == Match.exact })
        // then == .exact to be succinct
        
        // let exactCount: Int = matches.count { match in match == .exact}
        // now we can get rid off the named argument and replace for $0
        // and then we do not need the where anymore
        // so the final
        
        // let exactCount: Int = matches.count { $0 == .exact}
        
//        let foundCount: Int = matches.count(where: { match in match != .nomatch})
        let foundCount: Int = matches.count { $0 != .nomatch }
        
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
    
    // when the function is a single line that returns the same thing ->
    // also don't need the return keyword
//    func isExact(match: Match) -> Bool {
//        return match == Match.exact
////         they do not use the full name although it is clearer
////         again let it be inferred where it can
//        match == .exact
//    }
}

#Preview {
    MatchMarkers(matches: [.exact, .inexact, .nomatch])
}
