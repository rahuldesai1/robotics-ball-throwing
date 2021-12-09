// Auto-generated. Do not edit!

// (in-package control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ThrowBallRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pixel_height = null;
    }
    else {
      if (initObj.hasOwnProperty('pixel_height')) {
        this.pixel_height = initObj.pixel_height
      }
      else {
        this.pixel_height = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThrowBallRequest
    // Serialize message field [pixel_height]
    bufferOffset = _serializer.float64(obj.pixel_height, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThrowBallRequest
    let len;
    let data = new ThrowBallRequest(null);
    // Deserialize message field [pixel_height]
    data.pixel_height = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'control/ThrowBallRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '52954f9f105493b6185412c8ca3e9ab4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float64 pixel_height
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ThrowBallRequest(null);
    if (msg.pixel_height !== undefined) {
      resolved.pixel_height = msg.pixel_height;
    }
    else {
      resolved.pixel_height = 0.0
    }

    return resolved;
    }
};

class ThrowBallResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThrowBallResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThrowBallResponse
    let len;
    let data = new ThrowBallResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'control/ThrowBallResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ThrowBallResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ThrowBallRequest,
  Response: ThrowBallResponse,
  md5sum() { return '1f0593be718173ba91ca9ae3b0c6177b'; },
  datatype() { return 'control/ThrowBall'; }
};
