require 'appium_lib'
require 'appium_console'
require 'cucumber'
require 'pry-nav'
require 'rspec'

# Choosing session caps(appium.txt)
caps_path = File.join('./config/android/appium.txt')
caps = Appium.load_appium_txt file: caps_path, verbose: true

# Create a client and use the caps
Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object