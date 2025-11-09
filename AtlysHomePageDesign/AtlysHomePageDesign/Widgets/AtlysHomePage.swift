//
//  ContentView.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 07/11/25.
//

import SwiftUI

struct CountryCard: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let imageName: String
}


struct AtlysHomePage: View {
    
    let cards: [CountryCard] = [
        .init(name: "Dubai", subtitle: "10K+ Visas on Atlys", imageName: "DubaiImage"),
        .init(name: "France", subtitle: "12K+ Visas on Atlys", imageName: "ParisImage"),
        .init(name: "India", subtitle: "8K+ Visas on Atlys", imageName: "IndiaImage"),
    ]
    
    enum KeyboardMode {
        case email
        case phoneNumber
    }
    @FocusState var phoneAndEmailFocusState:Bool
    @State var phoneNumber:String = ""
    @State var email:String = ""
    @State var keyboardMode:KeyboardMode = .phoneNumber
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,spacing: 8.0) {
                AtlysHomePageIconWidget()
            
                AtlysCarousalSwiftUIView(data: cards).frame( height: 300)
              //  AltysCountryCardCarouselView()
                
                Text("Get Visas\nOn Time").multilineTextAlignment(.center).font(Font.system(size: 35.0,weight: .bold)).lineSpacing(5).padding()
                
                if keyboardMode == .phoneNumber {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 1)
                        HStack(alignment: .center,spacing: 10.0) {
                            Button {
                                
                            } label: {
                                Text(" 🇹🇯 +91 ˅").foregroundColor(Color.black)
                            }
                            TextField("Enter mobile number", text: $phoneNumber).keyboardType(.numberPad).focused($phoneAndEmailFocusState)
                        }
                    }.frame(height: 48.0).padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 1)
                        HStack(alignment: .center,spacing: 10.0) {
                            TextField("Enter your email", text: $email).keyboardType(.emailAddress).focused($phoneAndEmailFocusState)
                        }.padding()
                    }.frame(height: 48.0).padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0).fill(Color.blue)
                        Text("Continue").foregroundColor(Color.white)
                    }.frame(height: 48.0, alignment: .center).padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                }

                ZStack {
                    Divider()
                    Text("  or  ").background(Color.white).font(Font.system(size: 16.0,weight: .regular))
                }.padding()
                AtlysHomePageLoginModes(selectedMode: keyboardMode) { mode in
                    switch mode {
                    case .google:
                        print("google clicked")
                    case .apple:
                        print("apple clicked")
                    case .email:
                        keyboardMode = keyboardMode == .email ? .phoneNumber : .email
                        print("email clicked")
                    }
                }
                HStack(alignment: .center,spacing: 0.0) {
                    Text("By continuing, you agree to our").font(Font.system(size: 12.0,weight: .regular))
                    Text(" terms ").underline().font(Font.system(size: 12.0,weight: .semibold)).onTapGesture {
                        print("terms clicked")
                    }
                    Text(" & ").font(Font.system(size: 12.0,weight: .regular))
                    Text(" privacy policy").underline().font(Font.system(size: 12.0,weight: .semibold)).onTapGesture {
                        print("privacy policy clicked")
                    }
                }
            }
        }.onTapGesture {
            phoneAndEmailFocusState = false
        }
    }
}
