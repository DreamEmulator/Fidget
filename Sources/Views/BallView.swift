/*
 MIT License

 Copyright (c) 2018 Christian Schnorr

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

internal final class PictureInPictureView: UIView {
  override public init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError()
  }

  func setup(){
    self.isOpaque = false
    self.layer.shadowColor = UIColor.label.cgColor
    self.layer.shadowOpacity = 0.25
    self.layer.shadowRadius = 3
    self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    setup()
  }

  override public func draw(_ rect: CGRect) {
    let topColor = UIColor(red: 0.95, green: 0.93, blue: 0.16, alpha: 1.0)
    let bottomColor = UIColor(red: 0.97, green: 0.67, blue: 0.16, alpha: 1.0)
    let colors = [topColor.cgColor, bottomColor.cgColor] as CFArray
    let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)!

    let bounds = CGRect(origin: .zero, size: self.bounds.size)
    let path = UIBezierPath(roundedRect: bounds, cornerRadius: 100)

    let context = UIGraphicsGetCurrentContext()!
    context.beginPath()
    context.addPath(path.cgPath)
    context.clip()
    context.drawLinearGradient(gradient, start: CGPoint(x: bounds.midX, y: bounds.minY), end: CGPoint(x: bounds.midX, y: bounds.maxY), options: [])
  }
}
