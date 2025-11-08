//
//  AtlysCountryCardCarousalView.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 08/11/25.
//

import SwiftUI

struct CountryCard: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let imageName: String
}

struct AltysCountryCardCarouselView: View {
    let cards: [CountryCard] = [
        .init(name: "France", subtitle: "12K+ Visas on Atlys", imageName: "ParisImage"),
        .init(name: "Dubai", subtitle: "10K+ Visas on Atlys", imageName: "DubaiImage"),
        .init(name: "India", subtitle: "8K+ Visas on Atlys", imageName: "IndiaImage")
    ]
    
    
     @State private var selectedID: UUID?
     
     var body: some View {
         GeometryReader { outerProxy in
                 ScrollView(.horizontal, showsIndicators: false) {
                     HStack(spacing: 0) {
                         ForEach(cards) { card in
                             GeometryReader { proxy in
                                 let scale = getScale(geo: proxy, outerGeo: outerProxy)
                                 AtlysCountryCardView(
                                     countryName: card.name,
                                     subtitle: card.subtitle,
                                     imageName: card.imageName,
                                     isSelected: selectedID == card.id
                                 )
                                 .scaleEffect(scale)
                                 .opacity(Double(scale - 0.2))
                                 .animation(.easeInOut(duration: 0.3), value: scale)
                                 .onTapGesture {
                                     withAnimation(.spring()) {
                                         selectedID = card.id
                                     }
                                 }
                             }
                             .frame(width: 220, height: 300)
                         }
                     }
                 }
             }
             .frame(height: 330)
     }
    
    func getScale(geo: GeometryProxy, outerGeo: GeometryProxy) -> CGFloat {
        let midX = geo.frame(in: .global).midX
        let screenMid = outerGeo.size.width / 2
        let distance = abs(screenMid - midX)
        let maxDistance: CGFloat = 200
        let scale = max(0.85, 1 - (distance / maxDistance) * 0.2)
        return scale
    }
}
