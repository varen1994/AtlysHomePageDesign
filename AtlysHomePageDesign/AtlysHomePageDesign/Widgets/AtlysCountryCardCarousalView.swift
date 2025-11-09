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
        .init(name: "Dubai", subtitle: "10K+ Visas on Atlys", imageName: "DubaiImage"),
        .init(name: "France", subtitle: "12K+ Visas on Atlys", imageName: "ParisImage"),
        .init(name: "India", subtitle: "8K+ Visas on Atlys", imageName: "IndiaImage")
    ]
    
     let cardSize: CGFloat = 250
     let spacing: CGFloat = 0
     @State private var selectedID: UUID?
     
    var body: some View {
        VStack {
            GeometryReader { outerProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: -28) {
                        Spacer(minLength:(outerProxy.size.width - cardSize) / 2)
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
                                .animation(.easeInOut(duration: 0.3), value: scale)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedID = card.id
                                    }
                                }
                            }
                            .frame(width: cardSize, height: cardSize)
                        }
                        Spacer(minLength:(outerProxy.size.width - cardSize) / 2)
                    }
                }
            }
            .frame(height: cardSize + 32)
            
            HStack(spacing: 8) {
                ForEach(cards) { card in
                    let isSelected = selectedID == card.id
                    Circle()
                        .fill(isSelected ? Color.blue : Color.gray.opacity(0.5))
                        .frame(width: isSelected ? 12 : 8, height: isSelected ? 12 : 8)
                        .animation(.easeInOut, value: isSelected)
                }
            }
        }
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
