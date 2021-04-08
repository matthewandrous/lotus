//
//  TaskManager.swift
//  Lotus
//
//  Created by Matthew Androus on 2/21/21.
//
//

import Foundation

let myTaskManager = TaskManager()

//This class manages all the actual API calls
class TaskManager{
    
    
    
    //this class is a singleton because you only need one
    //static let shared = TaskManager()

    //session is static because there will only be one for the whole app
    //and not each instance of the Task Manager (in fact there won't be instances)
    let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // seconds
        configuration.timeoutIntervalForResource = 30 // seconds
        return URLSession(configuration: configuration)
    }()
    
    //this is the base URL that all commands go to
    static let baseURL = "https://owner-api.teslamotors.com/api/1/vehicles/145050237128"

    //this function configures requests
    //TODO: See if this can not be optional even in fail
    func configRequest(command: String) {
        
        //configure the URL
        let url = URL(string: (TaskManager.baseURL + command))!
        
        let parameters: [String: Any] = [:]
        
        //configuring the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(myAuthManager.authHeader, forHTTPHeaderField: "Authorization")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        
        
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    
    
    func lock() -> String{
        print("hello world")
        
        configRequest(command: "/command/door_lock")
        return "lock called"
    }
    
    func unlock() -> String{
        configRequest(command: "/command/door_unlock")
        return "hello world"
    }

    

}
