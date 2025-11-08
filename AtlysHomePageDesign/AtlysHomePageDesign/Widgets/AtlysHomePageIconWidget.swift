//
//  AtlysHomePageIconWidget.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 08/11/25.
//

import SwiftUI

struct AtlysHomePageIconWidget: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer(minLength: 20.0)
            Image(uiImage: UIImage(named: "Atlys")!).frame(height: 30.0)
            Text("visas on time").foregroundColor(Color.blue).bold()
        }
    }
}
