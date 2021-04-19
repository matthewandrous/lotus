//
//  AuthManager.swift
//  Lotus
//
//  Created by Matthew Androus on 4/6/21.
//
///




import Foundation

let myAccount = Account()
///This class is a singleton because there is one per app.
///One `Account` Object is tied to one Tesla Account.
///Each `Account` can have multiple `Car` Objects.

class Account: ObservableObject{
    
    
    var token = "hello"
    var authHeader = "hello"
    var cars = [Car]()
    var selectedVehicleID = "0"

    func UpdateToken(newToken: String){
        token = newToken
        authHeader = "Bearer " + token
        
        ///GetCars is always called after getting a new token.
        myTaskManager.getCars()
    }
    
    ///Simple creates an instance of `Car` and appends it to the `cars` array
    func addCar(
        id: String,
        can_accept_navigation_requests: Bool,
        can_actuate_trunks: Bool,
        car_special_type: String,
        car_type: String,
        charge_port_type: String,
        default_charge_to_max: Bool,
        ece_restrictions: Bool,
        eu_vehicle: Bool,
        exterior_color: String,
        exterior_trim: String,
        has_air_suspension: Bool,
        has_ludicrous_mode: Bool,
        key_version: Int,
        motorized_charge_port: Bool,
        plg: Bool,
        rear_seat_heaters: Bool,
        rear_seat_type: String,
        rhd: Bool,
        roof_color: String,
        seat_type: String,
        spoiler_type: String,
        sun_roof_installed: Bool,
        third_row_seats: Bool,
        timestamp: String,
        use_range_badging: Bool,
        wheel_type: String
    ){
        let myCar = Car(
            id: id,
            can_accept_navigation_requests: can_accept_navigation_requests,
            can_actuate_trunks: can_actuate_trunks,
            car_special_type: car_special_type,
            car_type: car_type,
            charge_port_type: charge_port_type,
            default_charge_to_max: default_charge_to_max,
            ece_restrictions: ece_restrictions,
            eu_vehicle: eu_vehicle,
            exterior_color: exterior_color,
            exterior_trim: exterior_trim,
            has_air_suspension: has_air_suspension,
            has_ludicrous_mode: has_ludicrous_mode,
            key_version: key_version,
            motorized_charge_port: motorized_charge_port,
            plg: plg,
            rear_seat_heaters: rear_seat_heaters,
            rear_seat_type: rear_seat_type,
            rhd: rhd,
            roof_color: roof_color,
            seat_type: seat_type,
            spoiler_type: spoiler_type,
            sun_roof_installed: sun_roof_installed,
            third_row_seats: third_row_seats,
            timestamp: timestamp,
            use_range_badging: use_range_badging,
            wheel_type: wheel_type
        )
        selectedVehicleID = myCar.id!
        cars.append(myCar)
        print("total number of cars")
        print(cars.count)
    }
}



