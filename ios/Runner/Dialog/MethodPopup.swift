//
//  MethodPopup.swift
//  Blanc
//

import UIKit

class MethodPopup: BaseDialog {
    @IBOutlet weak var vwNum1: UIView!
    @IBOutlet weak var vwNum2: UIView!
    @IBOutlet weak var vwNum3: UIView!
    
    @IBOutlet weak var btnConfirm: UIButton!
    
    public typealias callback = (_ value: String) -> Void
    var cbOk: callback!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    convenience init(okCallback: callback! = nil) {
        self.init()

        cbOk = okCallback
    }

    static func show(_ vc: UIViewController, okCallback: callback! = nil) {
        let vcSuggest = MethodPopup(okCallback: okCallback)
        vcSuggest.modalPresentationStyle = .overCurrentContext
        vcSuggest.modalTransitionStyle = .crossDissolve
        vc.present(vcSuggest, animated: true, completion: nil)
    }

    func initUI() {
        vwNum1.layer.cornerRadius = 8
        vwNum2.layer.cornerRadius = 8
        vwNum3.layer.cornerRadius = 8
        btnConfirm.layer.cornerRadius = 10
    }

    //////////////////////////////////////////

    // MARK: - Action

    //////////////////////////////////////////
    @IBAction func onClickRight(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
