//
//  ViewController.swift
//  MNIST_CoreML
//
//  Created by Seunghun Lee on 2017-08-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var canvasView: UIView!
  @IBOutlet weak var mainImageView: UIImageView!
  @IBOutlet weak var tempImageView: UIImageView!
  
  var lastPoint = CGPoint.zero
  var red: CGFloat = 0.0
  var green: CGFloat = 0.0
  var blue: CGFloat = 0.0
  var brushWidth: CGFloat = 10.0
  var opacity: CGFloat = 1.0
  var swiped = false

  override func viewDidLoad() {
    super.viewDidLoad()

    canvasView.addTopBorderWithColor(color: UIColor.black, width: 1.0)
    canvasView.addLeftBorderWithColor(color: UIColor.black, width: 1.0)
    canvasView.addRightBorderWithColor(color: UIColor.black, width: 1.0)
    canvasView.addBottomBorderWithColor(color: UIColor.black, width: 1.0)
  }

  @IBAction func resetCanvas(_ sender: UIButton) {
    mainImageView.image = nil
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    swiped = false
    if let touch = touches.first {
      lastPoint = touch.location(in: tempImageView)
    }
  }

  func drawLine(fromPoint: CGPoint, toPoint: CGPoint) {
    UIGraphicsBeginImageContext(tempImageView.frame.size)
    let context = UIGraphicsGetCurrentContext()
    tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: tempImageView.frame.size.width, height: tempImageView.frame.size.height))

    context?.move(to: fromPoint)
    context?.addLine(to: toPoint)

    context?.setLineCap(.round)
    context?.setLineWidth(brushWidth)
    context?.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
    context?.setBlendMode(.normal)

    context?.strokePath()

    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
    tempImageView.alpha = opacity
    UIGraphicsEndImageContext()
  }

  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    swiped = true
    if let touch = touches.first {
      let currentPoint = touch.location(in: tempImageView)
      drawLine(fromPoint: lastPoint, toPoint: currentPoint)

      lastPoint = currentPoint
    }
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if !swiped {
      drawLine(fromPoint: lastPoint, toPoint: lastPoint)
    }

    UIGraphicsBeginImageContext(mainImageView.frame.size)
    mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: mainImageView.frame.size.width, height: mainImageView.frame.size.height), blendMode: .normal, alpha: 1.0)
    tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: mainImageView.frame.size.width, height: mainImageView.frame.size.height), blendMode: .normal, alpha: opacity)
    mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    tempImageView.image = nil
  }


}

