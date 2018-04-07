import Foundation

class GroupOperation: AsynchronousOperation {
    let internalQueue = OperationQueue()
    let finishingOperation = BlockOperation(block: {})
    
    override init() {
        internalQueue.isSuspended = true
        super.init()
    }
    
    final override func main() {
        finishingOperation.completionBlock = { [weak self] in
            self?.finish()
        }
        
        internalQueue.addOperation(finishingOperation)
        internalQueue.isSuspended = false
    }
    
    func add(operation: Operation) {
        finishingOperation.addDependency(operation)
        internalQueue.addOperation(operation)
    }
    
    override func cancel() {
        internalQueue.cancelAllOperations()
        super.cancel()
    }
}
