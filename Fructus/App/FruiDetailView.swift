//
//  FruiDetailView.swift
//  Fructus
//
//  Created by Noel Velasco on 2/24/22.
//

import SwiftUI

struct FruiDetailView: View {
    //MARK: Properties
  var fruit: Fruit

    //MARK: Body
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // HEADER
          FruitHeaderView(fruit: fruit)

          VStack(alignment: .leading, spacing: 20) {
            // TITLE
            Text(fruit.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundColor(fruit.gradientColors[1])

            // HEADLINE
            Text(fruit.headline)
              .font(.headline)
              .multilineTextAlignment(.leading)


            // NUTRIENTS
            FruitNutrientsView(fruit: fruit)

            // SUBHEADLINE
            Text("Learn more about \(fruit.title)".uppercased())
              .fontWeight(.bold)
              .foregroundColor(fruit.gradientColors[1])

            // DESCRIPTION
            Text(fruit.description)
              .multilineTextAlignment(.leading)

            // LINK
            SourceLinkView()
              .padding(.top, 10)
              .padding(.bottom, 40)
          }//: VStack
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center)
        }//:Vstack
        .navigationBarTitle(fruit.title, displayMode: .inline)
        .navigationBarHidden(true)
      }//: Scroll
      .edgesIgnoringSafeArea(.top)
    }//: Navigation
    .navigationViewStyle(StackNavigationViewStyle())

  }
}

  //MARK: Preview
struct FruiDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FruiDetailView(fruit: fruitsData[0])
      .previewDevice("iPhone 11 Pro")
  }
}
