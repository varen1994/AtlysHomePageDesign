//
//  AtlysCountryCardView.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 08/11/25.
//

import SwiftUI

struct AtlysCountryCardView: View {
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
                .frame(width: 220, height: 280)
                .clipped()
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
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
            
            // Checkmark icon
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(10)
                }
                Spacer()
            }
        }
        .frame(width: 220, height: 330)
        .shadow(radius: 6)
    }
}
