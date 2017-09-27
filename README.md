# Device-USB

Perl 6 access to USB busses and devices

## Synopsis

```perl6


use Device::USB;

my $usb = Device::USB.new;

for $usb.device-list -> $dev {
    my $dd = $dev.device-descriptor;
    say sprintf "%04x:%04x (bus %d, device %d)", $dd.idVendor, $dd.idProduct, $dev.bus-number, $dev.address;
}

```
