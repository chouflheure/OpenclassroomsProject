//
//  ViewController.swift
//  P4_01_Xcode
//
//  Created by charles Calvignac on 21/10/2021.
//

import UIKit
import PhotosUI
import MobileCoreServices
import AVKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontPolice()
        viewSquareTopLeft.backgroundColor = .white
        viewSquareTopRight.backgroundColor = .white
        viewRectangleTop.backgroundColor = .white
        viewRectangleBottom.backgroundColor = .white
        viewSquareBottomLeft.backgroundColor = .white
        viewSquareBottomRight.backgroundColor = .white
    }
    
// MARK: - Variable
    
    var id = Int()
    var imagePicker = UIImagePickerController()
    var image0 = UIImage()
    var image1 = UIImage()
    var image2 = UIImage()
    var scenario = 1
    
// MARK: - Outlet
    
    @IBOutlet weak var Instagrid: UILabel!
    @IBOutlet weak var swipeLabelLeft: UILabel!
    @IBOutlet weak var swipeLabelUp: UILabel!
    @IBOutlet var globalView: UIView!
    @IBOutlet weak var parentView: UIView!
    
    
    
    // Layout
    @IBOutlet weak var selectedLeft: UIImageView!
    @IBOutlet weak var selectedMiddle: UIImageView!
    @IBOutlet weak var selectedRight: UIImageView!
    
    // View square top left
    @IBOutlet weak var viewSquareTopLeft: UIView!
    @IBOutlet weak var viewAddSquareTopLeft: UIImageView!
    // View square top right
    @IBOutlet weak var viewSquareTopRight: UIView!
    @IBOutlet weak var viewAddSquareTopRight: UIImageView!
    
    // View square bottom right
    @IBOutlet weak var viewSquareBottomRight: UIView!
    @IBOutlet weak var viewAddSquareBottomRight: UIImageView!
    
    // View square bottom left
    @IBOutlet weak var viewSquareBottomLeft: UIView!
    @IBOutlet weak var viewAddSquareBottomLeft: UIImageView!
    
    // View rectangle top
    @IBOutlet weak var viewRectangleTop: UIView!
    @IBOutlet weak var viewAddRectangleTop: UIImageView!
    
    // View rectangle bottom
    @IBOutlet weak var viewRectangleBottom: UIView!
    @IBOutlet weak var viewAddRectangleBottom: UIImageView!
    
    // Swipe View
    @IBOutlet weak var swipeUpView: UIView!
    @IBOutlet weak var swipeLeftView: UIView!
    
    func display(image: UIImage? = nil) {
        var imageModifed = image
        switch id {
            case 1:
                imageModifed = resizeImage(image: image!, newHeight: viewSquareTopLeft.frame.height, newWidth: viewSquareTopLeft.frame.width)
                guard let imageModified = imageModifed else {return}
                viewSquareTopLeft.backgroundColor = UIColor(patternImage: imageModified)
                viewAddSquareTopLeft.isHidden = true
                viewSquareBottomLeft.backgroundColor = UIColor(patternImage: imageModified)
                viewAddSquareBottomLeft.isHidden = true
                image0 = imageModified
            case 2:
                imageModifed = resizeImage(image: image!, newHeight: viewSquareTopRight.frame.height, newWidth: viewSquareTopRight.frame.width)
                guard let imageModified1 = imageModifed else {return}
                viewSquareTopRight.backgroundColor = UIColor(patternImage: imageModified1)
                viewAddSquareTopRight.isHidden = true
                viewSquareBottomRight.backgroundColor = UIColor(patternImage: imageModified1)
                viewAddSquareBottomRight.isHidden = true
                image1 = imageModified1
            case 3:
                imageModifed = resizeImage(image: image!, newHeight: viewRectangleTop.frame.height, newWidth: viewRectangleTop.frame.width)
                guard let imageModified2 = imageModifed else {return}
                viewRectangleTop.backgroundColor = UIColor(patternImage: imageModified2)
                viewAddRectangleTop.isHidden = true
                viewRectangleBottom.backgroundColor = UIColor(patternImage: imageModified2)
                viewAddRectangleBottom.isHidden = true
                image2 = imageModified2
            default:
                print("error")
        }
    }
   
   
    private func resizeImage(image: UIImage, newHeight: CGFloat, newWidth: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
   
}

