# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

ssid = System.get_env("SSID") || raise "Set the SSID env var!"
psk = System.get_env("PSK") || raise "Set the PSK env var!"

config :hello_wifi, :wlan0,
  ssid: ssid,
  key_mgmt: :"WPA-PSK",
  psk: psk

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
