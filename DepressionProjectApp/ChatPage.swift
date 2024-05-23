//
//  ChatPage.swift
//  DepressionProjectApp
//
//  Created by 한설 on 2024/05/23.
//

import SwiftUI

struct ChatPage: View {
    @State var showmenu: Bool = false
    var body: some View {
        VStack {
            let drag = DragGesture()
                .onEnded {
                    if $0.translation.width < -100 {
                        withAnimation {
                            self.showmenu = false
                        }
                    }
                }
            return NavigationView {
                GeometryReader {
                    greometry in ZStack(alignment:.leading) {
                        MainView(showMenu: self.$showmenu)
                            .frame(width: geometry.size.width, height: geometry.size.hegith, alignment: .center)
                    }
                }
            }
        }
    }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}

public struct LilSideMenu<Content>: View where Content: View {
    @Binding public var isPresented: Bool
    public var width: CGFloat
    public var content: Content
    
    @GestureState private var translation: CGFloat = .zero
    
    //@Environment(\.safeAreaInsets) private var safeAreaInsets
    
    public init(_ isPresented: Binding<Bool>, width: CGFloat, content: () -> Content) {
        self._isPresented = isPresented
        self.width = width
        self.content = content()
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            Spacer()
        }
    }
    
}


struct MainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation{
                self.showMenu = true
            }
        }) {
            Text("메뉴 보여라.")
        }
    }
}
