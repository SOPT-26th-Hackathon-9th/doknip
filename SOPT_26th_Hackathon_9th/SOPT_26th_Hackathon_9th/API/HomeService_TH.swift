//
//  HomeService_TH.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/06/02.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
import Alamofire

var toggle:int = 0
struct HomeService {
    static let shared = HomeService()
    
    func GETreserve(completion: @escaping (NetworkResult<Any>) -> Void){
        toggle = 0
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = Alamofire.request(APIConstants.baseURL + APIConstants.reserved, method: .get, parameters:nil, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode,value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    
    func GETreleased(completion: @escaping (NetworkResult<Any>) -> Void){
        toggle = 1
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = Alamofire.request(APIConstants.baseURL + APIConstants.released, method: .get, parameters:nil, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode,value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    func GETunreleased(completion: @escaping (NetworkResult<Any>) -> Void){
        toggle = 2
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = Alamofire.request(APIConstants.baseURL + APIConstants.unreleased, method: .get, parameters:nil, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode,value)
                completion(networkResult)
            case .failure : completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode:Int, _ data:Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200:
            return setData(by: data)
        case 400:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    private func setData(by data:Data) ->NetworkResult<Any> {
        let decoder = JSONDecoder()
        switch toggle {
        case 0:
            guard let decodedData = try? decoder.decode(Reserved.self, from: data) else { return .pathErr }
            return .success(decodedData.data)
        case 1:
            guard let decodedData = try? decoder.decode(Released.self, from: data) else { return .pathErr }
            return .success(decodedData.data)
        case 2:
            guard let decodedData = try? decoder.decode(Released.self, from: data) else { return .pathErr }
            return .success(decodedData.data)
        }
    }
}
