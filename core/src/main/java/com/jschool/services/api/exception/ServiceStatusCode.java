package com.jschool.services.api.exception;

/**
 * Created by infinity on 19.02.16.
 */
public enum ServiceStatusCode {

    USER_OR_DRIVER_ALREADY_EXIST, DRIVER_NOT_FOUND, DRIVER_ASSIGNED_ORDER, USER_NOT_FOUND,

    TRUCK_ASSIGNED_ORDER,TRUCK_DID_NOT_ASSIGNED_ORDER,TRUCK_ALREADY_EXIST,TRUCK_NOT_FOUND,

    ORDER_ALREADY_EXIST,ORDER_NOT_FOUND,ORDER_DID_NOT_DONE,

    CITY_NOT_FOUND,

    CARGO_ALREADY_EXIST,CARGO_NOT_FOUND,

    DRIVER_AND_SHIFT_SIZE_NOT_EQUAL,

    UNKNOWN
}
