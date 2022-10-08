//
//  CreditsScreen.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-08.
//

import SwiftUI

struct CreditsScreen: View {
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "brain.head.profile")
          .foregroundColor(.purple)
        Text("Neurothrone")
      }
      .font(.headline)
      
      HStack {
        Image(systemName: "c.circle")
        Text(Date.now, format: .dateTime.year())
      }
      .font(.subheadline)
      .foregroundColor(.secondary)
    }
  }
}

struct CreditsScreen_Previews: PreviewProvider {
  static var previews: some View {
    CreditsScreen()
  }
}
