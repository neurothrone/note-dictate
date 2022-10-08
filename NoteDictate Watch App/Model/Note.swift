//
//  Note.swift
//  NoteDictate Watch App
//
//  Created by Zaid Neurothrone on 2022-10-07.
//

import Foundation

struct Note: Identifiable {
  let id: UUID = .init()
  let text: String
}
