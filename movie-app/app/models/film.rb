class Film < ApplicationRecord
    belongs_to :user    

    require 'httparty'
    require 'pp'
    
    class Omdb
      include HTTParty
      attr_accessor :films
    
      base_uri 'http://www.omdbapi.com/?i=tt3896198&apikey=f4baa3f2'
      default_params output: :json
    
      def initialize(films)
        @films = films
      end
    
      def random_film
        @films.sample["details"]
      end
      
      # Class Methods
      def self.fetch(page, per_page)
        response = get('/films.json', query: { page: page, per_page: per_page })
    
        if response.success?
          puts "success"
          self.new(response["films"])
        else
          puts "failure"
          raise response.response
        end
      end
    end
end
