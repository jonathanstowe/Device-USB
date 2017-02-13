use NativeCall;

class Device::USB {

    my constant LIB = [ 'usb-0.1', v4 ];

    class DescriptorHeader is repr('CStruct') {
        has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
        has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
    }

    class StringDescriptor is repr('CStruct') {
        has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
        has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
        has CArray[uint16]              $.wData; # Typedef<uint16>->|short unsigned int|[1] wData
    }

    class HIDDescriptor is repr('CStruct') {
        has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
        has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
        has uint16                      $.bcdHID; # Typedef<uint16>->|short unsigned int| bcdHID
        has uint8                       $.bCountryCode; # Typedef<uint8>->|unsigned char| bCountryCode
        has uint8                       $.bNumDescriptors; # Typedef<uint8>->|unsigned char| bNumDescriptors
    }

    class EndpointDescriptor is repr('CStruct') {
        has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
        has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
        has uint8                       $.bEndpointAddress; # Typedef<uint8>->|unsigned char| bEndpointAddress
        has uint8                       $.bmAttributes; # Typedef<uint8>->|unsigned char| bmAttributes
        has uint16                      $.wMaxPacketSize; # Typedef<uint16>->|short unsigned int| wMaxPacketSize
        has uint8                       $.bInterval; # Typedef<uint8>->|unsigned char| bInterval
        has uint8                       $.bRefresh; # Typedef<uint8>->|unsigned char| bRefresh
        has uint8                       $.bSynchAddress; # Typedef<uint8>->|unsigned char| bSynchAddress
        has Pointer[uint8]              $.extra; # unsigned char* extra
        has int32                       $.extralen; # int extralen
    }

    class InterfaceDescriptor is repr('CStruct') {
        has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
        has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
        has uint8                       $.bInterfaceNumber; # Typedef<uint8>->|unsigned char| bInterfaceNumber
        has uint8                       $.bAlternateSetting; # Typedef<uint8>->|unsigned char| bAlternateSetting
        has uint8                       $.bNumEndpoints; # Typedef<uint8>->|unsigned char| bNumEndpoints
        has uint8                       $.bInterfaceClass; # Typedef<uint8>->|unsigned char| bInterfaceClass
        has uint8                       $.bInterfaceSubClass; # Typedef<uint8>->|unsigned char| bInterfaceSubClass
        has uint8                       $.bInterfaceProtocol; # Typedef<uint8>->|unsigned char| bInterfaceProtocol
        has uint8                       $.iInterface; # Typedef<uint8>->|unsigned char| iInterface
        has EndpointDescriptor          $.endpoint; # EndpointDescriptor* endpoint
        has Pointer[uint8]              $.extra; # unsigned char* extra
        has int32                       $.extralen; # int extralen
    }

    class Interface is repr('CStruct') {
        has InterfaceDescriptor      $.altsetting; # InterfaceDescriptor* altsetting
        has int32                         $.num_altsetting; # int num_altsetting
    }

    class ConfigDescriptor is repr('CStruct') {
        has uint8                       $.bLength; # Typedef<uint8>->|unsigned char| bLength
        has uint8                       $.bDescriptorType; # Typedef<uint8>->|unsigned char| bDescriptorType
        has uint16                      $.wTotalLength; # Typedef<uint16>->|short unsigned int| wTotalLength
        has uint8                       $.bNumInterfaces; # Typedef<uint8>->|unsigned char| bNumInterfaces
        has uint8                       $.bConfigurationValue; # Typedef<uint8>->|unsigned char| bConfigurationValue
        has uint8                       $.iConfiguration; # Typedef<uint8>->|unsigned char| iConfiguration
        has uint8                       $.bmAttributes; # Typedef<uint8>->|unsigned char| bmAttributes
        has uint8                       $.MaxPower; # Typedef<uint8>->|unsigned char| MaxPower
        has Interface                 $.interface; # Interface* interface
        has Pointer[uint8]                $.extra; # unsigned char* extra
        has int32                         $.extralen; # int extralen
    }

    class DeviceDescriptor is repr('CStruct') {
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

