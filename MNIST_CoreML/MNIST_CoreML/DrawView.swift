//
//  DrawView.swift
//  MNIST_CoreML
//
//  Created by Seunghun Lee on 2017-08-26.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class Line {
  var start: CGPoint
  var end: CGPoint

  init(start: CGPoint, end: CGPoint) {
    self.start = start
    self.end = end
  }
}

class DrawView: UIView {
  var lineWidth = CGFloat(15)
  var color = UIColor.white

  var lines = [Line]()
  var lastPoint: CGPoint!

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
      lastPoint = touch.location(in: self)
    }
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
      let newPoint = touch.location(in: self)
      lines.append(Line(start: lastPoint, end: newPoint))
      lastPoint = newPoint

      setNeedsDisplay()
    }
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)

    let drawPath = UIBezierPath()
    drawPath.lineCapStyle = .round

    for line in lines {
      drawPath.move(to: line.start)
      drawPath.addLine(to: line.end)
    }

    drawPath.lineWidth = lineWidth
    color.set()

    drawPath.stroke()
  }

  func getViewContext() -> CGContext? {
    let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceGray()
    let bitmapInfo = CGImageAlphaInfo.none.rawValue
    guard let context = CGContext(data: nil,
                                  width: 28,
                                  height: 28,
                                  bitsPerComponent: 8,
                                  bytesPerRow: 28,
                                  space: colorSpace,
                                  bitmapInfo: bitmapInfo)
      else {
        fatalError("Could not get context")
    }

    context.translateBy(x: 0 , y: 28)
    context.scaleBy(x: 28/self.frame.size.width, y: -28/self.frame.size.height)

    // put view pixel data in context
    self.layer.render(in: context)

    return context
  }

}
