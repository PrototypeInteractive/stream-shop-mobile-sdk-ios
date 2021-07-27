//
//  FluxPandaViewController.swift
//  PipTest
//
//  Created by Prototype on 10.07.2021.
//

import UIKit
import WebKit

class FluxPandaViewController: UIViewController {
    
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var sizeButton: UIButton!
    @IBOutlet private weak var fluxPandaView: WKWebView!
    
//    private var customTransitioningDelegate = FluxPandaTransitionDelegate()
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        configure()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        configure()
//    }
//
//    private func configure() {
//        modalPresentationStyle = .overCurrentContext
//        modalTransitionStyle = .crossDissolve
//        transitioningDelegate = customTransitioningDelegate
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.1
        
//        let configuration = WKWebViewConfiguration()
//        configuration.allowsInlineMediaPlayback = true

        fluxPandaView.configuration.userContentController.add(self, name: "mobilesdk")
        fluxPandaView.loadHTMLString("<html><head>" +
            "<script src=\"https://dist.flux.video/embed-sdk/1.0.0/embed-sdk.min.js\"></script>" +
            "<script>" +
            "    function initFluxPlayer() {\n" +
            "            FluxPlayer.init({\n" +
            "            apiKey: \"8xju5a2r26ckxgisbm6hct45fo4f7fwd\",\n" +
            "            channelId: \"groovy-hats\",\n" +
            "            onCheckout: function (data) {\n" +
            "               console.log(\"onCheckout\");\n" +
            "               window.webkit.messageHandlers.mobilesdk.postMessage(data);\n" +
            "            }\n" +
            "        }).then((initialized) => {\n" +
            "          FluxPlayer.open({\n" +
            "            sessionId: \"qbEGDITRwYTT61yJNBKx\",\n" +
            "            timeIndex: \"0\"\n" +
            "          });\n" +
            "        });" +
            "        }" +
            "    setTimeout(initFluxPlayer, 1000);" +
            "</script>" +
            "</head></html>", baseURL: nil)//(URLRequest(url: URL(string: "https://www.google.com")!))
    }
    
    @IBAction private func closeAction() {
        UIView.animate(withDuration: 0.3, delay: 0, options: []) { [unowned self] in
            self.view.window?.alpha = 0
        } completion: { [unowned self] completed in
            self.view.window?.isHidden = true
            self.view.window?.resignKey()
            self.view.removeFromSuperview()
        }
//        dismiss(animated: true, completion: nil)
    }

    @IBAction private func swapSizeAction() {
        if sizeButton.isSelected {
            sizeButton.isSelected = false
            sizeButton.setTitle("Minimize", for: .normal)
            let w = UIScreen.main.bounds.width
            let h = UIScreen.main.bounds.height
            UIView.animate(withDuration: 0.5, animations: {
                self.view.window?.frame = CGRect(x: 0,
                                                 y: 0,
                                                 width: w,
                                                 height: h)
            })
        }
        else {
            sizeButton.isSelected = true
            sizeButton.setTitle("Maximize", for: .normal)
            let w: CGFloat = 200
            let h: CGFloat = 300
            let m: CGFloat = 16
            let bottomInset = view.safeAreaInsets.bottom + m
            let xOffset = UIScreen.main.bounds.width - w - m
            let yOffset = UIScreen.main.bounds.height - bottomInset - h
            UIView.animate(withDuration: 0.5, animations: {
                self.view.window?.frame = CGRect(x: xOffset,
                                                 y: yOffset,
                                                 width: w,
                                                 height: h)
            })
            
        }
    }

}

// MARK: - WKScriptMessageHandler
extension FluxPandaViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let dict = message.body as? [String: Any] else {
            return
        }
        if message.name == "mobilesdk" {
            
        }
    }
    
}
//final class FluxPandaTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
//
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//        return PresentationController(presentedViewController: presented, presenting: presenting)
//    }
//}
//
//final class PresentationController: UIPresentationController {
//
//    override var frameOfPresentedViewInContainerView: CGRect {
//        let bounds = presentingViewController.view.bounds
//        let size = CGSize(width: 200, height: 100)
//        let origin = CGPoint(x: bounds.midX - size.width / 2, y: bounds.midY - size.height / 2)
//        return CGRect(origin: origin, size: size)
//    }
//
//    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
//        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
//
//        presentedView?.autoresizingMask = [
//            .flexibleTopMargin,
//            .flexibleBottomMargin,
//            .flexibleLeftMargin,
//            .flexibleRightMargin
//        ]
//
//        presentedView?.translatesAutoresizingMaskIntoConstraints = true
//    }
//}
