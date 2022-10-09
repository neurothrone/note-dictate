//
//  Note.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-07.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
  
  init(id: UUID = .init(), text: String) {
    self.id = id
    self.text = text
  }
}
