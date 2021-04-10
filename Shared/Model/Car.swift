//
//  Car.swift
//  Lotus
//
//  Created by Matthew Androus on 4/8/21.
//

import Foundation

class Car{
    
    var can_accept_navigation_requests: Bool?
    var can_actuate_trunks: Bool?
    var car_special_type: String?
    var car_type: String?
    var charge_port_type: String?
    var default_charge_to_max: Bool?
    var ece_restrictions: Bool?
    var eu_vehicle: Bool?
    var exterior_color: String?
    var exterior_trim: String?
    var has_air_suspension: Bool?
    var has_ludicrous_mode: Bool?
    var key_version: Int?
    var motorized_charge_port: Bool?
    var plg: Bool?
    var rear_seat_heaters: Bool?
    var rear_seat_type: String?
    var rhd: Bool?
    var roof_color: String?
    var seat_type: String?
    var spoiler_type: String?
    var sun_roof_installed: Bool?
    var third_row_seats: Bool?
    var timestamp: String?
    var use_range_badging: Bool?
    var wheel_type: String?
    
    init(
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
    ) {
        self.can_accept_navigation_requests = can_accept_navigation_requests
        self.can_actuate_trunks = can_actuate_trunks
        self.car_special_type = car_special_type
        self.car_type = car_type
        self.charge_port_type = charge_port_type
        self.default_charge_to_max = default_charge_to_max
        self.ece_restrictions = ece_restrictions
        self.eu_vehicle = eu_vehicle
        self.exterior_color = exterior_color
        self.exterior_trim = exterior_trim
        self.has_air_suspension = has_air_suspension
        self.has_ludicrous_mode = has_ludicrous_mode
        self.key_version = key_version
        self.motorized_charge_port = motorized_charge_port
        self.plg = plg
        self.rear_seat_heaters = rear_seat_heaters
        self.rear_seat_type = rear_seat_type
        self.rhd = rhd
        self.roof_color = roof_color
        self.seat_type = seat_type
        self.spoiler_type = spoiler_type
        self.sun_roof_installed = sun_roof_installed
        self.third_row_seats = third_row_seats
        self.timestamp = timestamp
        self.use_range_badging = use_range_badging
        self.wheel_type = wheel_type
        print("created new car")
        printInfo()
    }

    func printInfo(){
        print("Car Color")
        print(exterior_color)
        print("Wheel Type")
        print(wheel_type)
        print("Car Type")
        print(wheel_type)
    }
}
