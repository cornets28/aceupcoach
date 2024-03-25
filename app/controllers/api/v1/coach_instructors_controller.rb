module Api
  module V1
    class CoachInstructorsController < ApplicationController
      before_action :user_authorized?
      before_action :check_admin_role, only: [:create]

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
        render json: CoachInstructor.all
      end

      private

      def coachesController_params
        params.permit(:full_name, :email, :phone_number, :years_of_experience, :picture,
                      :location)
      end

      def check_admin_role
        render_unauthorized('Only users with the role of admin can add a Coach Instructor.') unless current_user.role == 'admin'
      end
    end
  end
end
