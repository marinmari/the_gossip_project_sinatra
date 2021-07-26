$:.unshift File.expand_path("./../views", __FILE__)
require 'sinatra'
require 'bundler'
require 'csv'
Bundler.require

class Gossip 
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    gossips = Array.new #on créer une variable qui va enregistrer le potin à afficher sur la page
    CSV.read("./db/gossip.csv").each_with_index do |row, index| # FOnction index qui permet de ressortir uniquement la ligne avec l'index souhaité ()
      if (id == index+1) 
        gossips << Gossip.new(row[0], row[1])    # si trouvé, ajout dans array et break pour retourner l'array
        break
        end
      end
        return gossips
    end

end
