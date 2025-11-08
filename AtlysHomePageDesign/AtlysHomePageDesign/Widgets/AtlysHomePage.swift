//
//  ContentView.swift
//  AtlysHomePageDesign
//
//  Created by varender singh on 07/11/25.
//

import SwiftUI

struct AtlysHomePage: View {
    
    @FocusState var phoneNumberFocusState:Bool
    @State var phoneNumber:String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                AtlysHomePageIconWidget()
                Text("Get Visas\nOn Time").multilineTextAlignment(.center).font(Font.system(size: 35.0,weight: .bold)).lineSpacing(5)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8.0).stroke(Color.gray, lineWidth: 1)
                    HStack(alignment: .center,spacing: 10.0) {
                        Button {
                            
                        } label: {
                          Text(" 🇹🇯 +91")
                        }
                        TextField("Enter Phone Number", text: $phoneNumber).keyboardType(.numberPad).focused($phoneNumberFocusState)
                    }
                }.frame(height: 48.0).padding()
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.0).fill(Color.blue)
                        Text("Continue").foregroundColor(Color.white)
                    }.frame(height: 48.0, alignment: .center).padding()
                }

                ZStack {
                    Divider()
                    Text("  or  ").background(Color.white).font(Font.system(size: 16.0,weight: .regular))
                }.padding()
                AtlysHomePageLoginModes { mode in
                    switch mode {
                    case .google:
                        print("google clicked")
                    case .apple:
                        print("apple clicked")
                    case .email:
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
            phoneNumberFocusState = false
        }
    }
}
