//
//  Feature.swift
//  AppStore
//
//  Created by HwangByungJo  on 2022/07/04.
//

import Foundation

struct Feature: Decodable {
  let type: String
  let appName: String
  let description: String
  let imageURL: String
}
