//
//  ViewController.swift
//  day4_shree_QRGeneratorExample
//
//  Created by Bishal on 3/28/20.
//  Copyright © 2020 Bishal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var editTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generate(_ sender: AnyObject) {
    let image = generateQRImage(from: editTextField.text!)
    ImageView.image = image
    
    }
    
    func generateQRImage(from text:String) -> UIImage?{
    let data = text.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
        filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y:3)
            if let output = filter.outputImage?.applying(transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}

