import AVFoundation
import UIKit

class ShootingVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var cameraManager: CameraManager?
    @IBOutlet var vwBackground: UIView!

    @IBOutlet var vwMethod2: UIView!
    @IBOutlet var vwCamera2: UIView!
    @IBOutlet var vwMethod1: UIView!
    @IBOutlet var vwCamera1: UIView!

    // view1
    @IBOutlet var vwTab1: UIView!
    @IBOutlet var lciv1Cell2Width: NSLayoutConstraint!

    // view2
    @IBOutlet var vwTab2: UIView!
    @IBOutlet var lciv2Cell2Width: NSLayoutConstraint!
    @IBOutlet var lciv3Cell2Width: NSLayoutConstraint!
    @IBOutlet var lcivCard2Leading: NSLayoutConstraint!
    @IBOutlet var lcivCard2Width: NSLayoutConstraint!

    // alert view
    @IBOutlet var vwAlert: UIView!
    @IBOutlet var lblAlert: UILabel!

    // temp
    @IBOutlet var lblLuxValue: UILabel!
    @IBOutlet var lblZoomValue: UILabel!

    // UIActivityIndicatorView
    var backgroundView : UIView?

    var pageType = "1" // "1" : A4 용지로 촬영, "2" : 블랑바이미카드로 촬영
    var jwt = ""
    var userId = 0

    var isFront = true
    var captureImg: UIImage?
    var isCheckPhoto = true // 사진을 촬영할 수 있는지 체크
    var alertMsg = "" // 오류메시지
    var deviceWidth = 0.0 // device width(cm)
    var isFirst = true
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async {
                self.initData()
                self.start()
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        cameraManager!.stopQRCodeDetection()
        cameraManager!.stopCaptureSession()
    }

    func initUI() {
        if pageType == "1" {
            vwTab1.isHidden = false
            vwTab2.isHidden = true
        } else {
            vwTab1.isHidden = true
            vwTab2.isHidden = false
        }

        vwMethod2.layer.cornerRadius = 20
        vwCamera2.layer.cornerRadius = 19
        vwMethod1.layer.cornerRadius = 20
        vwCamera1.layer.cornerRadius = 19

        vwAlert.layer.cornerRadius = 18

        lblLuxValue.text = ""
        lblZoomValue.text = ""

    }

    func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

    func getRulerWidth(type: Int) -> CGFloat {
        var result = 0.0

        if deviceWidth == 0.0 {
            return result
        }

        let mediaQuery = UIScreen.main.bounds.size
        let statusBarHeight = getStatusBarHeight()
        let width = mediaQuery.width - statusBarHeight
        if type == 1 {
            result = (width * 4) / deviceWidth
        } else if type == 2 {
            result = (width * 3.6) / deviceWidth
        } else if type == 3 {
            result = ((width - 100) * 6) / deviceWidth
        }

        return result
    }

    func initData() {
        let scale = UIScreen.main.scale
        let ppi = scale * ((UIDevice.current.userInterfaceIdiom == .pad) ? 132 : 163)
        let width = UIScreen.main.bounds.size.width * scale
        let height = UIScreen.main.bounds.size.height * scale
        let horizontal = width / ppi, vertical = height / ppi
        let widthInInches = sqrt(pow(horizontal, 2) + pow(vertical, 2))

        deviceWidth = widthInInches * 2.54
        print(deviceWidth)

        // view1  A4 용지로 촬영
        // Frame 816255.png  cell 2
        lciv1Cell2Width.constant = getRulerWidth(type: 1)

        // view2  블랑바이미카드로 촬영
        // Frame 816255.png  cell 2
        lciv2Cell2Width.constant = getRulerWidth(type: 1)
        // Frame 816258.png cell 3
        lciv3Cell2Width.constant = getRulerWidth(type: 2)
        // Rectangle 4.png  card
        lcivCard2Width.constant = getRulerWidth(type: 3)
        lcivCard2Leading.constant = (UIScreen.main.bounds.size.width - 100 - getRulerWidth(type: 3)) / 2

        NotificationCenter.default.addObserver(self, selector: #selector(ShootingVC.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    func dismiss(){
        hideActivityIndicator()
        self.dismiss(animated: false)
    }

    @objc func rotated() {
        DispatchQueue.main.async {
            if self.cameraManager! != nil {
                if self.isFirst {
                    self.isFirst = false
                    self.cameraManager!.zoom(CGFloat(2.0))
                }
                self.cameraManager!.resetOrientation()
            }
        }
    }

    func start() {
        cameraManager = CameraManager()
        cameraManager!.shouldEnableExposure = true
        cameraManager!.writeFilesToPhoneLibrary = false
        cameraManager!.shouldFlipFrontCameraImage = false
        cameraManager!.showAccessPermissionPopupAutomatically = true
        cameraManager!.shouldKeepViewAtOrientationChanges = false
        cameraManager!.shouldRespondToOrientationChanges = false

        cameraManager!.cameraDevice = CameraDevice.front
        cameraManager?.currentInterfaceOrientation = view.window?.windowScene?.interfaceOrientation ?? .landscapeRight

//        cameraManager!.addPreviewLayerToView(vwBackground)
        //addPreviewLayerToView 비동기 처리
        cameraManager?.addLayerPreviewToView(vwBackground, newCameraOutputMode: .stillImage, completion: { [weak self] in
            guard let this = self, let cameraManager = this.cameraManager else{
                return
            }

            let output = AVCaptureVideoDataOutput()
            if (cameraManager.captureSession?.canAddOutput(output)) != nil {
                cameraManager.captureSession?.sessionPreset = .high
                cameraManager.captureSession?.addOutput(output)
                let VideoQueue = DispatchQueue(label: "VideoQueue")
                //            /*output*/.setSampleBufferDelegate(context.coordinator, queue: VideoQueue)
                output.setSampleBufferDelegate(self, queue: VideoQueue)
            }

            cameraManager.startRecordingVideo()
            cameraManager.zoom(CGFloat(2.0))
        })

    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        print("1111111111111111")
//        if let metadata = CMGetAttachment(sampleBuffer, key: kCGImagePropertyExifDictionary, attachmentModeOut: nil) {
//            if let fN = metadata["FNumber"] as? Double {
//                if let fT = metadata["ExposureTime"] as? Double {
//                    if let speedArr = metadata["ISOSpeedRatings"] as? NSArray {
//                        let calValue = UserDefaults.standard.double(forKey: "calvalue")
//                        let fS = speedArr[0] as! Double
//                        let lux = (fN * fN) / (fT * fS) * calValue
//                        print("========== " + String(lux))
//                        checkLuxValue(luxValue: lux)
//                    }
//                }
//            }
//        }
        let rawMetadata = CMCopyDictionaryOfAttachments(allocator: nil, target: sampleBuffer, attachmentMode: CMAttachmentMode(kCMAttachmentMode_ShouldPropagate))
        let metadata = CFDictionaryCreateMutableCopy(nil, 0, rawMetadata) as NSMutableDictionary
        let exifData = metadata.value(forKey: "{Exif}") as? NSMutableDictionary

        let FNumber: Double = exifData?["FNumber"] as! Double
        let ExposureTime: Double = exifData?["ExposureTime"] as! Double
        let ISOSpeedRatingsArray = exifData!["ISOSpeedRatings"] as? NSArray
        let ISOSpeedRatings: Double = ISOSpeedRatingsArray![0] as! Double
        let CalibrationConstant: Double = 50

        // Calculating the luminosity
        let luminosity: Double = (CalibrationConstant * FNumber * FNumber) / (ExposureTime * ISOSpeedRatings)
//        print("========== " + String(luminosity))
        checkLuxValue(luxValue: luminosity)
    }

    func _launchUrl() {
//        let tempUrl = "https://www.blancbyme.com/ai-curation?auth=" + jwt
//        guard let url = URL(string: tempUrl) else {
//            return // be safe
//        }
//
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url)
//        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: WebviewVC = storyboard.instantiateViewController(withIdentifier: "WebviewVC") as! WebviewVC
        vc.modalPresentationStyle = .fullScreen
        vc.jwt = jwt
        vc.delegate = self
        present(vc, animated: false)
    }

    func uploadImage() async {
        guard let data = captureImg?.jpegData(compressionQuality: 0.8) else {
            print("캡쳐 가져오기 실패")
            return
        }
        showActivityIndicator()

        do {
            let response: [PhotoData] = try await Net.uploadImage(uploadfile: data)
            if let id = response.first?.id {
                try await fetchAiCuration(toothId: id)
                TwoBtnContentPopup.show(self, content: "큐레이션이 완료되었습다.\n웹 페이지에서 결과 확인하실 수 있습니다.", btn1: "", btn2: "확인", okCallback: { [weak self] value in
                    self?.dismiss()
                })
            }
        } catch {
            TwoBtnContentPopup.show(self, content: "촬영 가이드에 맞게 다시 촬영해주세요.", btn1: "다시 촬영하기", btn2: "", okCallback: { [weak self] value in
                self?.hideActivityIndicator()
            })
        }
    }

    func fetchAiCuration(toothId:Int) async throws {
        let response: AiResponseData = try await Net.fetchAiCuration(jwt: self.jwt, userId: self.userId, toothId: toothId)

         if let error = response.error {
             // 에러가 있으면 throw로 에러를 던짐
             throw NSError(domain: "AI Curation Error", code: 1, userInfo: [NSLocalizedDescriptionKey: "AI 큐레이션에 실패하였습니다."])
         }
    }

    func saveImageToGallery() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            cameraManager!.capturePictureWithCompletion { result in
                switch result {
                case .failure(let error):
                    print("failed capture image")
                    continuation.resume(throwing: error)
                case .success(let content):
                    self.saveImage(img: content.asImage!)
                    continuation.resume()
                }
            }
        }
    }

    func saveImage(img: UIImage) {
        captureImg = img
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
    }

    func checkLuxValue(luxValue: Double) {
//        let value = self.cameraManager!.getZoomSacle().description
//        DispatchQueue.main.async {
//            self.lblLuxValue.text = "luxvalue : " + String(luxValue)
//            self.lblZoomValue.text = "zoom value : " + value
//        }

        if luxValue < 45 {
            isCheckPhoto = false
            if alertMsg != "" {
                return
            }
            alertMsg = "조금 더 밝은곳으로 이동해서 촬영해주세요"
        } else if luxValue > 350 {
            isCheckPhoto = false
            if alertMsg != "" {
                return
            }
            alertMsg = "조금 더 어두운곳으로 이동해서 촬영해주세요"
        } else {
            isCheckPhoto = true
            alertMsg = ""
        }

        DispatchQueue.main.async {
//            self.lblLuxValue.text = "luxvalue : " + String(luxValue)
//            self.lblZoomValue.text = "zoom value : " + value
            if self.alertMsg == "" {
                self.vwAlert.isHidden = true
            } else {
                self.vwAlert.isHidden = false
                self.lblAlert.text = self.alertMsg
            }
        }
    }

    /////////////////////////////////////////////////////

    // MARK: - Click Events

    /////////////////////////////////////////////////////
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: false)
    }

    @IBAction func onCameraRotate(_ sender: Any) {
        if isFront {
            isFront = false
            cameraManager!.cameraDevice = CameraDevice.back
        } else {
            isFront = true
            cameraManager!.cameraDevice = CameraDevice.front
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            DispatchQueue.main.async {
                self.cameraManager!.zoom(CGFloat(2.0))
            }
        }
    }

    @IBAction func onMethod(_ sender: Any) {

        MethodPopup.show(self) { _ in
            //
        }
    }

    @IBAction func onShooting(_ sender: Any) {
        if !isCheckPhoto {
            CommonUtil.showToast("촬영조건이 만족되지 않습니다.")
            return
        }
        Task {
            do {
                try await saveImageToGallery()
                TwoBtnContentPopup.show(self, content: "AI 치아미백 분석하기", btn1: "다시 촬영하기", btn2: "확인") { value in
                    print("선택 : \(value)")
                    if value == 2 {
                        //                self._launchUrl()
                        Task{
                            await self.uploadImage()
                        }
                    }
                }
            }
        }
    }
}

extension ShootingVC: WebviewVCDelegate {
    func exitVC() {
        cameraManager!.resumeCaptureSession()
    }
}

extension ShootingVC {
    func showActivityIndicator() {

        if backgroundView == nil {
            backgroundView = UIView()
        }
        guard let backgroundView = backgroundView else { return }

        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.startAnimating()
        loadingIndicator.color = .white

        backgroundView.layer.cornerRadius = 05
        backgroundView.clipsToBounds = true
        backgroundView.isOpaque = false
        backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.6)

        backgroundView.frame = CGRectMake(0, 0, 70, 70)
        backgroundView.center = self.view.center

        DispatchQueue.main.async {
            self.view.addSubview(backgroundView)
            backgroundView.addSubview(loadingIndicator)

            NSLayoutConstraint.activate([
                loadingIndicator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                loadingIndicator.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
                loadingIndicator.widthAnchor.constraint(equalToConstant: 50),
                loadingIndicator.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }

    func hideActivityIndicator(){
        DispatchQueue.main.async {
            if let backgroundView = self.backgroundView {
                backgroundView.removeFromSuperview()
                self.backgroundView = nil
            }
        }
    }
}
