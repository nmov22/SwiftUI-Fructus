//
//  SettingsView.swift
//  Fructus
//
//  Created by Noel Velasco on 2/24/22.
//

import SwiftUI

struct SettingsView: View {
    //MARK: Properties
  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isOnboarding") var isOnboarding: Bool = false

    //MARK: Body
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
            //MARK: Section 1
          GroupBox(label:
                    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")) {
            Divider().padding(.vertical, 4)

            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
              Text("Most fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietart fiber vitamins, and much more.")
                .font(.footnote)
            }
          }

            //MARK: Section 2

          GroupBox(
            label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
          ) {
            Divider().padding(.vertical, 4)
            Text("If you wish, you restart the application by toggle the switch in this box. That way it satrts the onboarding process and you will see the welcome screen again.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)

            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("Restarted".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.green)
              } else {
                Text("Restart".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
          }

            //MARK: Section 3

          GroupBox(
            label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Developer", content: "Noel Velasco")
            SettingsRowView(name: "Designer", content: "Marie Velasco")
            SettingsRowView(name: "Compatibility", content: "iOS 15")
            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
            SettingsRowView(name: "Twitter", linkLabel: "@noelv22", linkDestination: "twitter.com/noelv22")
            SettingsRowView(name: "SwiftUI", content: "2.0")
            SettingsRowView(name: "Version", content: "1.1.0")
          }



        }//: VStack
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(trailing: Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          Image(systemName: "xmark")
        })
        .padding()
      }//: ScrollView
    }//: Navigation
  }
}

  //MARK: Preview
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 11 Pro")
  }
}
