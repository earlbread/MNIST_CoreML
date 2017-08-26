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

