//
//  TwoBtnContentPopup.swift
//  Blanc
//

import UIKit

class TwoBtnContentPopup: BaseDialog {
    @IBOutlet var lblContent: UILabel!
    @IBOutlet var lblButton1: UILabel!
    @IBOutlet var lblButton2: UILabel!
    
    @IBOutlet weak var vwButtonParent: UIView!
    @IBOutlet var vwButton1: UIView!
    @IBOutlet var vwButton2: UIView!
    
    var widthConstraintView1: NSLayoutConstraint!
    var centerConstraintView1: NSLayoutConstraint!
    var widthConstraintView2: NSLayoutConstraint!
    var centerConstraintView2: NSLayoutConstraint!
        
    public typealias callback = (_ value: Int) -> Void
    var cbOk: callback!

    var mContent = ""
    var mButton1 = ""
    var mButton2 = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    convenience init(content: String, btn1: String, btn2: String, okCallback: callback! = nil) {
        self.init()

        cbOk = okCallback
        mContent = content
        mButton1 = btn1
        mButton2 = btn2
    }

    static func show(_ vc: UIViewController, content: String, btn1: String, btn2: String, okCallback: callback! = nil) {
        let vcSuggest = TwoBtnContentPopup(content: content, btn1: btn1, btn2: btn2, okCallback: okCallback)
        vcSuggest.modalPresentationStyle = .overCurrentContext
        vcSuggest.modalTransitionStyle = .crossDissolve
        vc.present(vcSuggest, animated: true, completion: nil)
    }

    func initUI() {
        vwButton1.layer.cornerRadius = 8
        vwButton1.layer.borderWidth = 1
        vwButton1.layer.borderColor = UIColor(hex: 0x5bd2c4).cgColor
        vwButton2.layer.cornerRadius = 8

        lblContent.text = mContent
        lblButton1.text = mButton1
        lblButton2.text = mButton2
        
        setupConstraints()
        
        if mButton2 == "" {
            showView1Only()
        } else if mButton1 == "" {
            showView2Only()
        }else{
            showBothViews()
        }
    }
    
    private func setupConstraints() {
        if widthConstraintView1 != nil {
            vwButton1.removeConstraint(widthConstraintView1)
        }
        if centerConstraintView1 != nil {
            vwButton1.removeConstraint(centerConstraintView1)
        }
        if widthConstraintView2 != nil {
            vwButton2.removeConstraint(widthConstraintView2)
        }
        if centerConstraintView2 != nil {
            vwButton2.removeConstraint(centerConstraintView2)
        }
        
        // Set new constraints for each view when only one is shown
        widthConstraintView1 = vwButton1.widthAnchor.constraint(equalTo: vwButtonParent.widthAnchor, multiplier: 0.42)
        centerConstraintView1 = vwButton1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        widthConstraintView2 = vwButton2.widthAnchor.constraint(equalTo: vwButtonParent.widthAnchor, multiplier: 0.42)
        centerConstraintView2 = vwButton2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    }
    
    func showView1Only() {
        vwButton2.isHidden = true
        vwButton1.isHidden = false
        
        // Activate the single-view constraints for View1
        NSLayoutConstraint.activate([widthConstraintView1, centerConstraintView1])
    }
    
    func showView2Only() {
        vwButton1.isHidden = true
        vwButton2.isHidden = false
        
        // Activate the single-view constraints for View2
        NSLayoutConstraint.activate([widthConstraintView2, centerConstraintView2])
    }
    
    func showBothViews() {
        vwButton1.isHidden = false
        vwButton2.isHidden = false
        
        // Deactivate single-view constraints
        NSLayoutConstraint.deactivate([widthConstraintView1, centerConstraintView1, widthConstraintView2, centerConstraintView2])
    }

    //////////////////////////////////////////

    // MARK: - Action

    //////////////////////////////////////////
    // 확인
    @IBAction func onClickLeft(_ sender: Any) {
        dismiss(animated: true, completion: nil)

        if cbOk != nil {
            cbOk(1)
        }
    }

    @IBAction func onClickRight(_ sender: Any) {
        dismiss(animated: true, completion: nil)

        if cbOk != nil {
            cbOk(2)
        }
    }
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )

        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

    func rgb() -> Int? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            //  (Bits 24-31 are alpha, 16-23 are red, 8-15 are green, 0-7 are blue).
            let rgb = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
            return rgb
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }

    var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return (h: h, s: s, b: b, a: a)
    }

    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
