//
//  AirController.swift
//  aircontrollerapp
//
//  Created by sibata keisuke on 2015/10/03.
//  Copyright © 2015年 shibata. All rights reserved.
//

import WatchKit
import Foundation

class AirController: WKInterfaceController {
	
	@IBOutlet var StatusLabel: WKInterfaceLabel!
	var task: NSURLSessionDataTask?
	
	override func willActivate() {
		self.Set("");
		super.willActivate()
	}
	
	@IBAction func OnAction() {
		self.Set("on");
	}
	
	@IBAction func OffAction() {
		self.Set("off");
	}
	private func Set(type:String){
		
		let url = NSURL(string:"http://wanwanland.dip.jp//index.php?type="+type)!
		let conf = NSURLSessionConfiguration.defaultSessionConfiguration()
		let session = NSURLSession(configuration: conf)
		print(url);
		self.task = session.dataTaskWithURL(url) { (data, res, error) -> Void in
			if let e = error {
				print("dataTaskWithURL fail: \(e.debugDescription)")
				return
			}
			if let d = data {
				print(d)
				do{
					let dict = try NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
					var text = dict["text"]
					//self.StatusLabel.setAttributedText(text as! String?)
					print(text as! String)
					self.StatusLabel.setText(text as! String)
					
				}catch{
					print("error")
				}

				
			}
		}
		task!.resume()
	}

	override func didDeactivate() {
		super.didDeactivate()
	}
}

