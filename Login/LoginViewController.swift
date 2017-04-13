//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var pk: CGSize?
    var username: String?
    var password: String?
    
    var buttbutt: UIButton?
    var userTextField: UITextField?
    var passTextField: UITextField?
    
    // Constants used in the LoginViewController
    struct Constants {
        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"
        
    }

    // TODO: instantiate the views needed for your project
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIScreen.main.bounds.size
        let xval = (UIScreen.main.bounds.size.width / 2) - 100
        let yval = (UIScreen.main.bounds.size.height / 2) - 250
        //pk = CGSize.init(width: 100,height: 70)
        view.backgroundColor = Constants.backgroundColor
        let firstButton = UILabel(frame: CGRect(x: xval, y: yval, width: 200, height: 100))
        firstButton.numberOfLines = 0
        firstButton.text = "Snap Chat Login"
        firstButton.textColor = .white
        firstButton.font = UIFont(name: "HelveticaNeue", size: 35)
        firstButton.textAlignment = .center
        view.addSubview(firstButton)
        
        
        let image: UIImage = UIImage(named: "snowflakes_MentalHealth")!
        let bgImage = UIImageView(image: image)
        bgImage.frame = CGRect(x:xval,y:430,width:200,height:200)
        self.view.addSubview(bgImage)
        
        let image1: UIImage = UIImage(named: "blue")!
        let bgImage1 = UIImageView(image: image1)
        bgImage1.frame = CGRect(x:176,y:55,width:60,height:60)
        self.view.addSubview(bgImage1)
        
        
    
        print(value)
        print(yval)
        
        
        //let CGRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
        
        let yval2 = yval + 150
        let xval2 = (UIScreen.main.bounds.size.width / 2) - 190
        let newView = UIView(frame: CGRect(x: xval2 , y: yval2 , width: 380 , height: 160))
        newView.backgroundColor = UIColor.white
        view.addSubview(newView)
        
        userTextField = UITextField(frame: CGRect(x: 25 , y: 20, width:  330, height: 25))
        newView.addSubview(userTextField!)
        userTextField?.text = "Username"
        userTextField?.font = UIFont(name: "HelveticaNeue", size: 26)
        userTextField?.textColor = .gray
        userTextField?.autocapitalizationType = UITextAutocapitalizationType.none
        //userTextfield.backgroundColor = .red
        
     
        passTextField = UITextField(frame: CGRect(x: 25 , y: 60, width:  330, height: 25))
        newView.addSubview(passTextField!)
        passTextField?.text = "Password"
        passTextField?.autocapitalizationType = .none
        passTextField?.font = UIFont(name: "HelveticaNeue", size: 26)
        passTextField?.textColor = .gray
        //passTextfield.backgroundColor = .red
        
        buttbutt = UIButton(frame: CGRect(x: 80 , y: 100, width:  220, height: 40))
        newView.addSubview(buttbutt!)
        buttbutt?.backgroundColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        buttbutt?.setTitle("Login", for: .normal)
        buttbutt?.setTitleColor(.white, for: .normal)
        
//        password = passTextfield.text
//        username = userTextfield.text
        
        buttbutt?.addTarget(self, action: #selector(doWork), for: .touchUpInside)
        
        

        
        
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        
        // TODO: layout your views using frames or AutoLayout
    }
    
    // TODO: create an IBAction for your login button
    
    @IBAction func doWork(sender: UIButton) {
        print("Button tapped")
        authenticateUser(username: userTextField?.text, password: passTextField?.text)
        
    }
    
    
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
