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
    //static let baseURL = "https://owner-api.teslamotors.com/api/1/vehicles/145050237128"
    static let baseURL = "https://owner-api.teslamotors.com/"
    

    //this function configures requests
    //TODO: See if this can not be optional even in fail
    func configRequest(command: String, httpMethod: String) {
        
        //configure the URL
        let url = URL(string: (TaskManager.baseURL + command))!
        
        let parameters: [String: Any] = [:]
        
        //configuring the request
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(myAccount.authHeader, forHTTPHeaderField: "Authorization")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        
        
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                //print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    
    func configRequest2(command: String, httpMethod: String) {
        
        //configure the URL
        let url = URL(string: (TaskManager.baseURL + command))!
        
        let parameters: [String: Any] = [:]
        
        //configuring the request
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(myAccount.authHeader, forHTTPHeaderField: "Authorization")
        
        request.timeoutInterval = 20
        
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                //print("Printing Response")
                //print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //print("printing JSON")
                    //print(json)
                    let jsonData = json as! [String:Any]
                    //print(jsonData["response"])
                    var md = jsonData["response"] as! [String : Any]
                    //print(md)
                    myAccount.addCar(id: "145050237128", can_accept_navigation_requests: (md["can_accept_navigation_requests"] != nil), can_actuate_trunks: (md["can_actuate_trunks"] != nil), car_special_type: (md["car_special_type"] as! String), car_type: (md["car_type"] as! String), charge_port_type: "charge_port_type", default_charge_to_max: (md["default_charge_to_max"] != nil), ece_restrictions: (md["ece_restrictions"] != nil), eu_vehicle: (md["eu_vehicle"] != nil), exterior_color: md["exterior_color"] as! String, exterior_trim: md["exterior_trim"] as! String, has_air_suspension: (md["has_air_suspension"] != nil), has_ludicrous_mode: (md["has_ludicrous_mode"] != nil), key_version: md["key_version"] as! Int, motorized_charge_port: (md["motorized_charge_port"] != nil), plg: md["plg"] as! Bool, rear_seat_heaters: (md["rear_seat_heaters"] != nil), rear_seat_type: "TODO" as! String, rhd: md["rhd"] as! Bool, roof_color: md["roof_color"] as! String, seat_type: "TODO" as! String, spoiler_type: md["spoiler_type"] as! String, sun_roof_installed: (md["sun_roof_installed"] != nil), third_row_seats: (md["third_row_seats"] != nil), timestamp: "TODO" as! String, use_range_badging: (md["use_range_badging"] != nil), wheel_type: md["wheel_type"] as! String)
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        //print("printing my dictionary")
//        print(myDictionary)
    }
    
    func configRequest3(command: String, httpMethod: String) {
        
        //configure the URL
        let url = URL(string: (TaskManager.baseURL + command))!
        
        let parameters: [String: Any] = [:]
        
        //configuring the request
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(myAccount.authHeader, forHTTPHeaderField: "Authorization")
        
        request.timeoutInterval = 20
        
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                //print("Printing Response")
                //print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //print("printing JSON")
                    //print(json)
                    let jsonData = json as! [String:Any]
                    //print("11111")
                    //print(jsonData["response"])
                    var md = jsonData["response"] as! [[String:Any]]
                    //print("22222")
                    //print(md.count)
                    //print(md[0])
                    
                    for car in md {
                        var xd = car
                        //print(xd["id_s"])
                        var id = xd["id_s"]
                        
                        //XD IS THE VEHICLE ID
                        self.getConfig(id: id as! String)
                    }
                    
                    
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        print("printing my dictionary")
//        print(myDictionary)
    }
    
    
    func lock() -> String{
        print("hello world")
        
        configRequest(command: "/api/1/vehicles/\(myAccount.selectedVehicleID)/command/door_lock", httpMethod: "POST")
        return "lock called"
    }
    
    func unlock() -> String{
        configRequest(command: "/api/1/vehicles/\(myAccount.selectedVehicleID)/command/door_unlock", httpMethod: "POST")
        return "hello world"
    }

    func getConfig(id: String){
        print("hello world")
        configRequest2(command: "/api/1/vehicles/\(id)/data_request/vehicle_config", httpMethod: "GET")
    }
    
    func getCars(){
        print("in getCars()")
        configRequest3(command: "/api/1/vehicles", httpMethod: "GET")
    }

}
