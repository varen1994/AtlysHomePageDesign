//
//  AtlysHomePageLoginModes.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 08/11/25.
//

import SwiftUI




struct AtlysHomePageLoginModes: View {
    
    enum LoginMode {
        case google
        case apple
        case email
    }
    
    let iconSize:CGFloat = 20.0
    var loginModel:(LoginMode)->Void
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Spacer(minLength: 10.0)
            HStack(alignment: .center, spacing: 40.0) {
                
                Button {
                    loginModel(.google)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 1)
                        Image(uiImage: UIImage(named: "GoogleIcon")!).resizable().frame(width: iconSize, height: iconSize, alignment: .center)
                    }.frame(width: 40, height: 40, alignment: .center)
                }

                Button {
                    loginModel(.apple)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 1)
                        Image(uiImage: UIImage(named: "AppleIcon")!).resizable().frame(width: iconSize, height: iconSize, alignment: .center)
                    }.frame(width: 40, height: 40, alignment: .center)
                }
                
                Button {
                    loginModel(.email)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 1)
                        Image(uiImage: UIImage(named: "GoogleIcon")!).resizable().frame(width: iconSize, height: iconSize, alignment: .center)
                    }.frame(width: 40, height: 40, alignment: .center)
                }
            }
            Spacer(minLength: 10.0)
        }
    }
}
