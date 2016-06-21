module Api
  module Admin
    class OptionsController < ApplicationController
      resource_description do
        resource_id 'Admin::Options'
        short 'Options Admin'
        formats ['json']
        description "This resource allows for the master options i.e., Race, Ethnicity of clinical quality measures in the popHealth application."
      end
      
      before_filter :authenticate_user!
      skip_authorization_check
      skip_before_action :verify_authenticity_token

      api :GET, "/options/race", "Get all race in the database"
      formats ['json']
      def get_races
        json = {}
        races = Race.all
        races.each do | race |
          race.codes.each do | code |
              json[code] = race.name
          end
        end
        render :json => json
      end


      api :GET, "/options/ethnicity", "Get all ethnicity in the database"
      formats ['json']
      def get_ethnicities
        json = {}
        ethnicities = Ethnicity.all
        ethnicities.each do | ethnicity |
          ethnicity.codes.each do | code |
              json[code] = ethnicity.name
          end
        end
        render :json => json
      end

    end
  end
end
