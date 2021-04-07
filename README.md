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

## Description

## Installation

This isn't released to the ecosystem, but as long as you have a working Rakudo installation you should be able to install this with *zef* :

    zef install https://github.com/jonathanstowe/Device-USB.git


## Support


## License

This is free software, please see the [LICENCE](LICENCE) in the distribution.

© Jonathan Stowe 2019 - 
