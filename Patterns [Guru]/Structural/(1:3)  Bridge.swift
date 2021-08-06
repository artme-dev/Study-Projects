
protocol SharingService {
    func post()
}
class FaccebookSDK: SharingService {
    func post(){
        print("Posted via Facebook")
    }
}
class InstagramSDK: SharingService {
    func post(){
        print("Posted via Inst")
    }
}

protocol SharingSupportable {
    var sharingService: SharingService? { get set }
    func share()
}

class ImageController : SharingSupportable {
    var sharingService: SharingService?
    func share(){
        if let service = sharingService {
            print("Starting sharing the image")
            service.post()
        }

    }
}
class ParagraphController : SharingSupportable {
    var sharingService: SharingService?
    func share(){
        if let service = sharingService {
            print("Starting sharing the paragraph")
            service.post()
        }
    }
}

let fb = FaccebookSDK()
let inst = InstagramSDK()
    
let image = ImageController()
image.sharingService = fb
image.share()
image.sharingService = inst
image.share()

let paragraph = ParagraphController()
paragraph.sharingService = fb
paragraph.share()
paragraph.sharingService = inst
paragraph.share()
