// Generated by gencpp from file computer_vision/GetBallPose.msg
// DO NOT EDIT!


#ifndef COMPUTER_VISION_MESSAGE_GETBALLPOSE_H
#define COMPUTER_VISION_MESSAGE_GETBALLPOSE_H

#include <ros/service_traits.h>


#include <computer_vision/GetBallPoseRequest.h>
#include <computer_vision/GetBallPoseResponse.h>


namespace computer_vision
{

struct GetBallPose
{

typedef GetBallPoseRequest Request;
typedef GetBallPoseResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetBallPose
} // namespace computer_vision


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::computer_vision::GetBallPose > {
  static const char* value()
  {
    return "1d7a58f8ac7c61cd568e699d96ad3e1c";
  }

  static const char* value(const ::computer_vision::GetBallPose&) { return value(); }
};

template<>
struct DataType< ::computer_vision::GetBallPose > {
  static const char* value()
  {
    return "computer_vision/GetBallPose";
  }

  static const char* value(const ::computer_vision::GetBallPose&) { return value(); }
};


// service_traits::MD5Sum< ::computer_vision::GetBallPoseRequest> should match 
// service_traits::MD5Sum< ::computer_vision::GetBallPose > 
template<>
struct MD5Sum< ::computer_vision::GetBallPoseRequest>
{
  static const char* value()
  {
    return MD5Sum< ::computer_vision::GetBallPose >::value();
  }
  static const char* value(const ::computer_vision::GetBallPoseRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::computer_vision::GetBallPoseRequest> should match 
// service_traits::DataType< ::computer_vision::GetBallPose > 
template<>
struct DataType< ::computer_vision::GetBallPoseRequest>
{
  static const char* value()
  {
    return DataType< ::computer_vision::GetBallPose >::value();
  }
  static const char* value(const ::computer_vision::GetBallPoseRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::computer_vision::GetBallPoseResponse> should match 
// service_traits::MD5Sum< ::computer_vision::GetBallPose > 
template<>
struct MD5Sum< ::computer_vision::GetBallPoseResponse>
{
  static const char* value()
  {
    return MD5Sum< ::computer_vision::GetBallPose >::value();
  }
  static const char* value(const ::computer_vision::GetBallPoseResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::computer_vision::GetBallPoseResponse> should match 
// service_traits::DataType< ::computer_vision::GetBallPose > 
template<>
struct DataType< ::computer_vision::GetBallPoseResponse>
{
  static const char* value()
  {
    return DataType< ::computer_vision::GetBallPose >::value();
  }
  static const char* value(const ::computer_vision::GetBallPoseResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COMPUTER_VISION_MESSAGE_GETBALLPOSE_H