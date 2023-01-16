//
//  Protocols.swift
//  Bondi Ball
//
//  Created by Sebastiaan Hols on 16/01/2023.
//  Copyright © 2023 Sebastiaan Hols. All rights reserved.
//

import Foundation

protocol BoardProtocol {
  var id: UUID { get }
  var rows: Int { get set } // TODO: Just get in production mode
  var columns: Int { get set }
  var spring: DampedHarmonicSpring { get set }
}

protocol LevelProtocol {
  var id: UUID { get }
  /// Pocket from which the first shot is swiped
  var startPocket: EndpointIndicatorView { get } // TODO: Extract model and reference here
  /// Goal pocket to put the ball in
  var endPocket: EndpointIndicatorView { get } // TODO: Extract model and reference here
  /// Price for dragging
  var dragCost: Int { get }
  /// Cost for putting the ball in a wrong pocket
  var wrongPocketCost: Int { get }
  /// Tally of points: max points - costs
  var points: Int { get set }
  /// The starting amount and max of points the level, user should see this decrease as point are incurred
  var maxPoints: Int { get }
  /// History of the pockets the ball landed in
  var pocketHistory: [EndpointIndicatorView] { get set }
}

protocol GameProtocol {
  var id: UUID { get }
  var levels: [Level] { get }
  var currentLevel: Level { get } // TODO: Actually everything should be get and FP
  var levelHistory: [Level] { get }
  var score: Int { get set }
}