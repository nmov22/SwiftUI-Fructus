//
//  FructusApp.swift
//  Fructus
//
//  Created by Noel Velasco on 2/22/22.
//

import SwiftUI

@main
struct FructusApp: App {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  var body: some Scene {
    WindowGroup {
      if isOnboarding {
        OnboardingView(fruits: fruitsData)
      } else {
        ContentView()
      }
    }
  }
}