    class ControlSetup is repr('CStruct') {
        has uint8                       $.bRequestType; # Typedef<uint8>->|unsigned char| bRequestType
        has uint8                       $.bRequest; # Typedef<uint8>->|unsigned char| bRequest
        has uint16                      $.wValue; # Typedef<uint16>->|short unsigned int| wValue
        has uint16                      $.wIndex; # Typedef<uint16>->|short unsigned int| wIndex
        has uint16                      $.wLength; # Typedef<uint16>->|short unsigned int| wLength
    }

    class Bus    is repr('CStruct') is Any { ... }
    class Device is repr('CStruct') is Any { ... }

    class Device  {
        has Device                    $.next; # Device* next
        has Device                    $.prev; # Device* prev
        has CArray[int8]                  $.filename; # char[4097] filename
        has Bus                       $.bus; # Bus* bus
        HAS DeviceDescriptor         $.descriptor; # DeviceDescriptor descriptor
        has ConfigDescriptor         $.config; # ConfigDescriptor* config
        has Pointer                       $.dev; # void* dev
        has uint8                         $.devnum; # Typedef<uint8>->|unsigned char| devnum
        has uint8                         $.num_children; # unsigned char num_children
        has CArray[Device]           $.children; # Device** children
    }

    class Bus {
        has Bus                       $.next; # Bus* next
        has Bus                       $.prev; # Bus* prev
        has CArray[int8]              $.dirname; # char[4097] dirname
        has Device                    $.devices; # Device* devices
        has uint32                    $.location; # Typedef<uint32>->|unsigned int| location
        has Device                    $.root_dev; # Device* root_dev
    }

