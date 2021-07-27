$:.unshift File.expand_path("./../views", __FILE__)
require 'sinatra'
require 'bundler'
require 'gossip'
Bundler.require

class ApplicationController < Sinatra::Base
  #Affichage de la page index 
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end  
#Afichage du forulaire pour déposer un potin
  get '/gossips/new/' do
    erb :new_gossip
  end
#Sauvegarde d'un potin via le formulaire
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
#affichage d'un potin selon l'id
  get '/gossips/:id' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

