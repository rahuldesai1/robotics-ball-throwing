// Generated by gencpp from file control/ThrowBall.msg
// DO NOT EDIT!


#ifndef CONTROL_MESSAGE_THROWBALL_H
#define CONTROL_MESSAGE_THROWBALL_H

#include <ros/service_traits.h>


#include <control/ThrowBallRequest.h>
#include <control/ThrowBallResponse.h>


namespace control
{

struct ThrowBall
{

typedef ThrowBallRequest Request;
typedef ThrowBallResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ThrowBall
} // namespace control


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::control::ThrowBall > {
  static const char* value()
  {
    return "1f0593be718173ba91ca9ae3b0c6177b";
  }

  static const char* value(const ::control::ThrowBall&) { return value(); }
};

template<>
struct DataType< ::control::ThrowBall > {
  static const char* value()
  {
    return "control/ThrowBall";
  }

  static const char* value(const ::control::ThrowBall&) { return value(); }
};


// service_traits::MD5Sum< ::control::ThrowBallRequest> should match 
// service_traits::MD5Sum< ::control::ThrowBall > 
template<>
struct MD5Sum< ::control::ThrowBallRequest>
{
  static const char* value()
  {
    return MD5Sum< ::control::ThrowBall >::value();
  }
  static const char* value(const ::control::ThrowBallRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::control::ThrowBallRequest> should match 
// service_traits::DataType< ::control::ThrowBall > 
template<>
struct DataType< ::control::ThrowBallRequest>
{
  static const char* value()
  {
    return DataType< ::control::ThrowBall >::value();
  }
  static const char* value(const ::control::ThrowBallRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::control::ThrowBallResponse> should match 
// service_traits::MD5Sum< ::control::ThrowBall > 
template<>
struct MD5Sum< ::control::ThrowBallResponse>
{
  static const char* value()
  {
    return MD5Sum< ::control::ThrowBall >::value();
  }
  static const char* value(const ::control::ThrowBallResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::control::ThrowBallResponse> should match 
// service_traits::DataType< ::control::ThrowBall > 
template<>
struct DataType< ::control::ThrowBallResponse>
{
  static const char* value()
  {
    return DataType< ::control::ThrowBall >::value();
  }
  static const char* value(const ::control::ThrowBallResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // CONTROL_MESSAGE_THROWBALL_H
