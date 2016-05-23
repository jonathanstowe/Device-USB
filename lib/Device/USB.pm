use NativeCall;

class Device::USB {

    my constant LIB = [ 'usb-1.0', v0 ];


## Enumerations

# == /usr/include/libusb-1.0/libusb.h ==

enum libusb_class_code is export (
   LIBUSB_CLASS_PER_INTERFACE => 0,
   LIBUSB_CLASS_AUDIO => 1,
   LIBUSB_CLASS_COMM => 2,
   LIBUSB_CLASS_HID => 3,
   LIBUSB_CLASS_PHYSICAL => 5,
   LIBUSB_CLASS_PRINTER => 7,
   LIBUSB_CLASS_PTP => 6,
   LIBUSB_CLASS_IMAGE => 6,
   LIBUSB_CLASS_MASS_STORAGE => 8,
   LIBUSB_CLASS_HUB => 9,
   LIBUSB_CLASS_DATA => 10,
   LIBUSB_CLASS_SMART_CARD => 11,
   LIBUSB_CLASS_CONTENT_SECURITY => 13,
   LIBUSB_CLASS_VIDEO => 14,
   LIBUSB_CLASS_PERSONAL_HEALTHCARE => 15,
   LIBUSB_CLASS_DIAGNOSTIC_DEVICE => 220,
   LIBUSB_CLASS_WIRELESS => 224,
   LIBUSB_CLASS_APPLICATION => 254,
   LIBUSB_CLASS_VENDOR_SPEC => 255
);
enum libusb_descriptor_type is export (
   LIBUSB_DT_DEVICE => 1,
   LIBUSB_DT_CONFIG => 2,
   LIBUSB_DT_STRING => 3,
   LIBUSB_DT_INTERFACE => 4,
   LIBUSB_DT_ENDPOINT => 5,
   LIBUSB_DT_HID => 33,
   LIBUSB_DT_REPORT => 34,
   LIBUSB_DT_PHYSICAL => 35,
   LIBUSB_DT_HUB => 41
);
enum libusb_endpoint_direction is export (
   LIBUSB_ENDPOINT_IN => 128,
   LIBUSB_ENDPOINT_OUT => 0
);
enum libusb_transfer_type is export (
   LIBUSB_TRANSFER_TYPE_CONTROL => 0,
   LIBUSB_TRANSFER_TYPE_ISOCHRONOUS => 1,
   LIBUSB_TRANSFER_TYPE_BULK => 2,
   LIBUSB_TRANSFER_TYPE_INTERRUPT => 3
);
enum libusb_standard_request is export (
   LIBUSB_REQUEST_GET_STATUS => 0,
   LIBUSB_REQUEST_CLEAR_FEATURE => 1,
   LIBUSB_REQUEST_SET_FEATURE => 3,
   LIBUSB_REQUEST_SET_ADDRESS => 5,
   LIBUSB_REQUEST_GET_DESCRIPTOR => 6,
   LIBUSB_REQUEST_SET_DESCRIPTOR => 7,
   LIBUSB_REQUEST_GET_CONFIGURATION => 8,
   LIBUSB_REQUEST_SET_CONFIGURATION => 9,
   LIBUSB_REQUEST_GET_INTERFACE => 10,
   LIBUSB_REQUEST_SET_INTERFACE => 11,
   LIBUSB_REQUEST_SYNCH_FRAME => 12
);
enum libusb_request_type is export (
   LIBUSB_REQUEST_TYPE_STANDARD => 0,
   LIBUSB_REQUEST_TYPE_CLASS => 32,
   LIBUSB_REQUEST_TYPE_VENDOR => 64,
   LIBUSB_REQUEST_TYPE_RESERVED => 96
);
enum libusb_request_recipient is export (
   LIBUSB_RECIPIENT_DEVICE => 0,
   LIBUSB_RECIPIENT_INTERFACE => 1,
   LIBUSB_RECIPIENT_ENDPOINT => 2,
   LIBUSB_RECIPIENT_OTHER => 3
);
enum libusb_iso_sync_type is export (
   LIBUSB_ISO_SYNC_TYPE_NONE => 0,
   LIBUSB_ISO_SYNC_TYPE_ASYNC => 1,
   LIBUSB_ISO_SYNC_TYPE_ADAPTIVE => 2,
   LIBUSB_ISO_SYNC_TYPE_SYNC => 3
);
enum libusb_iso_usage_type is export (
   LIBUSB_ISO_USAGE_TYPE_DATA => 0,
   LIBUSB_ISO_USAGE_TYPE_FEEDBACK => 1,
   LIBUSB_ISO_USAGE_TYPE_IMPLICIT => 2
);
enum libusb_speed is export (
   LIBUSB_SPEED_UNKNOWN => 0,
   LIBUSB_SPEED_LOW => 1,
   LIBUSB_SPEED_FULL => 2,
   LIBUSB_SPEED_HIGH => 3,
   LIBUSB_SPEED_SUPER => 4
);
enum libusb_error is export (
   LIBUSB_SUCCESS => 0,
   LIBUSB_ERROR_IO => -1,
   LIBUSB_ERROR_INVALID_PARAM => -2,
   LIBUSB_ERROR_ACCESS => -3,
   LIBUSB_ERROR_NO_DEVICE => -4,
   LIBUSB_ERROR_NOT_FOUND => -5,
   LIBUSB_ERROR_BUSY => -6,
   LIBUSB_ERROR_TIMEOUT => -7,
   LIBUSB_ERROR_OVERFLOW => -8,
   LIBUSB_ERROR_PIPE => -9,
   LIBUSB_ERROR_INTERRUPTED => -10,
   LIBUSB_ERROR_NO_MEM => -11,
   LIBUSB_ERROR_NOT_SUPPORTED => -12,
   LIBUSB_ERROR_OTHER => -99
);
enum libusb_transfer_status is export (
   LIBUSB_TRANSFER_COMPLETED => 0,
   LIBUSB_TRANSFER_ERROR => 1,
   LIBUSB_TRANSFER_TIMED_OUT => 2,
   LIBUSB_TRANSFER_CANCELLED => 3,
   LIBUSB_TRANSFER_STALL => 4,
   LIBUSB_TRANSFER_NO_DEVICE => 5,
   LIBUSB_TRANSFER_OVERFLOW => 6
);
enum libusb_transfer_flags is export (
   LIBUSB_TRANSFER_SHORT_NOT_OK => 1,
   LIBUSB_TRANSFER_FREE_BUFFER => 2,
   LIBUSB_TRANSFER_FREE_TRANSFER => 4,
   LIBUSB_TRANSFER_ADD_ZERO_PACKET => 8
);
enum libusb_capability is export (
   LIBUSB_CAP_HAS_CAPABILITY => 0
);
## Structures


# == /usr/include/libusb-1.0/libusb.h ==

class libusb_device_descriptor is repr('CStruct') is export {
	has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
	has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
	has uint16                      $.bcdUSB; # Typedef<uint16>->|short unsigned int| bcdUSB
	has uint8                       $.bDeviceClass; # Typedef<uint8>->|unsigned char| bDeviceClass
	has uint8                       $.bDeviceSubClass; # Typedef<uint8>->|unsigned char| bDeviceSubClass
	has uint8                       $.bDeviceProtocol; # Typedef<uint8>->|unsigned char| bDeviceProtocol
	has uint8                       $.bMaxPacketSize0; # Typedef<uint8>->|unsigned char| bMaxPacketSize0
	has uint16                      $.idVendor; # Typedef<uint16>->|short unsigned int| idVendor
	has uint16                      $.idProduct; # Typedef<uint16>->|short unsigned int| idProduct
	has uint16                      $.bcdDevice; # Typedef<uint16>->|short unsigned int| bcdDevice
	has uint8                       $.iManufacturer; # Typedef<uint8>->|unsigned char| iManufacturer
	has uint8                       $.iProduct; # Typedef<uint8>->|unsigned char| iProduct
	has uint8                       $.iSerialNumber; # Typedef<uint8>->|unsigned char| iSerialNumber
	has uint8                       $.bNumConfigurations; # Typedef<uint8>->|unsigned char| bNumConfigurations
}
class libusb_endpoint_descriptor is repr('CStruct') is export {
	has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
	has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
	has uint8                       $.bEndpointAddress; # Typedef<uint8>->|unsigned char| bEndpointAddress
	has uint8                       $.bmAttributes; # Typedef<uint8>->|unsigned char| bmAttributes
	has uint16                      $.wMaxPacketSize; # Typedef<uint16>->|short unsigned int| wMaxPacketSize
	has uint8                       $.bInterval; # Typedef<uint8>->|unsigned char| bInterval
	has uint8                       $.bRefresh; # Typedef<uint8>->|unsigned char| bRefresh
	has uint8                       $.bSynchAddress; # Typedef<uint8>->|unsigned char| bSynchAddress
	has Pointer[uint8]                $.extra; # const unsigned char* extra
	has int32                         $.extra_length; # int extra_length
}
class libusb_interface_descriptor is repr('CStruct') is export {
	has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
	has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
	has uint8                       $.bInterfaceNumber; # Typedef<uint8>->|unsigned char| bInterfaceNumber
	has uint8                       $.bAlternateSetting; # Typedef<uint8>->|unsigned char| bAlternateSetting
	has uint8                       $.bNumEndpoints; # Typedef<uint8>->|unsigned char| bNumEndpoints
	has uint8                       $.bInterfaceClass; # Typedef<uint8>->|unsigned char| bInterfaceClass
	has uint8                       $.bInterfaceSubClass; # Typedef<uint8>->|unsigned char| bInterfaceSubClass
	has uint8                       $.bInterfaceProtocol; # Typedef<uint8>->|unsigned char| bInterfaceProtocol
	has uint8                       $.iInterface; # Typedef<uint8>->|unsigned char| iInterface
	has libusb_endpoint_descriptor    $.endpoint; # const libusb_endpoint_descriptor* endpoint
	has Pointer[uint8]                $.extra; # const unsigned char* extra
	has int32                         $.extra_length; # int extra_length
}
class libusb_interface is repr('CStruct') is export {
	has libusb_interface_descriptor   $.altsetting; # const libusb_interface_descriptor* altsetting
	has int32                         $.num_altsetting; # int num_altsetting
}
class libusb_config_descriptor is repr('CStruct') is export {
	has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
	has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
	has uint16                      $.wTotalLength; # Typedef<uint16>->|short unsigned int| wTotalLength
	has uint8                       $.bNumInterfaces; # Typedef<uint8>->|unsigned char| bNumInterfaces
	has uint8                       $.bConfigurationValue; # Typedef<uint8>->|unsigned char| bConfigurationValue
	has uint8                       $.iConfiguration; # Typedef<uint8>->|unsigned char| iConfiguration
	has uint8                       $.bmAttributes; # Typedef<uint8>->|unsigned char| bmAttributes
	has uint8                       $.MaxPower; # Typedef<uint8>->|unsigned char| MaxPower
	has libusb_interface              $.interface; # const libusb_interface* interface
	has Pointer[uint8]                $.extra; # const unsigned char* extra
	has int32                         $.extra_length; # int extra_length
}
class libusb_control_setup is repr('CStruct') is export {
	has uint8                       $.bmRequestType; # Typedef<uint8>->|unsigned char| bmRequestType
	has uint8                       $.bRequest; # Typedef<uint8>->|unsigned char| bRequest
	has uint16                      $.wValue; # Typedef<uint16>->|short unsigned int| wValue
	has uint16                      $.wIndex; # Typedef<uint16>->|short unsigned int| wIndex
	has uint16                      $.wLength; # Typedef<uint16>->|short unsigned int| wLength
}
class libusb_context is repr('CStruct') is export {
}
class libusb_device is repr('CStruct') is export {
}
class libusb_device_handle is repr('CStruct') is export {
}
class libusb_version is repr('CStruct') is export {
	has uint16                      $.major; # const Typedef<uint16>->|short unsigned int| major
	has uint16                      $.minor; # const Typedef<uint16>->|short unsigned int| minor
	has uint16                      $.micro; # const Typedef<uint16>->|short unsigned int| micro
	has uint16                      $.nano; # const Typedef<uint16>->|short unsigned int| nano
	has Str                           $.rc; # const char* rc
	has Str                           $.describe; # const char* describe
}
class libusb_iso_packet_descriptor is repr('CStruct') is export {
	has uint32                        $.length; # unsigned int length
	has uint32                        $.actual_length; # unsigned int actual_length
	has int32                         $.status; # libusb_transfer_status status
}
class libusb_transfer is repr('CStruct') is export {
	has libusb_device_handle          $.dev_handle; # Typedef<libusb_device_handle>->|libusb_device_handle|* dev_handle
	has uint8                       $.flags; # Typedef<uint8>->|unsigned char| flags
	has uint8                         $.endpoint; # unsigned char endpoint
	has uint8                         $.type; # unsigned char type
	has uint32                        $.timeout; # unsigned int timeout
	has int32                         $.status; # libusb_transfer_status status
	has int32                         $.length; # int length
	has int32                         $.actual_length; # int actual_length
	has Pointer                       $.callback; # Typedef<libusb_transfer_cb_fn>->|F:void ( libusb_transfer*)*| callback
	has Pointer                       $.user_data; # void* user_data
	has Pointer[uint8]                $.buffer; # unsigned char* buffer
	has int32                         $.num_iso_packets; # int num_iso_packets
	has CArray[libusb_iso_packet_descriptor]$.iso_packet_desc; # libusb_iso_packet_descriptor[] iso_packet_desc
}
class libusb_pollfd is repr('CStruct') is export {
	has int32                         $.fd; # int fd
	has int16                         $.events; # short int events
}
## Extras stuff

=begin comment

constant libusb_device_handle is export := libusb_device_handle;
constant libusb_context is export := libusb_context;
constant libusb_device is export := libusb_device;
constant sigset_t is export := __sigset_t;
constant fsid_t is export := __fsid_t;
constant __pthread_slist_t is export := __pthread_internal_slist;

=end comment

## Functions


# == /usr/include/libusb-1.0/libusb.h ==

#-From /usr/include/libusb-1.0/libusb.h:118
#/** \def libusb_cpu_to_le16
# * \ingroup misc
# * Convert a 16-bit value from host-endian to little-endian format. On
# * little endian systems, this function does nothing. On big endian systems,
# * the bytes are swapped.
# * \param x the host-endian value to convert
# * \returns the value in little-endian byte order
# */
#static inline uint16 libusb_cpu_to_le16(const uint16 x)
sub libusb_cpu_to_le16(uint16 $x # const Typedef<uint16>->|short unsigned int|
                       ) is native(LIB) returns uint16 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:952
#int LIBUSB_CALL libusb_init(libusb_context **ctx);
sub libusb_init(Pointer[libusb_context] $ctx # Typedef<libusb_context>->|libusb_context|**
                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:953
#void LIBUSB_CALL libusb_exit(libusb_context *ctx);
sub libusb_exit(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:954
#void LIBUSB_CALL libusb_set_debug(libusb_context *ctx, int level);
sub libusb_set_debug(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                    ,int32                         $level # int
                     ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:955
#const struct libusb_version * LIBUSB_CALL libusb_get_version(void);
sub libusb_get_version(
                       ) is native(LIB) returns libusb_version is export { * }

#-From /usr/include/libusb-1.0/libusb.h:956
#int LIBUSB_CALL libusb_has_capability(uint32 capability);
sub libusb_has_capability(uint32 $capability # Typedef<uint32>->|unsigned int|
                          ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:957
#const char * LIBUSB_CALL libusb_error_name(int errcode);
sub libusb_error_name(int32 $errcode # int
                      ) is native(LIB) returns Str is export { * }

#-From /usr/include/libusb-1.0/libusb.h:960
#ssize_t LIBUSB_CALL libusb_get_device_list(libusb_context *ctx,
#	libusb_device ***list);
sub libusb_get_device_list(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                          ,Pointer[Pointer[libusb_device]]$list # Typedef<libusb_device>->|libusb_device|***
                           ) is native(LIB) returns ssize_t is export { * }

#-From /usr/include/libusb-1.0/libusb.h:962
#void LIBUSB_CALL libusb_free_device_list(libusb_device **list,
#	int unref_devices);
sub libusb_free_device_list(Pointer[libusb_device]        $list # Typedef<libusb_device>->|libusb_device|**
                           ,int32                         $unref_devices # int
                            ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:963
#libusb_device * LIBUSB_CALL libusb_ref_device(libusb_device *dev);
sub libusb_ref_device(libusb_device $dev # Typedef<libusb_device>->|libusb_device|*
                      ) is native(LIB) returns libusb_device is export { * }

#-From /usr/include/libusb-1.0/libusb.h:964
#void LIBUSB_CALL libusb_unref_device(libusb_device *dev);
sub libusb_unref_device(libusb_device $dev # Typedef<libusb_device>->|libusb_device|*
                        ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:967
#int LIBUSB_CALL libusb_get_configuration(libusb_device_handle *dev,
#	int *config);
sub libusb_get_configuration(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                            ,Pointer[int32]                $config # int*
                             ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:969
#int LIBUSB_CALL libusb_get_device_descriptor(libusb_device *dev,
#	struct libusb_device_descriptor *desc);
sub libusb_get_device_descriptor(libusb_device                 $dev # Typedef<libusb_device>->|libusb_device|*
                                ,libusb_device_descriptor      $desc # libusb_device_descriptor*
                                 ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:971
#int LIBUSB_CALL libusb_get_active_config_descriptor(libusb_device *dev,
#	struct libusb_config_descriptor **config);
sub libusb_get_active_config_descriptor(libusb_device                 $dev # Typedef<libusb_device>->|libusb_device|*
                                       ,Pointer[libusb_config_descriptor]$config # libusb_config_descriptor**
                                        ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:973
#int LIBUSB_CALL libusb_get_config_descriptor(libusb_device *dev,
#	uint8 config_index, struct libusb_config_descriptor **config);
sub libusb_get_config_descriptor(libusb_device                 $dev # Typedef<libusb_device>->|libusb_device|*
                                ,uint8                       $config_index # Typedef<uint8>->|unsigned char|
                                ,Pointer[libusb_config_descriptor]$config # libusb_config_descriptor**
                                 ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:975
#int LIBUSB_CALL libusb_get_config_descriptor_by_value(libusb_device *dev,
#	uint8 bConfigurationValue, struct libusb_config_descriptor **config);
sub libusb_get_config_descriptor_by_value(libusb_device                 $dev # Typedef<libusb_device>->|libusb_device|*
                                         ,uint8                       $bConfigurationValue # Typedef<uint8>->|unsigned char|
                                         ,Pointer[libusb_config_descriptor]$config # libusb_config_descriptor**
                                          ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:977
#void LIBUSB_CALL libusb_free_config_descriptor(
#	struct libusb_config_descriptor *config);
sub libusb_free_config_descriptor(libusb_config_descriptor $config # libusb_config_descriptor*
                                  ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:978
#uint8 LIBUSB_CALL libusb_get_bus_number(libusb_device *dev);
sub libusb_get_bus_number(libusb_device $dev # Typedef<libusb_device>->|libusb_device|*
                          ) is native(LIB) returns uint8 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:979
#uint8 LIBUSB_CALL libusb_get_device_address(libusb_device *dev);
sub libusb_get_device_address(libusb_device $dev # Typedef<libusb_device>->|libusb_device|*
                              ) is native(LIB) returns uint8 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:980
#int LIBUSB_CALL libusb_get_device_speed(libusb_device *dev);
sub libusb_get_device_speed(libusb_device $dev # Typedef<libusb_device>->|libusb_device|*
                            ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:982
#int LIBUSB_CALL libusb_get_max_packet_size(libusb_device *dev,
#	unsigned char endpoint);
sub libusb_get_max_packet_size(libusb_device                 $dev # Typedef<libusb_device>->|libusb_device|*
                              ,uint8                         $endpoint # unsigned char
                               ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:984
#int LIBUSB_CALL libusb_get_max_iso_packet_size(libusb_device *dev,
#	unsigned char endpoint);
sub libusb_get_max_iso_packet_size(libusb_device                 $dev # Typedef<libusb_device>->|libusb_device|*
                                  ,uint8                         $endpoint # unsigned char
                                   ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:986
#int LIBUSB_CALL libusb_open(libusb_device *dev, libusb_device_handle **handle);
sub libusb_open(libusb_device                 $dev # Typedef<libusb_device>->|libusb_device|*
               ,Pointer[libusb_device_handle] $handle # Typedef<libusb_device_handle>->|libusb_device_handle|**
                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:987
#void LIBUSB_CALL libusb_close(libusb_device_handle *dev_handle);
sub libusb_close(libusb_device_handle $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                 ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:988
#libusb_device * LIBUSB_CALL libusb_get_device(libusb_device_handle *dev_handle);
sub libusb_get_device(libusb_device_handle $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                      ) is native(LIB) returns libusb_device is export { * }

#-From /usr/include/libusb-1.0/libusb.h:991
#int LIBUSB_CALL libusb_set_configuration(libusb_device_handle *dev,
#	int configuration);
sub libusb_set_configuration(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                            ,int32                         $configuration # int
                             ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:993
#int LIBUSB_CALL libusb_claim_interface(libusb_device_handle *dev,
#	int interface_number);
sub libusb_claim_interface(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                          ,int32                         $interface_number # int
                           ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:995
#int LIBUSB_CALL libusb_release_interface(libusb_device_handle *dev,
#	int interface_number);
sub libusb_release_interface(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                            ,int32                         $interface_number # int
                             ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:998
#libusb_device_handle * LIBUSB_CALL libusb_open_device_with_vid_pid(
#	libusb_context *ctx, uint16 vendor_id, uint16 product_id);
sub libusb_open_device_with_vid_pid(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                                   ,uint16                      $vendor_id # Typedef<uint16>->|short unsigned int|
                                   ,uint16                      $product_id # Typedef<uint16>->|short unsigned int|
                                    ) is native(LIB) returns libusb_device_handle is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1001
#int LIBUSB_CALL libusb_set_interface_alt_setting(libusb_device_handle *dev,
#	int interface_number, int alternate_setting);
sub libusb_set_interface_alt_setting(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                                    ,int32                         $interface_number # int
                                    ,int32                         $alternate_setting # int
                                     ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1003
#int LIBUSB_CALL libusb_clear_halt(libusb_device_handle *dev,
#	unsigned char endpoint);
sub libusb_clear_halt(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                     ,uint8                         $endpoint # unsigned char
                      ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1004
#int LIBUSB_CALL libusb_reset_device(libusb_device_handle *dev);
sub libusb_reset_device(libusb_device_handle $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                        ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1007
#int LIBUSB_CALL libusb_kernel_driver_active(libusb_device_handle *dev,
#	int interface_number);
sub libusb_kernel_driver_active(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                               ,int32                         $interface_number # int
                                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1009
#int LIBUSB_CALL libusb_detach_kernel_driver(libusb_device_handle *dev,
#	int interface_number);
sub libusb_detach_kernel_driver(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                               ,int32                         $interface_number # int
                                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1011
#int LIBUSB_CALL libusb_attach_kernel_driver(libusb_device_handle *dev,
#	int interface_number);
sub libusb_attach_kernel_driver(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                               ,int32                         $interface_number # int
                                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1028
#/** \ingroup asyncio
# * Get the data section of a control transfer. This convenience function is here
# * to remind you that the data does not start until 8 bytes into the actual
# * buffer, as the setup packet comes first.
# *
# * Calling this function only makes sense from a transfer callback function,
# * or situations where you have already allocated a suitably sized buffer at
# * transfer->buffer.
# *
# * \param transfer a transfer
# * \returns pointer to the first byte of the data section
# */
#static inline unsigned char *libusb_control_transfer_get_data(
#	struct libusb_transfer *transfer)
sub libusb_control_transfer_get_data(libusb_transfer $transfer # libusb_transfer*
                                     ) is native(LIB) returns Pointer[uint8] is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1046
#/** \ingroup asyncio
# * Get the control setup packet of a control transfer. This convenience
# * function is here to remind you that the control setup occupies the first
# * 8 bytes of the transfer data buffer.
# *
# * Calling this function only makes sense from a transfer callback function,
# * or situations where you have already allocated a suitably sized buffer at
# * transfer->buffer.
# *
# * \param transfer a transfer
# * \returns a casted pointer to the start of the transfer data buffer
# */
#static inline struct libusb_control_setup *libusb_control_transfer_get_setup(
#	struct libusb_transfer *transfer)
sub libusb_control_transfer_get_setup(libusb_transfer $transfer # libusb_transfer*
                                      ) is native(LIB) returns libusb_control_setup is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1075
#/** \ingroup asyncio
# * Helper function to populate the setup packet (first 8 bytes of the data
# * buffer) for a control transfer. The wIndex, wValue and wLength values should
# * be given in host-endian byte order.
# *
# * \param buffer buffer to output the setup packet into
# * \param bmRequestType see the
# * \ref libusb_control_setup::bmRequestType "bmRequestType" field of
# * \ref libusb_control_setup
# * \param bRequest see the
# * \ref libusb_control_setup::bRequest "bRequest" field of
# * \ref libusb_control_setup
# * \param wValue see the
# * \ref libusb_control_setup::wValue "wValue" field of
# * \ref libusb_control_setup
# * \param wIndex see the
# * \ref libusb_control_setup::wIndex "wIndex" field of
# * \ref libusb_control_setup
# * \param wLength see the
# * \ref libusb_control_setup::wLength "wLength" field of
# * \ref libusb_control_setup
# */
#static inline void libusb_fill_control_setup(unsigned char *buffer,
#	uint8 bmRequestType, uint8 bRequest, uint16 wValue, uint16 wIndex,
#	uint16 wLength)
sub libusb_fill_control_setup(Pointer[uint8]                $buffer # unsigned char*
                             ,uint8                       $bmRequestType # Typedef<uint8>->|unsigned char|
                             ,uint8                       $bRequest # Typedef<uint8>->|unsigned char|
                             ,uint16                      $wValue # Typedef<uint16>->|short unsigned int|
                             ,uint16                      $wIndex # Typedef<uint16>->|short unsigned int|
                             ,uint16                      $wLength # Typedef<uint16>->|short unsigned int|
                              ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1085
#struct libusb_transfer * LIBUSB_CALL libusb_alloc_transfer(int iso_packets);
sub libusb_alloc_transfer(int32 $iso_packets # int
                          ) is native(LIB) returns libusb_transfer is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1086
#int LIBUSB_CALL libusb_submit_transfer(struct libusb_transfer *transfer);
sub libusb_submit_transfer(libusb_transfer $transfer # libusb_transfer*
                           ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1087
#int LIBUSB_CALL libusb_cancel_transfer(struct libusb_transfer *transfer);
sub libusb_cancel_transfer(libusb_transfer $transfer # libusb_transfer*
                           ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1088
#void LIBUSB_CALL libusb_free_transfer(struct libusb_transfer *transfer);
sub libusb_free_transfer(libusb_transfer $transfer # libusb_transfer*
                         ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1120
#/** \ingroup asyncio
# * Helper function to populate the required \ref libusb_transfer fields
# * for a control transfer.
# *
# * If you pass a transfer buffer to this function, the first 8 bytes will
# * be interpreted as a control setup packet, and the wLength field will be
# * used to automatically populate the \ref libusb_transfer::length "length"
# * field of the transfer. Therefore the recommended approach is:
# * -# Allocate a suitably sized data buffer (including space for control setup)
# * -# Call libusb_fill_control_setup()
# * -# If this is a host-to-device transfer with a data stage, put the data
# *    in place after the setup packet
# * -# Call this function
# * -# Call libusb_submit_transfer()
# *
# * It is also legal to pass a NULL buffer to this function, in which case this
# * function will not attempt to populate the length field. Remember that you
# * must then populate the buffer and length fields later.
# *
# * \param transfer the transfer to populate
# * \param dev_handle handle of the device that will handle the transfer
# * \param buffer data buffer. If provided, this function will interpret the
# * first 8 bytes as a setup packet and infer the transfer length from that.
# * \param callback callback function to be invoked on transfer completion
# * \param user_data user data to pass to callback function
# * \param timeout timeout for the transfer in milliseconds
# */
#static inline void libusb_fill_control_transfer(
#	struct libusb_transfer *transfer, libusb_device_handle *dev_handle,
#	unsigned char *buffer, libusb_transfer_cb_fn callback, void *user_data,
#	unsigned int timeout)
sub libusb_fill_control_transfer(libusb_transfer               $transfer # libusb_transfer*
                                ,libusb_device_handle          $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                                ,Pointer[uint8]                $buffer # unsigned char*
                                ,&callback (libusb_transfer) # Typedef<libusb_transfer_cb_fn>->|F:void ( libusb_transfer*)*|
                                ,Pointer                       $user_data # void*
                                ,uint32                        $timeout # unsigned int
                                 ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1151
#/** \ingroup asyncio
# * Helper function to populate the required \ref libusb_transfer fields
# * for a bulk transfer.
# *
# * \param transfer the transfer to populate
# * \param dev_handle handle of the device that will handle the transfer
# * \param endpoint address of the endpoint where this transfer will be sent
# * \param buffer data buffer
# * \param length length of data buffer
# * \param callback callback function to be invoked on transfer completion
# * \param user_data user data to pass to callback function
# * \param timeout timeout for the transfer in milliseconds
# */
#static inline void libusb_fill_bulk_transfer(struct libusb_transfer *transfer,
#	libusb_device_handle *dev_handle, unsigned char endpoint,
#	unsigned char *buffer, int length, libusb_transfer_cb_fn callback,
#	void *user_data, unsigned int timeout)
sub libusb_fill_bulk_transfer(libusb_transfer               $transfer # libusb_transfer*
                             ,libusb_device_handle          $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                             ,uint8                         $endpoint # unsigned char
                             ,Pointer[uint8]                $buffer # unsigned char*
                             ,int32                         $length # int
                             ,&callback (libusb_transfer) # Typedef<libusb_transfer_cb_fn>->|F:void ( libusb_transfer*)*|
                             ,Pointer                       $user_data # void*
                             ,uint32                        $timeout # unsigned int
                              ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1179
#/** \ingroup asyncio
# * Helper function to populate the required \ref libusb_transfer fields
# * for an interrupt transfer.
# *
# * \param transfer the transfer to populate
# * \param dev_handle handle of the device that will handle the transfer
# * \param endpoint address of the endpoint where this transfer will be sent
# * \param buffer data buffer
# * \param length length of data buffer
# * \param callback callback function to be invoked on transfer completion
# * \param user_data user data to pass to callback function
# * \param timeout timeout for the transfer in milliseconds
# */
#static inline void libusb_fill_interrupt_transfer(
#	struct libusb_transfer *transfer, libusb_device_handle *dev_handle,
#	unsigned char endpoint, unsigned char *buffer, int length,
#	libusb_transfer_cb_fn callback, void *user_data, unsigned int timeout)
sub libusb_fill_interrupt_transfer(libusb_transfer               $transfer # libusb_transfer*
                                  ,libusb_device_handle          $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                                  ,uint8                         $endpoint # unsigned char
                                  ,Pointer[uint8]                $buffer # unsigned char*
                                  ,int32                         $length # int
                                  ,&callback (libusb_transfer) # Typedef<libusb_transfer_cb_fn>->|F:void ( libusb_transfer*)*|
                                  ,Pointer                       $user_data # void*
                                  ,uint32                        $timeout # unsigned int
                                   ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1208
#/** \ingroup asyncio
# * Helper function to populate the required \ref libusb_transfer fields
# * for an isochronous transfer.
# *
# * \param transfer the transfer to populate
# * \param dev_handle handle of the device that will handle the transfer
# * \param endpoint address of the endpoint where this transfer will be sent
# * \param buffer data buffer
# * \param length length of data buffer
# * \param num_iso_packets the number of isochronous packets
# * \param callback callback function to be invoked on transfer completion
# * \param user_data user data to pass to callback function
# * \param timeout timeout for the transfer in milliseconds
# */
#static inline void libusb_fill_iso_transfer(struct libusb_transfer *transfer,
#	libusb_device_handle *dev_handle, unsigned char endpoint,
#	unsigned char *buffer, int length, int num_iso_packets,
#	libusb_transfer_cb_fn callback, void *user_data, unsigned int timeout)
sub libusb_fill_iso_transfer(libusb_transfer               $transfer # libusb_transfer*
                            ,libusb_device_handle          $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                            ,uint8                         $endpoint # unsigned char
                            ,Pointer[uint8]                $buffer # unsigned char*
                            ,int32                         $length # int
                            ,int32                         $num_iso_packets # int
                            ,&callback (libusb_transfer) # Typedef<libusb_transfer_cb_fn>->|F:void ( libusb_transfer*)*|
                            ,Pointer                       $user_data # void*
                            ,uint32                        $timeout # unsigned int
                             ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1230
#/** \ingroup asyncio
# * Convenience function to set the length of all packets in an isochronous
# * transfer, based on the num_iso_packets field in the transfer structure.
# *
# * \param transfer a transfer
# * \param length the length to set in each isochronous packet descriptor
# * \see libusb_get_max_packet_size()
# */
#static inline void libusb_set_iso_packet_lengths(
#	struct libusb_transfer *transfer, unsigned int length)
sub libusb_set_iso_packet_lengths(libusb_transfer               $transfer # libusb_transfer*
                                 ,uint32                        $length # unsigned int
                                  ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1254
#/** \ingroup asyncio
# * Convenience function to locate the position of an isochronous packet
# * within the buffer of an isochronous transfer.
# *
# * This is a thorough function which loops through all preceding packets,
# * accumulating their lengths to find the position of the specified packet.
# * Typically you will assign equal lengths to each packet in the transfer,
# * and hence the above method is sub-optimal. You may wish to use
# * libusb_get_iso_packet_buffer_simple() instead.
# *
# * \param transfer a transfer
# * \param packet the packet to return the address of
# * \returns the base address of the packet buffer inside the transfer buffer,
# * or NULL if the packet does not exist.
# * \see libusb_get_iso_packet_buffer_simple()
# */
#static inline unsigned char *libusb_get_iso_packet_buffer(
#	struct libusb_transfer *transfer, unsigned int packet)
sub libusb_get_iso_packet_buffer(libusb_transfer               $transfer # libusb_transfer*
                                ,uint32                        $packet # unsigned int
                                 ) is native(LIB) returns Pointer[uint8] is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1296
#/** \ingroup asyncio
# * Convenience function to locate the position of an isochronous packet
# * within the buffer of an isochronous transfer, for transfers where each
# * packet is of identical size.
# *
# * This function relies on the assumption that every packet within the transfer
# * is of identical size to the first packet. Calculating the location of
# * the packet buffer is then just a simple calculation:
# * <tt>buffer + (packet_size * packet)</tt>
# *
# * Do not use this function on transfers other than those that have identical
# * packet lengths for each packet.
# *
# * \param transfer a transfer
# * \param packet the packet to return the address of
# * \returns the base address of the packet buffer inside the transfer buffer,
# * or NULL if the packet does not exist.
# * \see libusb_get_iso_packet_buffer()
# */
#static inline unsigned char *libusb_get_iso_packet_buffer_simple(
#	struct libusb_transfer *transfer, unsigned int packet)
sub libusb_get_iso_packet_buffer_simple(libusb_transfer               $transfer # libusb_transfer*
                                       ,uint32                        $packet # unsigned int
                                        ) is native(LIB) returns Pointer[uint8] is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1317
#int LIBUSB_CALL libusb_control_transfer(libusb_device_handle *dev_handle,
#	uint8 request_type, uint8 bRequest, uint16 wValue, uint16 wIndex,
#	unsigned char *data, uint16 wLength, unsigned int timeout);
sub libusb_control_transfer(libusb_device_handle          $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                           ,uint8                       $request_type # Typedef<uint8>->|unsigned char|
                           ,uint8                       $bRequest # Typedef<uint8>->|unsigned char|
                           ,uint16                      $wValue # Typedef<uint16>->|short unsigned int|
                           ,uint16                      $wIndex # Typedef<uint16>->|short unsigned int|
                           ,Pointer[uint8]                $data # unsigned char*
                           ,uint16                      $wLength # Typedef<uint16>->|short unsigned int|
                           ,uint32                        $timeout # unsigned int
                            ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1321
#int LIBUSB_CALL libusb_bulk_transfer(libusb_device_handle *dev_handle,
#	unsigned char endpoint, unsigned char *data, int length,
#	int *actual_length, unsigned int timeout);
sub libusb_bulk_transfer(libusb_device_handle          $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                        ,uint8                         $endpoint # unsigned char
                        ,Pointer[uint8]                $data # unsigned char*
                        ,int32                         $length # int
                        ,Pointer[int32]                $actual_length # int*
                        ,uint32                        $timeout # unsigned int
                         ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1325
#int LIBUSB_CALL libusb_interrupt_transfer(libusb_device_handle *dev_handle,
#	unsigned char endpoint, unsigned char *data, int length,
#	int *actual_length, unsigned int timeout);
sub libusb_interrupt_transfer(libusb_device_handle          $dev_handle # Typedef<libusb_device_handle>->|libusb_device_handle|*
                             ,uint8                         $endpoint # unsigned char
                             ,Pointer[uint8]                $data # unsigned char*
                             ,int32                         $length # int
                             ,Pointer[int32]                $actual_length # int*
                             ,uint32                        $timeout # unsigned int
                              ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1340
#/** \ingroup desc
# * Retrieve a descriptor from the default control pipe.
# * This is a convenience function which formulates the appropriate control
# * message to retrieve the descriptor.
# *
# * \param dev a device handle
# * \param desc_type the descriptor type, see \ref libusb_descriptor_type
# * \param desc_index the index of the descriptor to retrieve
# * \param data output buffer for descriptor
# * \param length size of data buffer
# * \returns number of bytes returned in data, or LIBUSB_ERROR code on failure
# */
#static inline int libusb_get_descriptor(libusb_device_handle *dev,
#	uint8 desc_type, uint8 desc_index, unsigned char *data, int length)
sub libusb_get_descriptor(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                         ,uint8                       $desc_type # Typedef<uint8>->|unsigned char|
                         ,uint8                       $desc_index # Typedef<uint8>->|unsigned char|
                         ,Pointer[uint8]                $data # unsigned char*
                         ,int32                         $length # int
                          ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1362
#/** \ingroup desc
# * Retrieve a descriptor from a device.
# * This is a convenience function which formulates the appropriate control
# * message to retrieve the descriptor. The string returned is Unicode, as
# * detailed in the USB specifications.
# *
# * \param dev a device handle
# * \param desc_index the index of the descriptor to retrieve
# * \param langid the language ID for the string descriptor
# * \param data output buffer for descriptor
# * \param length size of data buffer
# * \returns number of bytes returned in data, or LIBUSB_ERROR code on failure
# * \see libusb_get_string_descriptor_ascii()
# */
#static inline int libusb_get_string_descriptor(libusb_device_handle *dev,
#	uint8 desc_index, uint16 langid, unsigned char *data, int length)
sub libusb_get_string_descriptor(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                                ,uint8                       $desc_index # Typedef<uint8>->|unsigned char|
                                ,uint16                      $langid # Typedef<uint16>->|short unsigned int|
                                ,Pointer[uint8]                $data # unsigned char*
                                ,int32                         $length # int
                                 ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1370
#int LIBUSB_CALL libusb_get_string_descriptor_ascii(libusb_device_handle *dev,
#	uint8 desc_index, unsigned char *data, int length);
sub libusb_get_string_descriptor_ascii(libusb_device_handle          $dev # Typedef<libusb_device_handle>->|libusb_device_handle|*
                                      ,uint8                       $desc_index # Typedef<uint8>->|unsigned char|
                                      ,Pointer[uint8]                $data # unsigned char*
                                      ,int32                         $length # int
                                       ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1374
#int LIBUSB_CALL libusb_try_lock_events(libusb_context *ctx);
sub libusb_try_lock_events(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                           ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1375
#void LIBUSB_CALL libusb_lock_events(libusb_context *ctx);
sub libusb_lock_events(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                       ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1376
#void LIBUSB_CALL libusb_unlock_events(libusb_context *ctx);
sub libusb_unlock_events(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                         ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1377
#int LIBUSB_CALL libusb_event_handling_ok(libusb_context *ctx);
sub libusb_event_handling_ok(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                             ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1378
#int LIBUSB_CALL libusb_event_handler_active(libusb_context *ctx);
sub libusb_event_handler_active(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1379
#void LIBUSB_CALL libusb_lock_event_waiters(libusb_context *ctx);
sub libusb_lock_event_waiters(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                              ) is native(LIB)  is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1380
#void LIBUSB_CALL libusb_unlock_event_waiters(libusb_context *ctx);
sub libusb_unlock_event_waiters(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                                ) is native(LIB)  is export { * }

class timeval is repr('CStruct') {
}
#-From /usr/include/libusb-1.0/libusb.h:1381
#int LIBUSB_CALL libusb_wait_for_event(libusb_context *ctx, struct timeval *tv);
sub libusb_wait_for_event(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                         ,timeval                       $tv # timeval*
                          ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1384
#int LIBUSB_CALL libusb_handle_events_timeout(libusb_context *ctx,
#	struct timeval *tv);
sub libusb_handle_events_timeout(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                                ,timeval                       $tv # timeval*
                                 ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1386
#int LIBUSB_CALL libusb_handle_events_timeout_completed(libusb_context *ctx,
#	struct timeval *tv, int *completed);
sub libusb_handle_events_timeout_completed(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                                          ,timeval                       $tv # timeval*
                                          ,Pointer[int32]                $completed # int*
                                           ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1387
#int LIBUSB_CALL libusb_handle_events(libusb_context *ctx);
sub libusb_handle_events(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                         ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1388
#int LIBUSB_CALL libusb_handle_events_completed(libusb_context *ctx, int *completed);
sub libusb_handle_events_completed(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                                  ,Pointer[int32]                $completed # int*
                                   ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1390
#int LIBUSB_CALL libusb_handle_events_locked(libusb_context *ctx,
#	struct timeval *tv);
sub libusb_handle_events_locked(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                               ,timeval                       $tv # timeval*
                                ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1391
#int LIBUSB_CALL libusb_pollfds_handle_timeouts(libusb_context *ctx);
sub libusb_pollfds_handle_timeouts(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                                   ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1393
#int LIBUSB_CALL libusb_get_next_timeout(libusb_context *ctx,
#	struct timeval *tv);
sub libusb_get_next_timeout(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                           ,timeval                       $tv # timeval*
                            ) is native(LIB) returns int32 is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1434
#const struct libusb_pollfd ** LIBUSB_CALL libusb_get_pollfds(
#	libusb_context *ctx);
sub libusb_get_pollfds(libusb_context $ctx # Typedef<libusb_context>->|libusb_context|*
                       ) is native(LIB) returns Pointer[libusb_pollfd] is export { * }

#-From /usr/include/libusb-1.0/libusb.h:1437
#void LIBUSB_CALL libusb_set_pollfd_notifiers(libusb_context *ctx,
#	libusb_pollfd_added_cb added_cb, libusb_pollfd_removed_cb removed_cb,
#	void *user_data);
sub libusb_set_pollfd_notifiers(libusb_context                $ctx # Typedef<libusb_context>->|libusb_context|*
                               ,&added_cb (int32, int16, Pointer) # Typedef<libusb_pollfd_added_cb>->|F:void ( int, short int, void*)*|
                               ,&removed_cb (int32, Pointer) # Typedef<libusb_pollfd_removed_cb>->|F:void ( int, void*)*|
                               ,Pointer                       $user_data # void*
                                ) is native(LIB)  is export { * }

## Externs

}

# vim: expandtab shiftwidth=4 ft=perl6
