use NativeCall;
use NativeHelpers::Array;

class Device::USB {

    my constant LIB = [ 'usb-1.0', v0 ];


    enum ClassCode (
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

    enum DescriptorType (
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
    enum EndpointDirection (
       LIBUSB_ENDPOINT_IN => 128,
       LIBUSB_ENDPOINT_OUT => 0
    );
    enum TransferType (
       LIBUSB_TRANSFER_TYPE_CONTROL => 0,
       LIBUSB_TRANSFER_TYPE_ISOCHRONOUS => 1,
       LIBUSB_TRANSFER_TYPE_BULK => 2,
       LIBUSB_TRANSFER_TYPE_INTERRUPT => 3
    );
    enum StandardRequest (
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
    enum RequestType (
       LIBUSB_REQUEST_TYPE_STANDARD => 0,
       LIBUSB_REQUEST_TYPE_CLASS => 32,
       LIBUSB_REQUEST_TYPE_VENDOR => 64,
       LIBUSB_REQUEST_TYPE_RESERVED => 96
    );
    enum RequestRecipient (
       LIBUSB_RECIPIENT_DEVICE => 0,
       LIBUSB_RECIPIENT_INTERFACE => 1,
       LIBUSB_RECIPIENT_ENDPOINT => 2,
       LIBUSB_RECIPIENT_OTHER => 3
    );
    enum ISOSyncType (
       LIBUSB_ISO_SYNC_TYPE_NONE => 0,
       LIBUSB_ISO_SYNC_TYPE_ASYNC => 1,
       LIBUSB_ISO_SYNC_TYPE_ADAPTIVE => 2,
       LIBUSB_ISO_SYNC_TYPE_SYNC => 3
    );
    enum ISOUsageType (
       LIBUSB_ISO_USAGE_TYPE_DATA => 0,
       LIBUSB_ISO_USAGE_TYPE_FEEDBACK => 1,
       LIBUSB_ISO_USAGE_TYPE_IMPLICIT => 2
    );
    enum Speed (
       LIBUSB_SPEED_UNKNOWN => 0,
       LIBUSB_SPEED_LOW => 1,
       LIBUSB_SPEED_FULL => 2,
       LIBUSB_SPEED_HIGH => 3,
       LIBUSB_SPEED_SUPER => 4
    );
    enum Error (
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
    enum TransferStatus (
       LIBUSB_TRANSFER_COMPLETED => 0,
       LIBUSB_TRANSFER_ERROR => 1,
       LIBUSB_TRANSFER_TIMED_OUT => 2,
       LIBUSB_TRANSFER_CANCELLED => 3,
       LIBUSB_TRANSFER_STALL => 4,
       LIBUSB_TRANSFER_NO_DEVICE => 5,
       LIBUSB_TRANSFER_OVERFLOW => 6
    );
    enum TransferFlags (
       LIBUSB_TRANSFER_SHORT_NOT_OK => 1,
       LIBUSB_TRANSFER_FREE_BUFFER => 2,
       LIBUSB_TRANSFER_FREE_TRANSFER => 4,
       LIBUSB_TRANSFER_ADD_ZERO_PACKET => 8
    );
    enum libusb_capability (
       LIBUSB_CAP_HAS_CAPABILITY => 0
    );

    class DeviceDescriptor is repr('CStruct') {
        has uint8                       $.bLength;
        has uint8                       $.bDescriptorType;
        has uint16                      $.bcdUSB;
        has uint8                       $.bDeviceClass;
        has uint8                       $.bDeviceSubClass;
        has uint8                       $.bDeviceProtocol;
        has uint8                       $.bMaxPacketSize0;
        has uint16                      $.idVendor;
        has uint16                      $.idProduct;
        has uint16                      $.bcdDevice;
        has uint8                       $.iManufacturer;
        has uint8                       $.iProduct;
        has uint8                       $.iSerialNumber;
        has uint8                       $.bNumConfigurations;
    }
    class EndpointDescriptor is repr('CStruct') {
        has uint8                       $.bLength;
        has uint8                       $.bDescriptorType;
        has uint8                       $.bEndpointAddress;
        has uint8                       $.bmAttributes;
        has uint16                      $.wMaxPacketSize;
        has uint8                       $.bInterval;
        has uint8                       $.bRefresh;
        has uint8                       $.bSynchAddress;
        has CArray[uint8]               $.extra;
        has int32                       $.extra_length;
    }

    class InterfaceDescriptor is repr('CStruct') {
        has uint8                       $.bLength;
        has uint8                       $.bDescriptorType;
        has uint8                       $.bInterfaceNumber;
        has uint8                       $.bAlternateSetting;
        has uint8                       $.bNumEndpoints;
        has uint8                       $.bInterfaceClass;
        has uint8                       $.bInterfaceSubClass;
        has uint8                       $.bInterfaceProtocol;
        has uint8                       $.iInterface;
        has EndpointDescriptor          $.endpoint;
        has CArray[uint8]               $.extra;
        has int32                       $.extra_length;
    }
    class Interface is repr('CStruct') {
        has InterfaceDescriptor   $.altsetting;
        has int32                 $.num_altsetting;
    }
    class ConfigDescriptor is repr('CStruct') {
        has uint8                       $.bLength;
        has uint8                       $.bDescriptorType;
        has uint16                      $.wTotalLength;
        has uint8                       $.bNumInterfaces;
        has uint8                       $.bConfigurationValue;
        has uint8                       $.iConfiguration;
        has uint8                       $.bmAttributes;
        has uint8                       $.MaxPower;
        has Interface                   $.interface;
        has CArray[uint8]               $.extra;
        has int32                       $.extra_length;
    }

    class ControlSetup is repr('CStruct') {
        has uint8                       $.bmRequestType;
        has uint8                       $.bRequest;
        has uint16                      $.wValue;
        has uint16                      $.wIndex;
        has uint16                      $.wLength;
    }

    sub libusb_error_name(int32 $errcode --> Str ) is native(LIB) { * }

    class X::USB is Exception {
        has Str $.message;
        has Int $.code;

        method message( --> Str ) {
            if $!code.defined {
                $!message = libusb_error_name($!code);
            }
            $!message;
        }

    }

    sub check-call(Int $code) {
        if $code < 0 {
            X::USB.new(:$code).throw;
        }
        $code;
    }

    class Context is repr('CPointer') {
    }

    class Device is repr('CPointer') {
        ...
    }

    class DeviceHandle is repr('CPointer') {
        sub libusb_close(DeviceHandle $dev_handle) is native(LIB)  { * }

        method close(DeviceHandle:D:) {
            libusb_close(self);
        }

        sub libusb_get_device(DeviceHandle $dev_handle --> Device ) is native(LIB) { * }

        method device(DeviceHandle:D: --> Device ) {
            libusb_get_device(self);
        }

        sub libusb_get_configuration(DeviceHandle $dev, Pointer[int32] $config is rw --> int32 ) is native(LIB) { * }

        proto method configuration(|c) { * }

        multi method configuration(DeviceHandle:D: --> Int ) {
            my $pconfig = Pointer[int32].new;
            libusb_get_configuration(self, $pconfig);
            $pconfig.deref;
        }

        sub libusb_set_configuration(DeviceHandle $dev,int32 $configuration --> int32 ) is native(LIB) { * }

        multi method configuration(DeviceHandle:D: Int $configuration --> Int ) {
            libusb_set_configuration(self, $configuration );
            $configuration;
        }

        sub libusb_claim_interface(DeviceHandle $dev, int32 $interface_number --> int32) is native(LIB) { * }

        method claim-interface(DeviceHandle:D: Int $interface-number --> Bool) {
            !check-call libusb_claim_interface(self, $interface-number);
        }

        sub libusb_release_interface(DeviceHandle   $dev, int32 $interface_number --> int32 ) is native(LIB) { * }

        method release-interface(DeviceHandle:D: Int $interface-number --> Bool ) {
            !check-call libusb_release_interface(self, $interface-number);
        }


#-From /usr/include/libusb-1.0/libusb.h:1001
#int LIBUSB_CALL libusb_set_interface_alt_setting(DeviceHandle *dev,
#    int interface_number, int alternate_setting);
        sub libusb_set_interface_alt_setting(DeviceHandle          $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                                            ,int32                         $interface_number # int
                                            ,int32                         $alternate_setting # int
                                             ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1003
#int LIBUSB_CALL libusb_clear_halt(DeviceHandle *dev,
#    unsigned char endpoint);
        sub libusb_clear_halt(DeviceHandle          $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                             ,uint8                         $endpoint # unsigned char
                              ) is native(LIB) returns int32 { * }

        sub libusb_reset_device(DeviceHandle $dev --> int32 ) is native(LIB) { * }

        method reset-device(DeviceHandle:D:) {
            libusb_reset_device(self);
        }

        sub libusb_kernel_driver_active(DeviceHandle $dev, int32 $interface_number --> int32 ) is native(LIB) { * }

        method kernel-driver-active(DeviceHandle:D: Int $interface-number --> Bool ) {
            # This probably isn't quite wrong as it is no/yes/something went wrong
            ?libusb_kernel_driver_active(self, $interface-number);
        }


        sub libusb_detach_kernel_driver(DeviceHandle $dev,int32 $interface_number --> int32 ) is native(LIB) { * }

        method detach-kernel-driver(DeviceHandle:D: Int $interface-number --> Bool ) {
            !libusb_detach_kernel_driver(self, $interface-number);
        }

        sub libusb_attach_kernel_driver(DeviceHandle $dev, int32 $interface_number --> int32 ) is native(LIB) { * }

        method attach-kernel-driver(DeviceHandle:D: Int $interface-number --> Bool ) {
            !libusb_attach_kernel_driver(self, $interface-number)
        }

        sub libusb_control_transfer(DeviceHandle    $dev_handle,
                                    uint8           $request_type,
                                    uint8           $bRequest,
                                    uint16          $wValue,
                                    uint16          $wIndex,
                                    CArray[uint8]   $data,
                                    uint16          $wLength,
                                    uint32          $timeout --> int32 ) is native(LIB) { * }

        proto method control-transfer(|c) { * }

=begin note

dev_handle    a handle for the device to communicate with
bmRequestType    the request type field for the setup packet
bRequest    the request field for the setup packet
wValue    the value field for the setup packet
wIndex    the index field for the setup packet
data    a suitably-sized data buffer for either input or output (depending on direction bits within bmRequestType)
wLength    the length field for the setup packet. The data buffer should be at least this size.
timeout    timeout (in millseconds) that this function should wait before giving up due to no response being received. For an unlimited timeout, use value 0.

=end note

        multi method control-transfer(DeviceHandle:D: Int $request-type, Int $bRequest, Int $wValue, Int $wIndex, CArray[uint8] $data, Int $wLength, Int $timeout) {
            libusb_control_transfer(self, $request-type, $bRequest, $wValue, $wIndex, $data, $wLength, $timeout )
        }

#-From /usr/include/libusb-1.0/libusb.h:1321
#int LIBUSB_CALL libusb_bulk_transfer(DeviceHandle *dev_handle,
#    unsigned char endpoint, unsigned char *data, int length,
#    int *actual_length, unsigned int timeout);
        sub libusb_bulk_transfer(DeviceHandle          $dev_handle # Typedef<DeviceHandle>->|DeviceHandle|*
                                ,uint8                         $endpoint # unsigned char
                                ,Pointer[uint8]                $data # unsigned char*
                                ,int32                         $length # int
                                ,Pointer[int32]                $actual_length # int*
                                ,uint32                        $timeout # unsigned int
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1325
#int LIBUSB_CALL libusb_interrupt_transfer(DeviceHandle *dev_handle,
#    unsigned char endpoint, unsigned char *data, int length,
#    int *actual_length, unsigned int timeout);
        sub libusb_interrupt_transfer(DeviceHandle          $dev_handle # Typedef<DeviceHandle>->|DeviceHandle|*
                                     ,uint8                         $endpoint # unsigned char
                                     ,Pointer[uint8]                $data # unsigned char*
                                     ,int32                         $length # int
                                     ,Pointer[int32]                $actual_length # int*
                                     ,uint32                        $timeout # unsigned int
                                      ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1340
#/** \ingroup desc
# * Retrieve a descriptor from the default control pipe.
# * This is a convenience function which formulates the appropriate control
# * message to retrieve the descriptor.
# *
# * \param dev a device handle
# * \param desc_type the descriptor type, see \ref DescriptorType
# * \param desc_index the index of the descriptor to retrieve
# * \param data output buffer for descriptor
# * \param length size of data buffer
# * \returns number of bytes returned in data, or LIBUSB_ERROR code on failure
# */
#static inline int libusb_get_descriptor(DeviceHandle *dev,
#    uint8 desc_type, uint8 desc_index, unsigned char *data, int length)
        sub libusb_get_descriptor(DeviceHandle          $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                                 ,uint8                       $desc_type # Typedef<uint8>->|unsigned char|
                                 ,uint8                       $desc_index # Typedef<uint8>->|unsigned char|
                                 ,Pointer[uint8]                $data # unsigned char*
                                 ,int32                         $length # int
                                  ) is native(LIB) returns int32 { * }

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
#static inline int libusb_get_string_descriptor(DeviceHandle *dev,
#    uint8 desc_index, uint16 langid, unsigned char *data, int length)
        sub libusb_get_string_descriptor(DeviceHandle          $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                                        ,uint8                       $desc_index # Typedef<uint8>->|unsigned char|
                                        ,uint16                      $langid # Typedef<uint16>->|short unsigned int|
                                        ,Pointer[uint8]                $data # unsigned char*
                                        ,int32                         $length # int
                                         ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1370
#int LIBUSB_CALL libusb_get_string_descriptor_ascii(DeviceHandle *dev,
#    uint8 desc_index, unsigned char *data, int length);
        sub libusb_get_string_descriptor_ascii(DeviceHandle          $dev # Typedef<DeviceHandle>->|DeviceHandle|*
                                              ,uint8                       $desc_index # Typedef<uint8>->|unsigned char|
                                              ,Pointer[uint8]                $data # unsigned char*
                                              ,int32                         $length # int
                                               ) is native(LIB) returns int32 { * }

    }

    class Device {
        sub libusb_get_device_descriptor(Device $dev, DeviceDescriptor $desc ) is native(LIB) returns int32 { * }

        method device-descriptor() returns DeviceDescriptor {
            my $dd = DeviceDescriptor.new;

            check-call libusb_get_device_descriptor(self, $dd);

            $dd;
        }

        sub libusb_get_bus_number(Device $dev) is native(LIB) returns uint8 { * }

        method bus-number() returns Int {
            libusb_get_bus_number(self);
        }

        sub libusb_get_device_address(Device $dev) is native(LIB) returns uint8 { * }

        method address() returns Int  {
            libusb_get_device_address(self);
        }

        sub libusb_get_device_speed(Device $dev) is native(LIB) returns int32 { * }

        method speed() returns Speed {
            Speed(libusb_get_device_speed(self));
        }


        sub libusb_get_max_packet_size(Device $dev, uint8 $endpoint) is native(LIB) returns int32 { * }

        method max-packet-size(Int $endpoint) returns Int {
            libusb_get_max_packet_size(self, $endpoint);
        }

        sub libusb_get_max_iso_packet_size(Device $dev, uint8 $endpoint ) is native(LIB) returns int32 { * }

        method max-iso-packet-size(Int $endpoint ) returns Int {
            libusb_get_max_iso_packet_size(self, $endpoint);
        }

        sub libusb_open(Device $dev, Pointer[DeviceHandle] $handle) is native(LIB) returns int32 { * }

        method open() returns DeviceHandle {
            my $pdh = Pointer[DeviceHandle].new;

            check-call libusb_open(self, $pdh);

            $pdh.deref;
        }

        sub libusb_ref_device(Device $dev) is native(LIB) returns Device { * }

        method reference(--> Device) {
            libusb_ref_device(self);
        }

        sub libusb_unref_device(Device $dev) is native(LIB)  { * }

        method unreference() {
            libusb_unref_device(self);
        }


    }



    class Version is repr('CStruct') {
        has uint16                      $.major;
        has uint16                      $.minor;
        has uint16                      $.micro;
        has uint16                      $.nano;
        has Str                         $.rc;
        has Str                         $.describe;
        method Str() returns Str {
            sprintf "%i.%i.%i", $!major, $!minor, $!micro;
        }
    }

    class PacketDescriptor is repr('CStruct') {
        has uint32                        $.length;
        has uint32                        $.actual_length;
        has int32                         $.status;
    }
    class Transfer is repr('CStruct') {
        has DeviceHandle                $.dev_handle;
        has uint8                       $.flags;
        has uint8                       $.endpoint;
        has uint8                       $.type;
        has uint32                      $.timeout;
        has int32                       $.status;
        has int32                       $.length;
        has int32                       $.actual_length;
        has Pointer                     $.callback;
        has Pointer                     $.user_data;
        has CArray[uint8]               $.buffer;
        has int32                       $.num_iso_packets;
        has CArray[PacketDescriptor]    $.iso_packet_desc;
    }

    class PollFD is repr('CStruct') {
        has int32                         $.fd;
        has int16                         $.events;
    }

## Extras stuff

=begin comment

constant DeviceHandle := DeviceHandle;
constant Context := Context;
constant Device := Device;
constant sigset_t := __sigset_t;
constant fsid_t := __fsid_t;
constant __pthread_slist_t := __pthread_internal_slist;

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
                           ) is native(LIB) returns uint16 { * }

#-From /usr/include/libusb-1.0/libusb.h:952
#int LIBUSB_CALL libusb_init(Context **ctx);
    sub libusb_init(Pointer[Context] $ctx is rw ) is native(LIB) returns int32 { * }


    has Context $!context;

    multi submethod BUILD() {
        my $ctx = Pointer[Context].new;

        check-call libusb_init($ctx);

        $!context = $ctx.deref;
    }


    sub libusb_exit(Context $ctx) is native(LIB)  { * }

    method dispose() {
        if $!context.defined {
            libusb_exit($!context);
            $!context = Context;
        }
    }

    method DESTROY() {
        self.dispose;
    }

#-From /usr/include/libusb-1.0/libusb.h:954
#void LIBUSB_CALL libusb_set_debug(Context *ctx, int level);

    enum LogLevel is export (
        LIBUSB_LOG_LEVEL_NONE => 0,
        LIBUSB_LOG_LEVEL_ERROR => 1,
        LIBUSB_LOG_LEVEL_WARNING => 2,
        LIBUSB_LOG_LEVEL_INFO => 3,
        LIBUSB_LOG_LEVEL_DEBUG => 4,
    );

    sub libusb_set_debug(Context $ctx, int32 $level) is native(LIB)  { * }

    method log-level(LogLevel $level) {
        libusb_set_debug($!context, $level);
    }

#-From /usr/include/libusb-1.0/libusb.h:955
#const struct Version * LIBUSB_CALL libusb_get_version(void);
    sub libusb_get_version() is native(LIB) returns Version { * }

    method version() {
        libusb_get_version();
    }

#-From /usr/include/libusb-1.0/libusb.h:956
#int LIBUSB_CALL libusb_has_capability(uint32 capability);
    sub libusb_has_capability(uint32 $capability # Typedef<uint32>->|unsigned int|
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:957
#const char * LIBUSB_CALL Error_name(int errcode);

#-From /usr/include/libusb-1.0/libusb.h:960
#ssize_t LIBUSB_CALL libusb_get_device_list(Context *ctx,
#    Device ***list);
    sub libusb_get_device_list(Context $ctx, Pointer[CArray[Device]] $list is rw ) is native(LIB) returns ssize_t { * }

    method device-list( --> Array[Device]) {
        my $list = Pointer[CArray[Device]].new;

        my $num = libusb_get_device_list($!context, $list);
        my $actual = $list.deref;
        my Device @array = copy-to-array($actual, $num);

        # We're done with the list but will leave the Devices
        # referenced as we don't know what the caller will do
        libusb_free_device_list($actual, 0);
        @array;
    }

    sub libusb_free_device_list(CArray[Device] $list, int32 $unref_devices) is native(LIB)  { * }


    sub libusb_open_device_with_vid_pid(Context $ctx, uint16 $vendor_id, uint16 $product_id --> DeviceHandle ) is native(LIB) { * }

    method open-device(Int $vendor-id, Int $product-id --> DeviceHandle ) {
        libusb_open_device_with_vid_pid($!context, $vendor-id, $product-id)
    }

#-From /usr/include/libusb-1.0/libusb.h:971
#int LIBUSB_CALL libusb_get_active_config_descriptor(Device *dev,
#    struct ConfigDescriptor **config);
    sub libusb_get_active_config_descriptor(Device                 $dev # Typedef<Device>->|Device|*
                                           ,Pointer[ConfigDescriptor]$config # ConfigDescriptor**
                                            ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:973
#int LIBUSB_CALL libusb_get_config_descriptor(Device *dev,
#    uint8 config_index, struct ConfigDescriptor **config);
    sub libusb_get_config_descriptor(Device                 $dev # Typedef<Device>->|Device|*
                                    ,uint8                       $config_index # Typedef<uint8>->|unsigned char|
                                    ,Pointer[ConfigDescriptor]$config # ConfigDescriptor**
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:975
#int LIBUSB_CALL libusb_get_config_descriptor_by_value(Device *dev,
#    uint8 bConfigurationValue, struct ConfigDescriptor **config);
    sub libusb_get_config_descriptor_by_value(Device                 $dev # Typedef<Device>->|Device|*
                                             ,uint8                       $bConfigurationValue # Typedef<uint8>->|unsigned char|
                                             ,Pointer[ConfigDescriptor]$config # ConfigDescriptor**
                                              ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:977
#void LIBUSB_CALL libusb_free_config_descriptor(
#    struct ConfigDescriptor *config);
    sub libusb_free_config_descriptor(ConfigDescriptor $config # ConfigDescriptor*
                                      ) is native(LIB)  { * }



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
#    struct Transfer *transfer)
    sub libusb_control_transfer_get_data(Transfer $transfer # Transfer*
                                         ) is native(LIB) returns Pointer[uint8] { * }

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
#static inline struct ControlSetup *libusb_control_transfer_get_setup(
#    struct Transfer *transfer)
    sub libusb_control_transfer_get_setup(Transfer $transfer # Transfer*
                                          ) is native(LIB) returns ControlSetup { * }

#-From /usr/include/libusb-1.0/libusb.h:1075
#/** \ingroup asyncio
# * Helper function to populate the setup packet (first 8 bytes of the data
# * buffer) for a control transfer. The wIndex, wValue and wLength values should
# * be given in host-endian byte order.
# *
# * \param buffer buffer to output the setup packet into
# * \param bmRequestType see the
# * \ref ControlSetup::bmRequestType "bmRequestType" field of
# * \ref ControlSetup
# * \param bRequest see the
# * \ref ControlSetup::bRequest "bRequest" field of
# * \ref ControlSetup
# * \param wValue see the
# * \ref ControlSetup::wValue "wValue" field of
# * \ref ControlSetup
# * \param wIndex see the
# * \ref ControlSetup::wIndex "wIndex" field of
# * \ref ControlSetup
# * \param wLength see the
# * \ref ControlSetup::wLength "wLength" field of
# * \ref ControlSetup
# */
#static inline void libusb_fill_control_setup(unsigned char *buffer,
#    uint8 bmRequestType, uint8 bRequest, uint16 wValue, uint16 wIndex,
#    uint16 wLength)
    sub libusb_fill_control_setup(CArray[uint8]                $buffer # unsigned char*
                                 ,uint8                       $bmRequestType # Typedef<uint8>->|unsigned char|
                                 ,uint8                       $bRequest # Typedef<uint8>->|unsigned char|
                                 ,uint16                      $wValue # Typedef<uint16>->|short unsigned int|
                                 ,uint16                      $wIndex # Typedef<uint16>->|short unsigned int|
                                 ,uint16                      $wLength # Typedef<uint16>->|short unsigned int|
                                  ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1085
#struct Transfer * LIBUSB_CALL libusb_alloc_transfer(int iso_packets);
    sub libusb_alloc_transfer(int32 $iso_packets # int
                              ) is native(LIB) returns Transfer { * }

#-From /usr/include/libusb-1.0/libusb.h:1086
#int LIBUSB_CALL libusb_submit_transfer(struct Transfer *transfer);
    sub libusb_submit_transfer(Transfer $transfer # Transfer*
                               ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1087
#int LIBUSB_CALL libusb_cancel_transfer(struct Transfer *transfer);
    sub libusb_cancel_transfer(Transfer $transfer # Transfer*
                               ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1088
#void LIBUSB_CALL libusb_free_transfer(struct Transfer *transfer);
    sub libusb_free_transfer(Transfer $transfer # Transfer*
                             ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1120
#/** \ingroup asyncio
# * Helper function to populate the required \ref Transfer fields
# * for a control transfer.
# *
# * If you pass a transfer buffer to this function, the first 8 bytes will
# * be interpreted as a control setup packet, and the wLength field will be
# * used to automatically populate the \ref Transfer::length "length"
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
#    struct Transfer *transfer, DeviceHandle *dev_handle,
#    unsigned char *buffer, Transfer_cb_fn callback, void *user_data,
#    unsigned int timeout)
    sub libusb_fill_control_transfer(Transfer               $transfer # Transfer*
                                    ,DeviceHandle          $dev_handle # Typedef<DeviceHandle>->|DeviceHandle|*
                                    ,CArray[uint8]                $buffer # unsigned char*
                                    ,&callback (Transfer) # Typedef<Transfer_cb_fn>->|F:void ( Transfer*)*|
                                    ,Pointer                       $user_data # void*
                                    ,uint32                        $timeout # unsigned int
                                     ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1151
#/** \ingroup asyncio
# * Helper function to populate the required \ref Transfer fields
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
#static inline void libusb_fill_bulk_transfer(struct Transfer *transfer,
#    DeviceHandle *dev_handle, unsigned char endpoint,
#    unsigned char *buffer, int length, Transfer_cb_fn callback,
#    void *user_data, unsigned int timeout)
    sub libusb_fill_bulk_transfer(Transfer               $transfer # Transfer*
                                 ,DeviceHandle          $dev_handle # Typedef<DeviceHandle>->|DeviceHandle|*
                                 ,uint8                         $endpoint # unsigned char
                                 ,CArray[uint8]                $buffer # unsigned char*
                                 ,int32                         $length # int
                                 ,&callback (Transfer) # Typedef<Transfer_cb_fn>->|F:void ( Transfer*)*|
                                 ,Pointer                       $user_data # void*
                                 ,uint32                        $timeout # unsigned int
                                  ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1179
#/** \ingroup asyncio
# * Helper function to populate the required \ref Transfer fields
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
#    struct Transfer *transfer, DeviceHandle *dev_handle,
#    unsigned char endpoint, unsigned char *buffer, int length,
#    Transfer_cb_fn callback, void *user_data, unsigned int timeout)
    sub libusb_fill_interrupt_transfer(Transfer               $transfer # Transfer*
                                      ,DeviceHandle          $dev_handle # Typedef<DeviceHandle>->|DeviceHandle|*
                                      ,uint8                         $endpoint # unsigned char
                                      ,Pointer[uint8]                $buffer # unsigned char*
                                      ,int32                         $length # int
                                      ,&callback (Transfer) # Typedef<Transfer_cb_fn>->|F:void ( Transfer*)*|
                                      ,Pointer                       $user_data # void*
                                      ,uint32                        $timeout # unsigned int
                                       ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1208
#/** \ingroup asyncio
# * Helper function to populate the required \ref Transfer fields
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
#static inline void libusb_fill_iso_transfer(struct Transfer *transfer,
#    DeviceHandle *dev_handle, unsigned char endpoint,
#    unsigned char *buffer, int length, int num_iso_packets,
#    Transfer_cb_fn callback, void *user_data, unsigned int timeout)
    sub libusb_fill_iso_transfer(Transfer               $transfer # Transfer*
                                ,DeviceHandle          $dev_handle # Typedef<DeviceHandle>->|DeviceHandle|*
                                ,uint8                         $endpoint # unsigned char
                                ,Pointer[uint8]                $buffer # unsigned char*
                                ,int32                         $length # int
                                ,int32                         $num_iso_packets # int
                                ,&callback (Transfer) # Typedef<Transfer_cb_fn>->|F:void ( Transfer*)*|
                                ,Pointer                       $user_data # void*
                                ,uint32                        $timeout # unsigned int
                                 ) is native(LIB)  { * }

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
#    struct Transfer *transfer, unsigned int length)
    sub libusb_set_iso_packet_lengths(Transfer               $transfer # Transfer*
                                     ,uint32                        $length # unsigned int
                                      ) is native(LIB)  { * }

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
#    struct Transfer *transfer, unsigned int packet)
    sub libusb_get_iso_packet_buffer(Transfer               $transfer # Transfer*
                                    ,uint32                        $packet # unsigned int
                                     ) is native(LIB) returns Pointer[uint8] { * }

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
#    struct Transfer *transfer, unsigned int packet)
    sub libusb_get_iso_packet_buffer_simple(Transfer               $transfer # Transfer*
                                           ,uint32                        $packet # unsigned int
                                            ) is native(LIB) returns Pointer[uint8] { * }

#-From /usr/include/libusb-1.0/libusb.h:1374
#int LIBUSB_CALL libusb_try_lock_events(Context *ctx);
    sub libusb_try_lock_events(Context $ctx # Typedef<Context>->|Context|*
                               ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1375
#void LIBUSB_CALL libusb_lock_events(Context *ctx);
    sub libusb_lock_events(Context $ctx # Typedef<Context>->|Context|*
                           ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1376
#void LIBUSB_CALL libusb_unlock_events(Context *ctx);
    sub libusb_unlock_events(Context $ctx # Typedef<Context>->|Context|*
                             ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1377
#int LIBUSB_CALL libusb_event_handling_ok(Context *ctx);
    sub libusb_event_handling_ok(Context $ctx # Typedef<Context>->|Context|*
                                 ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1378
#int LIBUSB_CALL libusb_event_handler_active(Context *ctx);
    sub libusb_event_handler_active(Context $ctx # Typedef<Context>->|Context|*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1379
#void LIBUSB_CALL libusb_lock_event_waiters(Context *ctx);
    sub libusb_lock_event_waiters(Context $ctx # Typedef<Context>->|Context|*
                                  ) is native(LIB)  { * }

#-From /usr/include/libusb-1.0/libusb.h:1380
#void LIBUSB_CALL libusb_unlock_event_waiters(Context *ctx);
    sub libusb_unlock_event_waiters(Context $ctx # Typedef<Context>->|Context|*
                                    ) is native(LIB)  { * }

    class Timeval is repr('CStruct') {
        has uint64  $.tv-sec;
        has uint64  $.tv-usec;
    }
#-From /usr/include/libusb-1.0/libusb.h:1381
#int LIBUSB_CALL libusb_wait_for_event(Context *ctx, struct Timeval *tv);
    sub libusb_wait_for_event(Context                $ctx # Typedef<Context>->|Context|*
                             ,Timeval                       $tv # Timeval*
                              ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1384
#int LIBUSB_CALL libusb_handle_events_timeout(Context *ctx,
#    struct Timeval *tv);
    sub libusb_handle_events_timeout(Context                $ctx # Typedef<Context>->|Context|*
                                    ,Timeval                       $tv # Timeval*
                                     ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1386
#int LIBUSB_CALL libusb_handle_events_timeout_completed(Context *ctx,
#    struct Timeval *tv, int *completed);
    sub libusb_handle_events_timeout_completed(Context                $ctx # Typedef<Context>->|Context|*
                                              ,Timeval                       $tv # Timeval*
                                              ,Pointer[int32]                $completed # int*
                                               ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1387
#int LIBUSB_CALL libusb_handle_events(Context *ctx);
    sub libusb_handle_events(Context $ctx # Typedef<Context>->|Context|*
                             ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1388
#int LIBUSB_CALL libusb_handle_events_completed(Context *ctx, int *completed);
    sub libusb_handle_events_completed(Context                $ctx # Typedef<Context>->|Context|*
                                      ,Pointer[int32]                $completed # int*
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1390
#int LIBUSB_CALL libusb_handle_events_locked(Context *ctx,
#    struct Timeval *tv);
    sub libusb_handle_events_locked(Context                $ctx # Typedef<Context>->|Context|*
                                   ,Timeval                       $tv # Timeval*
                                    ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1391
#int LIBUSB_CALL PollFDs_handle_timeouts(Context *ctx);
    sub PollFDs_handle_timeouts(Context $ctx # Typedef<Context>->|Context|*
                                       ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1393
#int LIBUSB_CALL libusb_get_next_timeout(Context *ctx,
#    struct Timeval *tv);
    sub libusb_get_next_timeout(Context                $ctx # Typedef<Context>->|Context|*
                               ,Timeval                       $tv # Timeval*
                                ) is native(LIB) returns int32 { * }

#-From /usr/include/libusb-1.0/libusb.h:1434
#const struct PollFD ** LIBUSB_CALL libusb_get_pollfds(
#    Context *ctx);
    sub libusb_get_pollfds(Context $ctx # Typedef<Context>->|Context|*
                           ) is native(LIB) returns Pointer[PollFD] { * }

#-From /usr/include/libusb-1.0/libusb.h:1437
#void LIBUSB_CALL libusb_set_pollfd_notifiers(Context *ctx,
#    PollFD_added_cb added_cb, PollFD_removed_cb removed_cb,
#    void *user_data);
    sub libusb_set_pollfd_notifiers(Context                $ctx # Typedef<Context>->|Context|*
                                   ,&added_cb (int32, int16, Pointer) # Typedef<PollFD_added_cb>->|F:void ( int, short int, void*)*|
                                   ,&removed_cb (int32, Pointer) # Typedef<PollFD_removed_cb>->|F:void ( int, void*)*|
                                   ,Pointer                       $user_data # void*
                                    ) is native(LIB)  { * }

## Externs

}

# vim: expandtab shiftwidth=4 ft=perl6
