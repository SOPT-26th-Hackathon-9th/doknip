//
//  HomeData_TH.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/06/02.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
struct Reserved: Codable{
    var success : Bool
    var message : String
    var data : [movieData]
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init (from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([movieData].self, forKey: .data)) ?? [movieData(movieIdx: 0, movieName: "", movieImg: URL(string: "")!, release_flag: 0, schedule: "")]
    }
}
struct movieData:Codable{
    var movieIdx:Int
    var movieName:String
    var movieImg:URL
    var release_flag:Int
    var schedule:String
}


struct Released: Codable{
    var success : Bool
    var message : String
    var data : [movieimgData]
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init (from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([movieimgData].self, forKey: .data)) ?? [movieimgData(movieIdx: 0, movieImg: URL(string: "")!)]
        
    }
}
struct movieimgData:Codable{
    var movieIdx:Int
    var movieImg:URL
}



struct MovieInfo: Codable{
    var success : Bool
    var message : String
    var data : [movieimgData]
    var
    
    enum CodingKeys: String, CodingKey{
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init (from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([movieimgData].self, forKey: .data)) ?? [movieimgData(movieIdx: 0, movieImg: URL(string: "")!)]
        
    }
}
struct movieinfoData:Codable{
    var movieIdx:Int
    var movieName:String
    var schedule:String
    var time:String
    var summery:String
    var movieImg:URL
    var release_flag:Int

}
