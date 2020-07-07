//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Abdelrahman Mohamed on 7.07.2020.
//  Copyright © 2020 Abdelrahman Mohamed. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Text("Plan")
                    Image(systemName: "paperplane.fill")
            }
            ExerciseView()
                .tabItem {
                    Text("Exercise")
                    Image(systemName: "sum")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()

            HStack(spacing: 15) {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)

                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))

                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .cornerRadius(10)
                        .offset(x: 0, y: 87)
                }
            }
            .padding(.horizontal)

            ZStack {
                PricingView(icon: "wand.and.rays", title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255))
                    .padding()

                Text("Perfect for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .cornerRadius(10)
                    .offset(x: 0, y: 105)
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExerciseView: View {
    var body: some View {
        ZStack {
            PricingView(icon: "gamecontroller.fill", title: "Basic", price: "$9", textColor: .white, bgColor: .purple, hasSpacer: true, minHeight: 200, maxHeight: 200)
                .padding()
                .offset(x: 0, y: -220)

            PricingView(icon: "bolt.fill", title: "Pro", price: "$19", textColor: .white, bgColor: Color(red: 255/255, green: 183/255, blue: 37/255), hasSpacer: true, minHeight: 200, maxHeight: 200)
                .padding()
                .offset(x: 0, y: -110)

            PricingView(icon: "wand.and.rays", title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), hasSpacer: true, minHeight: 200, maxHeight: 200)
                .padding()
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {

    var icon: String?
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var hasSpacer: Bool?
    var minHeight: CGFloat?
    var maxHeight: CGFloat?

    var body: some View {
        VStack {
            icon.map({
                Image(systemName: $0)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            })
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)

            if hasSpacer != nil {
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: minHeight, maxHeight: maxHeight)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
