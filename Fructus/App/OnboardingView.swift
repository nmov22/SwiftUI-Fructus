//
//  OnboardingView.swift
//  Fructus
//
//  Created by Noel Velasco on 2/22/22.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: Properties

  var fruits: [Fruit] = fruitsData

  // MARK: Body
  var body: some View {
    TabView {
      ForEach(fruits[0...5]) { item in
        FruitCardView(fruit: item)
      }//: Loop
    } //: Tab
    .tabViewStyle(PageTabViewStyle())
    .padding(.vertical, 20)
  }
}

  // MARK: Preview

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(fruits: fruitsData)
      .previewDevice("IPhone 11 Pro")
  }
}
