//
//  ContentView.swift
//  DragToClose
//
//  Created by Raphael Cerqueira on 05/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var isViewVisible = false
    @State var yOffset: CGFloat = 0
    
    var screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Button(action: {
                isViewVisible.toggle()
            }, label: {
                Text("Show view")
                    .frame(width: 120, height: 60)
                    .background(RoundedRectangle(cornerRadius: 8).strokeBorder())
            })
            
            if isViewVisible {
                VStack(spacing: 20) {
                    Capsule()
                        .frame(width: 60, height: 6)
                        .foregroundColor(.gray)
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        Text(sampleText)
                            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    })
                }
                .padding()
                .background(RoundCorners(radius: 30, corners: [.topLeft, .topRight]).fill(Color.white).shadow(radius: 5))
                .animation(.spring())
                .transition(.move(edge: .bottom))
                .offset(y: yOffset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            if value.translation.height > 0 {
                                yOffset = value.translation.height
                            }
                        })
                        .onEnded({ value in
                            if value.translation.height > screen.height / 3 {
                                yOffset = screen.height
                                isViewVisible.toggle()
                                yOffset = 0
                            } else {
                                yOffset = 0
                            }
                        })
                )
            }
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in sem leo. Proin sit amet dictum enim. Praesent sed dui placerat, maximus felis eu, eleifend justo. Proin tempus aliquet elit iaculis maximus. Etiam ac neque et ante tempus commodo. Vivamus rhoncus tincidunt mi, eu consequat nisi lacinia a. In varius lacus ut mattis lacinia. In fermentum lectus eget arcu varius, sed interdum dui mattis. Praesent faucibus efficitur quam, id rhoncus felis feugiat sed. Praesent ac elit eget orci congue pulvinar. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nMorbi tincidunt feugiat turpis sit amet facilisis. Curabitur iaculis lectus dui, non venenatis leo rhoncus at. Integer placerat tellus augue, a efficitur felis tincidunt ac. Nullam mattis lectus enim, vitae lobortis tortor pellentesque ut. Aenean ullamcorper arcu ipsum, dapibus ullamcorper velit tempus nec. Praesent in ex sit amet mi ullamcorper viverra. Nunc volutpat est tortor, vitae facilisis odio gravida sit amet. Pellentesque id ligula magna. Phasellus congue dictum lacus ut vehicula. Nam finibus consectetur eros, ac elementum erat tempus ultrices. Morbi nec nisi mauris. Ut volutpat velit et nisi tempus, sed commodo sem fermentum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in sem leo. Proin sit amet dictum enim. Praesent sed dui placerat, maximus felis eu, eleifend justo. Proin tempus aliquet elit iaculis maximus. Etiam ac neque et ante tempus commodo. Vivamus rhoncus tincidunt mi, eu consequat nisi lacinia a. In varius lacus ut mattis lacinia. In fermentum lectus eget arcu varius, sed interdum dui mattis. Praesent faucibus efficitur quam, id rhoncus felis feugiat sed. Praesent ac elit eget orci congue pulvinar. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nMorbi tincidunt feugiat turpis sit amet facilisis. Curabitur iaculis lectus dui, non venenatis leo rhoncus at. Integer placerat tellus augue, a efficitur felis tincidunt ac. Nullam mattis lectus enim, vitae lobortis tortor pellentesque ut. Aenean ullamcorper arcu ipsum, dapibus ullamcorper velit tempus nec. Praesent in ex sit amet mi ullamcorper viverra. Nunc volutpat est tortor, vitae facilisis odio gravida sit amet. Pellentesque id ligula magna. Phasellus congue dictum lacus ut vehicula. Nam finibus consectetur eros, ac elementum erat tempus ultrices. Morbi nec nisi mauris. Ut volutpat velit et nisi tempus, sed commodo sem fermentum."
