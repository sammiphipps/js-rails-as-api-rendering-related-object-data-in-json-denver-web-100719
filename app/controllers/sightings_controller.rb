class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(id: params[:id])
        # render json: sighting
        # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
        if sighting
            render json: sighting, include: [:bird, :location], except: [:created_at, :updated_at, :bird_id, :location_id]
        else 
            render json: {message: 'No sighting found with that id.'}
        end 
    end 
end
