//
//  ViewController.swift
//  IOS101-Prework
//
//  Created by batman on 12/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    // array of 5 urls to dragon ball related images
    let imageURLs: [String] = [
            "https://www.austinchronicle.com/binary/5a85/dragon-ball-super-brolly.jpg",
            "https://assets-prd.ignimgs.com/2024/09/18/super-future-trunks-episode-battle-1726694745684.png",
            "https://i.pinimg.com/474x/50/33/fe/5033fe34d0754860c769174d6f8fd47e.jpg",
            "https://jonahwrites.blog/wp-content/uploads/2020/11/piccolo-ready-1.jpg?w=640",
            "https://s3assets.skimble.com/assets/1525307/image_full.jpg"
        ]
    
    // used to keep track of current index for image url
    var currentIndex = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = CGPoint(x: view.center.x, y: view.frame.height - 200)
        view.addSubview(imageView)
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomColor = changeColor()
        view.backgroundColor = randomColor
        
        currentIndex = (currentIndex + 1) % imageURLs.count
        loadImage(from: imageURLs[currentIndex], into: imageView)
    }
    func changeColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
    
    func loadImage(from urlString: String, into imageView: UIImageView) {
            guard let url = URL(string: urlString) else { return }
            
            // Download on a background thread
            DispatchQueue.global().async {
                // Attempt to get the data from URL
                if let data = try? Data(contentsOf: url),
                   let image = UIImage(data: data) {
                    // Once you have the UIImage, update the UIImageView on the main thread
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            }
    }
}
