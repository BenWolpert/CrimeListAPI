module Api
  module V1
    class CrimesController < ApplicationController

      def index
        crimes = Crime.order('created_at DESC');
        render json: crimes, status: :ok
      end

      def show
        crime = Crime.find(params[:id])
        render json: {status: 'SUCCESS', message: "Loaded Crime", data:crime}, status: :ok
      end

      def create
        crime = Crime.new(crime_params)
        if crime.save
        render json: {status: 'SUCCESS', message: "Crime Saved", data:crime}, status: :ok
        else
        render json: {status: 'Error', message: "Crime Not Saved", data:crime.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        crime = Crime.find(params[:id])
        crime.destroy
        render json: {status: 'SUCCESS', message: "Crime Deleted", data:crime}, status: :ok
      end

      def update
        crime = Crime.find(params[:id])
        if crime.update_attributes(crime_params)
          render json: {status: 'SUCCESS', message: "Updated Crime", data:crime}, status: :ok
        else
          render json: {status: 'Error', message: "Crime Not Updated", data:crime.errors}, status: :unprocessable_entity
        end
      end

      private
      def crime_params
        params.permit(:Title, :Latitude, :Longitude, :Description, :CrimeDateTime)
      end

    end
  end
end
