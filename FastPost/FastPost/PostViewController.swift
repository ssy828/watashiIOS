import UIKit

class PostViewController: UIViewController {
  
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var contentTextView: UITextView!
  
  @IBOutlet weak var mainImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
}

extension PostViewController {
  
  @IBAction private func didTapDoneButton(_ sender: UIButton) {
    guard let text = titleTextField.text, !text.isEmpty else { return }
    
    PostService.uploadPost(
      title: text,
      image: mainImageView.image) { isSuccess in
        
        print(isSuccess)
        
    }
  }
  
  @IBAction private func didTapAddPhotoButton(_ sender: UIButton) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    imagePicker.sourceType = .photoLibrary
    self.present(imagePicker, animated: true, completion: nil)
      }
}

extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [String : Any]
  ) {
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.mainImageView.image = image
    picker.dismiss(animated: true, completion: nil)
  }
}

