//
//  ViewController.swift
//  MultiPage
//
//  Created by Adarsh Vincent on 11/1/20.
//

import UIKit

struct Constants {
    
    static let firstButton = 1
}

class RootController: UIViewController {

    var firstViewController : FirstViewController?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    
    @IBAction func switchViews(_ sender: UIButton){
        let tag = sender.tag;
        
        if(tag == Constants.firstButton) {
            if (firstViewController == nil) {
                firstViewController = (self.storyboard?.instantiateViewController(identifier: "First") as! FirstViewController )
            }
        }
        
        if (tag == Constants.firstButton) {
            firstViewController?.view.frame = view.frame
            switchToViewController(firstViewController)
            
        }
    }
    
    func switchToViewController(_ toVC: UIViewController?) {
        if (toVC != nil) {
            addChild((toVC)!)
            view.addSubview((toVC?.view)!)
            toVC?.didMove(toParent: self )
            
            
        }
    }
    
    
    var socketConnector:SocketDataManager!
    @IBOutlet weak var ipAddressField: UITextField!
    @IBOutlet weak var portField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var messageHistoryView: UITextView!
    @IBOutlet weak var connectBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabl: UILabel!
    
    var sd = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        socketConnector = SocketDataManager(with: self)
        resetUIWithConnection(status: false)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func connect(){
        //http://localhost:50694/
//        guard let ipAddr = ipAddressField.text, let portVal = portField.text  else {
//            return
//        }
        let soc = DataSocket(ip:"192.168.43.7", port: "10101")
        socketConnector.connectWith(socket: soc)
        
    }
    @IBAction func send(){
        guard let msg = messageField.text else {
            return
        }
        send(message: msg)
        messageField.text = ""
    }
    func send(message: String){
        
        socketConnector.send(message: message)
        update(message: "me:\(message)")
    }
    

    @IBAction func passData(_ sender: Any) {
        sd = socketConnector.messageRecievedView
        performSegue(withIdentifier: "name", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FirstViewController
        vc.messageRoot = sd
        print(vc.messageRoot)
    }
}

extension RootController: PresenterProtocol{
    
    func resetUIWithConnection(status: Bool){
        
//        ipAddressField.isEnabled = !status
//        portField.isEnabled = !status
//        messageField.isEnabled = status
        connectBtn.isEnabled = !status
//        sendBtn.isEnabled = status
//
        if (status){
            updateStatusViewWith(status: "Connected")
        }else{
            updateStatusViewWith(status: "Disconnected")
        }
    }
    func updateStatusViewWith(status: String){
        
//        statusLabl.text = status
    }
    
    func update(message: String){
        
//        if let text = messageHistoryView.text{
//            let newText = """
//            \(text)
//            \(message)
//            """
//            messageHistoryView.text = newText
//        }else{
//            let newText = """
//            \(message)
//            """
//            messageHistoryView.text = newText
//        }

//        let myRange=NSMakeRange(messageHistoryView.text.count-1, 0);
//        messageHistoryView.scrollRangeToVisible(myRange)

        
    }

    
}
