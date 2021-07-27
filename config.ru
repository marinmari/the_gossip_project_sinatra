require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
#Lancement de l'app
run ApplicationController