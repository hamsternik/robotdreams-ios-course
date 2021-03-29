import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// ----------------------------------------------------------

enum ExecutionFlow {
    case sync
    case async
}

/// # Execute sync task on background queue
func testSyncTaskExecution() {
    DispatchQueue.global().sync {
        print("Sync task has been executed")
    }
    print("Execute code on the `source` queue")
}


/// # Execute async task on background queue
func testAsyncTaskExecution() {
    DispatchQueue.global().async {
        print("Async task has been executed")
    }
    print("Execute code on the `source` queue")
}

let executionFlow: ExecutionFlow = .sync
switch executionFlow {
case .sync:
    testSyncTaskExecution()
case .async:
    testAsyncTaskExecution()
}

// ----------------------------------------------------------

/// Similar to the `UIImage` class
class Image {
    private let data: Data
    init?(data: Data) {
        guard data.isEmpty == false else { return nil }
        self.data = data
    }
}

func upscaleAndFilter(image: Image) -> Image {
    Thread.sleep(until: Date(timeIntervalSinceNow: 3))
    return image
}

func processImage(data: Data) -> Image? {
    guard let image = Image(data: data) else { return nil }
    /// calling an expensive function
    let processedImage = upscaleAndFilter(image: image)
    return processedImage
}

let imageProcessingQueue = DispatchQueue(label: "com.lecture13-project.image-processing")

/// Incorrect code based on async execution
//func processImageAsync(data: Data) -> Image? {
//    guard let image = Image(data: data) else { return nil }
//    imageProcessingQueue.async {
//        let processedImage = upscaleAndFilter(image: image)
//        return processedImage
//    }
//}

func processImageAsync(data: Data, completion: @escaping (Image?) -> Void) {
    guard let image = Image(data: data) else {
        completion(nil)
        return
    }

    imageProcessingQueue.async {
        let processedImage = upscaleAndFilter(image: image)
        completion(processedImage)
    }
}

// ----------------------------------------------------------


