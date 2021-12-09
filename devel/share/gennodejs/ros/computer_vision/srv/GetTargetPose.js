// Auto-generated. Do not edit!

// (in-package computer_vision.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetTargetPoseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetTargetPoseRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetTargetPoseRequest
    let len;
    let data = new GetTargetPoseRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'computer_vision/GetTargetPoseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetTargetPoseRequest(null);
    return resolved;
    }
};

class GetTargetPoseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pixel_height = null;
      this.pixel_width = null;
    }
    else {
      if (initObj.hasOwnProperty('pixel_height')) {
        this.pixel_height = initObj.pixel_height
      }
      else {
        this.pixel_height = 0.0;
      }
      if (initObj.hasOwnProperty('pixel_width')) {
        this.pixel_width = initObj.pixel_width
      }
      else {
        this.pixel_width = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetTargetPoseResponse
    // Serialize message field [pixel_height]
    bufferOffset = _serializer.float64(obj.pixel_height, buffer, bufferOffset);
    // Serialize message field [pixel_width]
    bufferOffset = _serializer.float64(obj.pixel_width, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetTargetPoseResponse
    let len;
    let data = new GetTargetPoseResponse(null);
    // Deserialize message field [pixel_height]
    data.pixel_height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pixel_width]
    data.pixel_width = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'computer_vision/GetTargetPoseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '90d674dbca60d081c5c435b4dff7bfa7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float64 pixel_height
    float64 pixel_width
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetTargetPoseResponse(null);
    if (msg.pixel_height !== undefined) {
      resolved.pixel_height = msg.pixel_height;
    }
    else {
      resolved.pixel_height = 0.0
    }

    if (msg.pixel_width !== undefined) {
      resolved.pixel_width = msg.pixel_width;
    }
    else {
      resolved.pixel_width = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetTargetPoseRequest,
  Response: GetTargetPoseResponse,
  md5sum() { return '90d674dbca60d081c5c435b4dff7bfa7'; },
  datatype() { return 'computer_vision/GetTargetPose'; }
};