extension ViewController {

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            swipeUpView.isHidden = true
            swipeLeftView.isHidden = false
            fontPolice()
        } else {
            print("Portrait")
            swipeUpView.isHidden = false
            swipeLeftView.isHidden = true
            fontPolice()
        }
    }
    
    
    // MARK: - Font
    
    private func fontPolice(){
        let delm = UIFont(name: "Delm-Regular", size: 17)
        let ThirstySoftW01 = UIFont(name: "ThirstySoftW01-Regular", size: 40)
        Instagrid.font = UIFontMetrics.default.scaledFont(for: ThirstySoftW01!)
        Instagrid.isHidden = true
        swipeLabelUp.font = UIFontMetrics.default.scaledFont(for: delm!)
        swipeLabelLeft.font = UIFontMetrics.default.scaledFont(for: delm!)
    }

    
// MARK: - View
    
    private func hidenWiew(selectScenario: Int){
        switch selectScenario {
            case 0:
                viewRectangleBottom.isHidden = true
                viewSquareBottomRight.isHidden = false
                viewRectangleTop.isHidden = false
                viewSquareBottomLeft.isHidden = false
                viewSquareTopRight.isHidden = true
                viewSquareTopLeft.isHidden = true
                
            case 1:
                viewRectangleBottom.isHidden = false
                viewSquareBottomRight.isHidden = true
                viewSquareTopRight.isHidden = false
                viewRectangleTop.isHidden = true
                viewSquareBottomLeft.isHidden = true
                viewSquareTopLeft.isHidden = false
                
            case 2:
                viewRectangleBottom.isHidden = true
                viewSquareBottomRight.isHidden = false
                viewSquareBottomLeft.isHidden = false
                viewSquareTopRight.isHidden = false
                viewRectangleTop.isHidden = true
                viewSquareTopLeft.isHidden = false
                
            default:
                print("pb")
        }
    }
    
    // MARK: - Action
    
    @IBAction func actionAddPictureSquareTopLeft(_ sender: UIButton) {
        id = 1
        selectOpenGaleryOrCamera(sender)
    }
    
    @IBAction func actionAddPictureSquareBottomLeft(_ sender: UIButton) {
        id = 1
        selectOpenGaleryOrCamera(sender)
    }
    
    @IBAction func actionAddPictureSquareTopRight(_ sender: UIButton) {
        id = 2
        selectOpenGaleryOrCamera(sender)
    }
    
    @IBAction func actionAddPictureSquareBottomRight(_ sender: UIButton) {
        id = 2
        selectOpenGaleryOrCamera(sender)
    }
    
    @IBAction func actionAddPictureRectangleBottom(_ sender: UIButton) {
        id = 3
        selectOpenGaleryOrCamera(sender)
    }
    
    @IBAction func actionAddPictureRectangleTop(_ sender: UIButton) {
        id = 3
        selectOpenGaleryOrCamera(sender)
    }

    func selectOpenGaleryOrCamera(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in self.openCamera() }))
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in self.presentPicker() }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender
            alert.popoverPresentationController?.sourceRect = sender.bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        self.present(alert, animated: true, completion: nil)
    }
    
// MARK: - Layout

    @IBAction func btnChangeLeft() {
        scenario = 0
        selectOnOff(select: selectedLeft, selectScenario: scenario)
    }
    
    @IBAction func btnChangeMiddle() {
        scenario = 1
        selectOnOff(select: selectedMiddle, selectScenario: scenario)
    }
    
    @IBAction func btnChangeRight() {
        scenario = 2
        selectOnOff(select: selectedRight, selectScenario: scenario)
    }
    
    private func selectOnOff(select: UIImageView, selectScenario: Int){
        let arraySelect = [selectedLeft!,selectedMiddle!,selectedRight!]
        if select.isHidden == true{
            for i in 0...2 {
                if arraySelect[i].isHidden == false { arraySelect[i].isHidden = true  }
            }
            select.isHidden = false
            hidenWiew(selectScenario: selectScenario)
        }
    }
}

// MARK: - Photo Library

