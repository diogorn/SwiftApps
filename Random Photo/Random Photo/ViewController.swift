//
//  ViewController.swift
//  firstApp
//
//  Created by Diogo Neto on 25/04/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imaveView: UIImageView!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        return imageView
    } ()
    private let button: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    } ()
    let colors: [UIColor] = [.systemPink,.systemRed,.systemBlue,.systemCyan,.systemFill,.systemGray2,.systemMint,.systemTeal,.systemBrown,
.systemIndigo,.systemOrange,.systemPurple,.systemYellow
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.randomElement()
        view.addSubview(imageView)
        imageView.frame = CGRect (x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
     
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton (){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.width-60,
                              height: 55)
    }
    
    

    
    
    func getRandomPhoto (){
        let urlString =
            "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    
}

