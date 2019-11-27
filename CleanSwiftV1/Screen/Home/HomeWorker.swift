import UIKit
import Alamofire
import ObjectMapper

protocol HomeWorkerProtocol {
  func callBNKListService(page: Int, memId: Int, completion: @escaping ([BNKListModel]?) -> Void)
}

class HomeWorker: HomeWorkerProtocol {
  
  func callBNKListService(page: Int, memId: Int,
                          completion: @escaping ([BNKListModel]?) -> Void) {
    
    let url = "https://www.bnk48.com/model/listMembersClassdb/listMembersAjax.php"
    
    let parameters: Parameters = [
      "page": page,
      "MemId": memId,
      "method": "loadmore"
    ]
    
    Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
      guard let resp = response.result.value else { return }
      guard let model = Mapper<BNKListModel>().mapArray(JSONObject: resp) else { return }
      completion(model)
    }
  }
}
