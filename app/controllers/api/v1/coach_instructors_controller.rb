module Api
  module V1
    class CoachInstructorsController < ApplicationController

      # Create a new coach
      def create
        coach = CoachInstructor.new(coachesController_params)
        if coach.save
          render json: { status: 'SUCCESS', message: 'Coach saved successfully', data: coach }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Coach not saved', data: coach.errors },
                 status: :unprocessable_entity
        end
      end

      # List of all the coaches
      def index
        if user_authorized?
          render json: CoachInstructor.all
        else
          render json: { error: 'Invalid API token! Coach cannot be found.' }, status: :unprocessable_entity
        end
      end

      private

      def coachesController_params
        params.permit(:full_name, :email, :phone_number, :years_of_experience, :picture,
                      :location)
      end
    end
  end
end
