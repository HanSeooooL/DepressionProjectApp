//
//  ContentView.swift
//  DepressionProjectApp
//
//  Created by 한설 on 2024/05/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var id: String = ""
    @State var password: String = ""
    @State var isLogin: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Depression")
                    .font(.system(size: 50))
                    .bold()
                    .frame(alignment: .leading)
                Text("ChatBot")
                    .font(.system(size: 50))
                    .bold()
                    .frame(alignment: .leading)
            }
            .padding(.top, 30)
            Spacer()
            Text("Log in")
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    
                TextField("E-mail", text: $id)
                    .frame(width: 250, height: 25)
                
            }
            .padding(10)
            .border(Color.black, width: 1)
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                    
                TextField("Password", text: $password)
                    .frame(width: 250, height: 25)
                
            }
            .padding(10)
            .border(Color.black, width: 1)
            
            Toggle("Condition Agree", isOn: $isLogin)
                .frame(alignment: .center)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
            
            Button{
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            } label: {
                Text("Login")
                    .padding()
                    .foregroundColor(.green)
                    .frame(width: 250.0)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.green.opacity(0.2))
                    )
            }
            .padding(.bottom, 100)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
