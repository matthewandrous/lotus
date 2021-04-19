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
    
    let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // seconds
        configuration.timeoutIntervalForResource = 30 // seconds
        return URLSession(configuration: configuration)
    }()
    
    //static let baseURL = "https://owner-api.teslamotors.com/api/1/vehicles/145050237128"
    static let baseURL = "https://owner-api.teslamotors.com/"
    

    ///This function is responsible for making generic HTTP requests.
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
    
    ///This is the function that creates the HTTP request to get the configuratio for each car. It get's called once per car.
    func getConfigRequest(command: String, httpMethod: String) {
        
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
    
    ///This is the function that creates the HTTP request to get all the vehicles. It get's called
    func getVehiclesRequest(command: String, httpMethod: String) {
        
        let url = URL(string: (TaskManager.baseURL + command))!
        
        let parameters: [String: Any] = [:]
        
        ///configuring the request
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

                    let jsonData = json as! [String:Any]
                    var md = jsonData["response"] as! [[String:Any]]
                    for car in md {
                        self.getConfig(id: car["id_s"] as! String)
                    }
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        print("printing my dictionary")
//        print(myDictionary)
    }
    
    
    ///The following functions are all  controls for the car
    func lock() -> String{
        print("hello world")
        
        configRequest(command: "/api/1/vehicles/\(myAccount.selectedVehicleID)/command/door_lock", httpMethod: "POST")
        return "lock called"
    }
    
    func unlock() -> String{
        configRequest(command: "/api/1/vehicles/\(myAccount.selectedVehicleID)/command/door_unlock", httpMethod: "POST")
        return "hello world"
    }
    
    func setSentryMode(mode: Bool){
        configRequest(command: "/api/1/vehicles/\(myAccount.selectedVehicleID)/command/set_sentry_mode", httpMethod: "POST")
    }
    

    func getConfig(id: String){
        print("hello world")
        getConfigRequest(command: "/api/1/vehicles/\(id)/data_request/vehicle_config", httpMethod: "GET")
    }
    
    func getCars(){
        print("in getCars()")
        getVehiclesRequest(command: "/api/1/vehicles", httpMethod: "GET")
    }

}