    class DeviceHandle is repr('CPointer') {
    }




# == /usr/include/usb.h ==

#-From /usr/include/usb.h:285
#/* usb.c */
#DeviceHandle *usb_open(struct Device *dev);
sub usb_open(Device $dev # Device*
             ) is native(LIB) returns DeviceHandle { * }

#-From /usr/include/usb.h:286
#int usb_close(DeviceHandle *dev);
sub usb_close(DeviceHandle $dev # Typedef<DeviceHandle>->|DeviceHandle|*
              ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:288
#int usb_get_string(DeviceHandle *dev, int index, int langid, char *buf,
#    size_t buflen);
sub usb_get_string(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                  ,int32                         $index # int
                  ,int32                         $langid # int
                  ,Str                           $buf # char*
                  ,size_t                        $buflen # Typedef<size_t>->|unsigned int|
                   ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:290
#int usb_get_string_simple(DeviceHandle *dev, int index, char *buf,
#    size_t buflen);
sub usb_get_string_simple(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                         ,int32                         $index # int
                         ,Str                           $buf # char*
                         ,size_t                        $buflen # Typedef<size_t>->|unsigned int|
                          ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:294
#/* descriptors.c */
#int usb_get_descriptor_by_endpoint(DeviceHandle *udev, int ep,
#    unsigned char type, unsigned char index, void *buf, int size);
sub usb_get_descriptor_by_endpoint(DeviceHandle                $udev # Typedef<DeviceHandle>->|DeviceHandle|*
                                  ,int32                         $ep # int
                                  ,uint8                         $type # unsigned char
                                  ,uint8                         $index # unsigned char
                                  ,Pointer                       $buf # void*
                                  ,int32                         $size # int
                                   ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:296
#int usb_get_descriptor(DeviceHandle *udev, unsigned char type,
#    unsigned char index, void *buf, int size);
sub usb_get_descriptor(DeviceHandle                $udev # Typedef<DeviceHandle>->|DeviceHandle|*
                      ,uint8                         $type # unsigned char
                      ,uint8                         $index # unsigned char
                      ,Pointer                       $buf # void*
                      ,int32                         $size # int
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:300
#/* <arch>.c */
#int usb_bulk_write(DeviceHandle *dev, int ep, const char *bytes, int size,
#    int timeout);
sub usb_bulk_write(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                  ,int32                         $ep # int
                  ,Str                           $bytes # const char*
                  ,int32                         $size # int
                  ,int32                         $timeout # int
                   ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:302
#int usb_bulk_read(DeviceHandle *dev, int ep, char *bytes, int size,
#    int timeout);
sub usb_bulk_read(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                 ,int32                         $ep # int
                 ,Str                           $bytes # char*
                 ,int32                         $size # int
                 ,int32                         $timeout # int
                  ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:304
#int usb_interrupt_write(DeviceHandle *dev, int ep, const char *bytes, int size,
#        int timeout);
sub usb_interrupt_write(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                       ,int32                         $ep # int
                       ,Str                           $bytes # const char*
                       ,int32                         $size # int
                       ,int32                         $timeout # int
                        ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:306
#int usb_interrupt_read(DeviceHandle *dev, int ep, char *bytes, int size,
#        int timeout);
sub usb_interrupt_read(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                      ,int32                         $ep # int
                      ,Str                           $bytes # char*
                      ,int32                         $size # int
                      ,int32                         $timeout # int
                       ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:308
#int usb_control_msg(DeviceHandle *dev, int requesttype, int request,
#    int value, int index, char *bytes, int size, int timeout);
sub usb_control_msg(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                   ,int32                         $requesttype # int
                   ,int32                         $request # int
                   ,int32                         $value # int
                   ,int32                         $index # int
                   ,Str                           $bytes # char*
                   ,int32                         $size # int
                   ,int32                         $timeout # int
                    ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:309
#int usb_set_configuration(DeviceHandle *dev, int configuration);
sub usb_set_configuration(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                         ,int32                         $configuration # int
                          ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:310
#int usb_claim_interface(DeviceHandle *dev, int interface);
sub usb_claim_interface(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                       ,int32                         $interface # int
                        ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:311
#int usb_release_interface(DeviceHandle *dev, int interface);
sub usb_release_interface(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                         ,int32                         $interface # int
                          ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:312
#int usb_set_altinterface(DeviceHandle *dev, int alternate);
sub usb_set_altinterface(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                        ,int32                         $alternate # int
                         ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:313
#int usb_resetep(DeviceHandle *dev, unsigned int ep);
sub usb_resetep(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
               ,uint32                        $ep # unsigned int
                ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:314
#int usb_clear_halt(DeviceHandle *dev, unsigned int ep);
sub usb_clear_halt(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                  ,uint32                        $ep # unsigned int
                   ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:315
#int usb_reset(DeviceHandle *dev);
sub usb_reset(DeviceHandle $dev # Typedef<DeviceHandle>->|DeviceHandle|*
              ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:320
##if 1
##define LIBUSB_HAS_GET_DRIVER_NP 1
#int usb_get_driver_np(DeviceHandle *dev, int interface, char *name,
#    unsigned int namelen);
sub usb_get_driver_np(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                     ,int32                         $interface # int
                     ,Str                           $name # char*
                     ,uint32                        $namelen # unsigned int
                      ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:322
##define LIBUSB_HAS_DETACH_KERNEL_DRIVER_NP 1
#int usb_detach_kernel_driver_np(DeviceHandle *dev, int interface);
sub usb_detach_kernel_driver_np(DeviceHandle                $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                               ,int32                         $interface # int
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:325
#char *usb_strerror(void);
sub usb_strerror(
                 ) is native(LIB) returns Str { * }

#-From /usr/include/usb.h:327
#void usb_init(void);
sub usb_init(
             ) is native(LIB)  { * }

#-From /usr/include/usb.h:328
#void usb_set_debug(int level);
sub usb_set_debug(int32 $level # int
                  ) is native(LIB)  { * }

#-From /usr/include/usb.h:329
#int usb_find_busses(void);
sub usb_find_busses(
                    ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:330
#int usb_find_devices(void);
sub usb_find_devices(
                     ) is native(LIB) returns int32 { * }

#-From /usr/include/usb.h:331
#struct Device *Device(DeviceHandle *dev);
sub Device(DeviceHandle $dev # Typedef<DeviceHandle>->|DeviceHandle|*
               ) is native(LIB) returns Device { * }

#-From /usr/include/usb.h:332
#struct Bus *usb_get_busses(void);
sub usb_get_busses(
                   ) is native(LIB) returns Bus { * }


# == /usr/include/usb.h ==

our $Busses = cglobal(LIB, "usb_busses", Bus);
}

# vim: expandtab shiftwidth=4 ft=perl6
