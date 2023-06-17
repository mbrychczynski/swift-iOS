//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Mateusz Brychczynski on 16/06/2023.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("ToDo List is empty")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("To add a bunch of items to your ToDo List press ADD BUTTON")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView()) {
                    Text("Add Something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(30)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
