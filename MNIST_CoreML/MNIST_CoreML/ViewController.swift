//
//  ViewController.swift
//  MNIST_CoreML
//
//  Created by Seunghun Lee on 2017-08-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit
import Vision
import CoreML

class ViewController: UIViewController {
  @IBOutlet weak var drawView: DrawView!
  @IBOutlet weak var predictionLabel: UILabel!
  @IBOutlet weak var confidenceLabel: UILabel!

  let model = mnist()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    hiddenLabels()
  }

  @IBAction func resetCanvas(_ sender: UIButton) {
    drawView.lines = []
    drawView.setNeedsDisplay()
    hiddenLabels()
  }

  @IBAction func predictNumber(_ sender: UIButton) {
    let context = drawView.getViewContext()
    guard let image = context?.makeImage() else {
      return
    }



    func resultHandler(request: VNRequest, error: Error?) {
      guard let results = request.results as? [VNClassificationObservation]
        else { fatalError("huh") }

      if let prediction = results.first {
        DispatchQueue.main.async {
          self.predictionLabel.text = "The number is \(prediction.identifier)"
          self.confidenceLabel.text = "Confidence = \(prediction.confidence)"
        }
      }
    }
    let vnmodel = try! VNCoreMLModel(for: model.model)
    let request = VNCoreMLRequest(model: vnmodel, completionHandler: resultHandler)
    let handler = VNImageRequestHandler(cgImage: image)
    try! handler.perform([request])

    showLabels()
  }

  private func hiddenLabels() {
    predictionLabel.isHidden = true
    confidenceLabel.isHidden = true
  }

  private func showLabels() {
    predictionLabel.isHidden = false
    confidenceLabel.isHidden = false
  }
}

