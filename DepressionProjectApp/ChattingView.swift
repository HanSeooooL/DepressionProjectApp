//
//  ChattingView.swift
//  DepressionProjectApp
//
//  Created by 한설 on 2024/05/23.
//

import SwiftUI

struct ChattingView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
    }
}


struct ChatBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.bottomLeft, .topRight, .bottomRight],
            cornerRadii: CGSize(width: 16, height: 16)
            )
        return Path(path.cgPath)
    }
}

struct ChatBox: View {
    let message: String
    let profileImage: String
    let boxColor: Color
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: profileImage)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(boxColor)
                .padding(.top, 8)
            if message.isEmpty {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(boxColor)
                    .tint(.black)
                    .clipShape(ChatBubbleShape())
            } else {
                Text(message)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(boxColor)
                    .foregroundColor(.black)
                    .clipShape(ChatBubbleShape())
            }
        }
    }
}
