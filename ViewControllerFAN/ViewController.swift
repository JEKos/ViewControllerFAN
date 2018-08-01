import UIKit
import FBAudienceNetwork

class ViewController: UIViewController, FBNativeAdDelegate {
    
    
    @IBOutlet weak var adplace: UIView!
    @IBOutlet weak var adIconImageView: FBAdIconView!
    @IBOutlet weak var adCoverMediaView: FBMediaView!
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adSocialContext: UILabel!
    @IBOutlet weak var adBodyLabel: UILabel!
    @IBOutlet weak var adCallToActionButton: UIButton!
    @IBOutlet weak var sponsoredLabel: UILabel!
    @IBOutlet weak var adChoicesView: FBAdChoicesView!
    
    var fbNativeAd: FBNativeAd!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fbNativeAd = FBNativeAd(placementID: "VID_HD_16_9_46S_APP_INSTALL#573525062847749_849997161867203")
        fbNativeAd.delegate = self
        
        fbNativeAd.loadAd()
        
    }
    
    func nativeAdDidLoad(_ nativeAd: FBNativeAd) {
        self.fbNativeAd = nativeAd
        self.showNativeAd()
    }
    
    func showNativeAd() {
        if ((fbNativeAd != nil) && self.fbNativeAd.isAdValid) {
            self.fbNativeAd.registerView(forInteraction: self.adplace, mediaView: self.adCoverMediaView, iconView: self.adIconImageView, viewController: self, clickableViews: [self.adCallToActionButton,self.adCoverMediaView])
            self.adTitleLabel.text = self.fbNativeAd.advertiserName
            self.adBodyLabel.text = self.fbNativeAd.bodyText
            self.adSocialContext.text = self.fbNativeAd.socialContext
            self.sponsoredLabel.text = self.fbNativeAd.sponsoredTranslation
            self.adCallToActionButton.setTitle(self.fbNativeAd.callToAction, for: .normal)
            self.adChoicesView.nativeAd = self.fbNativeAd
            self.adChoicesView.corner = .topRight
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

