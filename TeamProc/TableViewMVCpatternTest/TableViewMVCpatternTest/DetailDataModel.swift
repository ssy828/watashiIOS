//
//  DetailDataModel.swift
//  TableViewMVCpatternTest
//

import Foundation

class DetailDataModel{
    
    weak var delegate: DetailDataModelDelegate?
    
    func requestData()  {
        // code to request data from test firebase
         var response: [AnyObject]?
         var error: Error?
//        do {
//            if let response =  {
//                // parse response to detailTVDataModelItem
//                setDataWithResponse(response: response)
//            }
//        } catch (let errors) {
//            print("erros: ",errors.localizedDescription)
//        }
        if let error = error {
//            delegate?.didFailDataUpdateWithError(error: error)
        } else if let response = response {
            // parse response to [DRHTableViewDataModelItem]
            setDataWithResponse(response: response)
        }
    }
    
    private func setDataWithResponse(response: [AnyObject]) {
        var data = [DetailModelItem]()
        
        for item in response {
            // create DetailModelItem
            if let detailModelItem = DetailModelItem(data: item as? [String: String]) {
                data.append(detailModelItem)
            }
        }
        delegate?.didRecieveDataUpdate(data: data)
    }
}

protocol DetailDataModelDelegate: class {
    func didRecieveDataUpdate(data: [DetailModelItem])
//    func didFailDataUpdateWithError(error: Error)
}





