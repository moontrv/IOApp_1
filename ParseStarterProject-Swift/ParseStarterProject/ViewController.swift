/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBAction func createAlert(sender: AnyObject) {
        if #available(iOS 8.0, *) {
            var alert = UIAlertController(title: "Hey there", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion:nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        activityIndicator.startAnimating()
        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }

    @IBAction func restore(sender: AnyObject) {
        activityIndicator.stopAnimating()
        //UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [NSObject: AnyObject]!) {
        print("Image Selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        importedImage.image = image
        
    }
    
    @IBOutlet var importedImage: UIImageView!
    @IBAction func importImage(sender: AnyObject) {
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        /*var product = PFObject(className: "Products")
        product["name"] = "Pizza"
        product["description"] = "Deliciously cheesy"
        product["price"] = 9.99
        product.saveInBackgroundWithBlock { (success, error) in
            if success == true{
                print("Object saved with ID \(product.objectId)")
            }else{
                print("Failed")
                print(error)
            }
        }*/
        
        /*var query = PFQuery(className: "Products")
        query.getObjectInBackgroundWithId("Oa7AYiCZ6s") { (object: PFObject?, error:NSError?) in
            if error != nil{
                print(error)
            }else if let product = object{
                //print(object)
                //print(object!.objectForKey("description"))
                product["description"] = "Rocky Road"
                product["price"] = 5.99
                product.saveInBackground()
            }
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
