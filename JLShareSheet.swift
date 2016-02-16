//
//  JLShareSheet.swift
//  JLShareSheet
//
//  Created by Jinhuan Li on 1/18/16.
//  Copyright © 2016 likers33. All rights reserved.
//

import Foundation
import UIKit


let deviceWidth = UIScreen.mainScreen().bounds.width
let deviceHeight = UIScreen.mainScreen().bounds.height
let scaleNum = deviceWidth/320
let device = UIDevice.currentDevice().model

class JLShareSheet: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor()
    }
}



protocol ShareActionDelegate {
    func didFinishShareWithResult(isSuccess: Bool)
}

class ShareActions: NSObject {
    
    var delegate: ShareActionDelegate?
    private var superViewController: UIViewController
    private var superView: UIView
    
    let shadowView = UIView()
    let shadowViewBot = UIView()
    
    init(controller: UIViewController, view: UIView) {
        self.superViewController = controller
        self.superView = view
    }
    
    func buildShareSheet() {
        initShadowView()
        self.superViewController.view.addSubview(shadowView)
        self.superViewController.view.addSubview(shadowViewBot)
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.topAnchor.constraintEqualToAnchor(superView.topAnchor, constant: 0).active = true
        shadowView.leftAnchor.constraintEqualToAnchor(superView.leftAnchor, constant: 0).active = true
        shadowView.rightAnchor.constraintEqualToAnchor(superView.rightAnchor, constant: 0).active = true
        shadowView.heightAnchor.constraintEqualToConstant(deviceHeight-160*scaleNum-10).active = true
        
        shadowViewBot.translatesAutoresizingMaskIntoConstraints = false
        shadowViewBot.leftAnchor.constraintEqualToAnchor(superView.leftAnchor, constant: 0).active = true
        shadowViewBot.rightAnchor.constraintEqualToAnchor(superView.rightAnchor, constant: 0).active = true
        shadowViewBot.bottomAnchor.constraintEqualToAnchor(superView.bottomAnchor, constant: 0).active = true
        shadowViewBot.heightAnchor.constraintEqualToConstant(160*scaleNum+10).active = true
        
        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.shadowView.alpha = 0.6;
            self.shadowViewBot.alpha = 0.6;
            }, completion: nil)
//
//        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
//            self.mShareSheet.center.y -= 160*scaleNum
//            }, completion: nil)
    
    }
    
    func initShadowView() {
        shadowView.backgroundColor = UIColor.blackColor()
        shadowViewBot.backgroundColor = UIColor.blackColor()
        shadowView.alpha = 0
        shadowViewBot.alpha = 0
        
        //tap gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("shadowViewTapped:"))
        shadowView.userInteractionEnabled = true
        shadowView.addGestureRecognizer(tapGestureRecognizer)
        
        //swipe  gesture
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("shadowViewSwiped:"))
        shadowView.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    func showShareSheet() {
        
    }
    
    func hideShareSheet() {
        
    }
    
    func shareToSocial(shareDic: [String: AnyObject], controller: UIViewController) {
        let mController = controller
//        switch (shareDic["name"] as! Int){
//        case 100:
//            shareToFacebook(shareDic, controller: mController)
//        case 101:
//            shareToTwitter(shareDic, controller: mController)
//        case 102:
//            shareToWeChat(shareDic, controller: mController)
//        default: break
//        }
        
    }
    
    
//    // MARK: - Facebook Share
//    func shareToFacebook(shareDic: [String: AnyObject], controller: UIViewController) {
//        print("facebook")
//        let fbsharecontent = FBSDKShareLinkContent()
//        fbsharecontent.contentURL = NSURL(string: shareDic["url"] as! String)
//        fbsharecontent.imageURL = NSURL(string: shareDic["imageUrl"] as! String)
//        fbsharecontent.contentTitle = shareDic["title"] as! String
//        fbsharecontent.contentDescription = shareDic["description"] as! String
//        FBSDKShareDialog.showFromViewController(controller, withContent: fbsharecontent, delegate: self)
//    }
//    
//    func sharer(sharer: FBSDKSharing!, didCompleteWithResults results: [NSObject : AnyObject]!) {
//        if (results.count > 0) {
//            print("YES")
//            delegate!.didFinishShareWithResult(true)
//        }
//    }
//    func sharer(sharer: FBSDKSharing!, didFailWithError error: NSError!) {
//        print("NO")
//        delegate!.didFinishShareWithResult(false)
//    }
//    func sharerDidCancel(sharer: FBSDKSharing!) {
//        print("NO")
//        delegate!.didFinishShareWithResult(false)
//    }
//    
//    
//    // MARK: - Twitter Share
//    func shareToTwitter(shareDic: [String: AnyObject], controller: UIViewController) {
//        print("twitter")
//        if(SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)) {
//            let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
//            vc.setInitialText(shareDic["description"] as! String)
//            vc.addImage(UIImage(named: "AppIcon"))
//            vc.addURL(NSURL(string: shareDic["url"] as! String))
//            controller.presentViewController(vc, animated: true, completion: { () -> Void in
//                self.delegate!.didFinishShareWithResult(true)
//            })
//        } else {
//            let alertController = UIAlertController(title: "Remind".localized, message: "NoTwitter".localized, preferredStyle: .Alert)
//            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
//                // ...
//            }
//            alertController.addAction(OKAction)
//            controller.presentViewController(alertController, animated: true) {
//                // ...
//            }
//            self.delegate!.didFinishShareWithResult(false)
//        }
//    }
//    
//    
//    // MARK: - WeChat Share
//    func shareToWeChat(shareDic: [String: AnyObject], controller: UIViewController) {
//        print("wechat")
//        if WXApi.isWXAppInstalled() {
//            let message = WXMediaMessage()
//            let webObj = WXWebpageObject()
//            let imageData = NSData(contentsOfURL: NSURL(string: shareDic["imageUrl"] as! String)!)
//            
//            webObj.webpageUrl = shareDic["url"] as! String
//            message.mediaObject = webObj
//            message.thumbData = imageData
//            message.title = shareDic["title"] as! String
//            message.description = shareDic["description"] as! String
//            
//            let req = SendMessageToWXReq()
//            req.bText = false
//            req.message = message
//            req.scene = 1
//            WXApi.sendReq(req)
//            
//        } else {
//            let alertController = UIAlertController(title: "Remind".localized, message: "NoWeChat".localized, preferredStyle: .Alert)
//            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
//                // ...
//            }
//            alertController.addAction(OKAction)
//            controller.presentViewController(alertController, animated: true) {
//                // ...
//            }
//        }
//    }
}