extension ViewController: PHPickerViewControllerDelegate{
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        if !results.isEmpty { managePHPickerResult(results: results) }
    }
    
    func presentPicker() {
        // Create configuration for photo picker
        var configuration = PHPickerConfiguration()
        
        // Specify type of media to be filtered or picked. Default is all
        configuration.filter = .any(of: [.images])
        configuration.filter = .none
        
        // For unlimited selections use 0. Default is 1
        configuration.selectionLimit = 1
        
        // Create instance of PHPickerViewController
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func managePHPickerResult(results : [PHPickerResult]) {
        guard let itemProvider = results.first?.itemProvider else { return }

        // Parse Image
        if itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    if let image = image as? UIImage{   self.display(image: image)  }
                    else {  self.display(image: UIImage(systemName: "exclamationmark.circle"))  }
                }
            }
        }
    }
}

extension ViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera with the simulator", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else { return }
        display(image: image)
    }
}


// MARK: - Share

extension ViewController {
    @IBAction func shareUp(_ sender: Any) {
        moveSwipe(scenario: 0)
        swipeUpView.isHidden = true
        share(orientation : 0)
    }
    
    @IBAction func shareLeft(_ sender: Any) {
        moveSwipe(scenario: 2)
        swipeLeftView.isHidden = true
        share(orientation : 1)
    }
    
    func imageShare() -> [UIImage]{
        var arrayPicture = [UIImage()]
        print("scenario \(scenario)")
        for i in arrayPicture.count-1 ... 0 {
            arrayPicture.remove(at: i)
        }
        switch scenario {
            case 0:
                if image0.size.height != 0.0 { arrayPicture.append(image0)}
                if image1.size.height != 0.0 { arrayPicture.append(image1)}
                if image2.size.height != 0.0 { arrayPicture.append(image2)}
            case 1:
                if image0.size.height != 0.0 { arrayPicture.append(image0)}
                if image1.size.height != 0.0 { arrayPicture.append(image1)}
                if image2.size.height != 0.0 { arrayPicture.append(image2)}
            case 2:
                if image0.size.height != 0.0 { arrayPicture.append(image0); arrayPicture.append(image0)}
                if image1.size.height != 0.0 { arrayPicture.append(image1); arrayPicture.append(image1)}
            default:
                print("error")
        }
        return arrayPicture
    }
    
    func share(orientation: Int ){
        let shareData = imageShare()
        print(shareData)
        let activityViewController = UIActivityViewController(activityItems: shareData, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = globalView
        activityViewController.excludedActivityTypes =
        [
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.postToVimeo,
        ]
        self.present(activityViewController, animated: true, completion: nil)
        activityViewController.completionWithItemsHandler = {
            activity, success, items, error in
            if !success && orientation == 0 || success && orientation == 0 { self.moveSwipe(scenario: 1); self.swipeUpView.isHidden = false }
            if !success && orientation == 1 || success && orientation == 1 { self.moveSwipe(scenario: 1); self.swipeLeftView.isHidden = false }
        }
        
    }
    
    func moveSwipe(scenario: Int) {
        switch scenario {
            case 0:
                UIView.animate(withDuration: 0.6,  delay: 0,
                               options: [.curveEaseInOut , .allowUserInteraction],
                               animations: { self.parentView.transform = CGAffineTransform(translationX: 0, y: 0 - self.view.frame.height) },
                               completion: nil)
            case 1:
                UIView.animate(withDuration: 0.6,
                               delay: 0,
                               options: [.curveEaseInOut , .allowUserInteraction],
                               animations: { self.parentView.transform = CGAffineTransform(translationX: 0, y: 0)},
                               completion: nil)
            case 2:
                UIView.animate(withDuration: 0.6,
                               delay: 0,
                               options: [.curveEaseInOut , .allowUserInteraction],
                               animations: { self.parentView.transform = CGAffineTransform(translationX: 0 - self.view.frame.width, y: 0)},
                               completion: nil)
            default:
                UIView.animate(withDuration: 0.6,
                               delay: 0,
                               options: [.curveEaseInOut , .allowUserInteraction],
                               animations: { self.parentView.transform = CGAffineTransform(translationX: 0, y: 0)},
                               completion: nil)
        }
    }
}
