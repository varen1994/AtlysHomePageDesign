//
//  AtlysCountryCardView.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 08/11/25.
//

import SwiftUI

struct AtlysCountryCardView: View {
    let cardSize:CGFloat = 250
    var countryName: String
    var subtitle: String
    var imageName: String
    var isSelected: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background Image
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: cardSize, height: cardSize)
                .clipped()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 3)
                )
            
            // Gradient overlay for text visibility
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(countryName)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                
                Text(subtitle)
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(width: cardSize, height: cardSize)
    }
}
