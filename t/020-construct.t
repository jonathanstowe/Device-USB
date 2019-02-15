#!perl6

use v6;

use Test;

use Device::USB;

my $dev-usb;

lives-ok { $dev-usb = Device::USB.new }, "create a new Device::USB";
diag "Testing with libusb { $dev-usb.version }";
lives-ok { $dev-usb.dispose }, "dispose that";

done-testing();

# vim: ft=perl6 sw=4
