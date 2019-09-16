// Auto-generated. Do not edit!

// (in-package actiondemo.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DoDishesResult {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.total_dishes_cleaned = null;
    }
    else {
      if (initObj.hasOwnProperty('total_dishes_cleaned')) {
        this.total_dishes_cleaned = initObj.total_dishes_cleaned
      }
      else {
        this.total_dishes_cleaned = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DoDishesResult
    // Serialize message field [total_dishes_cleaned]
    bufferOffset = _serializer.uint32(obj.total_dishes_cleaned, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DoDishesResult
    let len;
    let data = new DoDishesResult(null);
    // Deserialize message field [total_dishes_cleaned]
    data.total_dishes_cleaned = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'actiondemo/DoDishesResult';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '58faa44dda59c6545bea63ff57491cbe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    uint32 total_dishes_cleaned
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DoDishesResult(null);
    if (msg.total_dishes_cleaned !== undefined) {
      resolved.total_dishes_cleaned = msg.total_dishes_cleaned;
    }
    else {
      resolved.total_dishes_cleaned = 0
    }

    return resolved;
    }
};

module.exports = DoDishesResult;
