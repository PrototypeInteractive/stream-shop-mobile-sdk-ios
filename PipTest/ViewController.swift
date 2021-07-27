//
//  ViewController.swift
//  PipTest
//
//  Created by Prototype on 09.07.2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {

//    private var window = UIWindow(frame: UIScreen.main.bounds)
    private var adsWindow: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func play() {
    
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window.backgroundColor = .red
//        window.windowLevel = UIWindow.Level.alert
//        window?.rootViewController = vc
//        let label = UILabel()
//        label.text = "asdajsdlas lsdkjf lskjdflk"
//        window?.addSubview(label)
//        label.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        window.isHidden = false
//        window.makeKeyAndVisible()
//        window?.rootViewController?.present(self, animated: true, completion: nil)
        
//        UIView.animate(withDuration: 0.3, delay: 0, options: []) { [unowned self] in
//            self.window?.alpha = 1
//        }
        createAdsWindow()
//        present(vc, animated: true, completion: nil)
    }
    func createAdsWindow(){
//        let frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 60, width: UIScreen.main.bounds.width, height: 60)
//        adsWindow = UIWindow.init(frame: frame)
//        adsWindow!.backgroundColor = .red
//        let adsViewController = UIViewController.init()
//        adsViewController.view.backgroundColor = .blue
//        adsWindow?.rootViewController = adsViewController
//        adsWindow?.windowLevel = UIWindow.Level(rawValue: 2)
//        adsWindow?.makeKeyAndVisible()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FluxPandaViewController") as! FluxPandaViewController
        
        if let currentWindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            adsWindow = UIWindow(windowScene: currentWindowScene)
        }
        adsWindow?.bounds = CGRect(x: 0, y: 0, width: 200, height: 300)
        adsWindow?.windowLevel = UIWindow.Level.alert
        adsWindow?.rootViewController = vc
        adsWindow?.makeKeyAndVisible()
    }
}
