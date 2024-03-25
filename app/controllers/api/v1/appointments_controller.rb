module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :user_authorized?
      
      # Display  the list of available appointments
      def index
        # if user_authorized?
          appointments = Appointment.order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Appointments loaded list successfullly', data: appointments }, status: :ok
        # else
        #   render json: { error: 'Invalid API token! Appointments cannot be shown.' }, status: :unprocessable_entity
        # end
      end

      # Create an appointment
      def create
        # if user_authorized?
          appointment = current_user.appointments.build(appointment_params) 
          if appointment_valid?(appointment)
            if appointment.save
              render json: { status: 'SUCCESS', message: 'Appointment save successfullly', data: appointment }, status: :created
            else
              render json: { status: 'ERROR', message: 'Appointment not saved', data: appointment.errors }, status: :unprocessable_entity
            end
          else
            render json: { status: 'ERROR', message: 'Invalid appointment schedule. Overlaps with an existing appointment.' }, status: :unprocessable_entity
          end      
      end

      # Delete an existing appointment
      def destroy
        appointment = Appointment.find(params[:id])
        appointment.destroy
        render json: { status: 'SUCCESS', message: 'Appointment deletd successfullly', data: appointment }, status: :ok
      end
      
      # Update an existing appointment
      def update
        appointment = Appointment.find(params[:id])
        if appointment.update(appointment_params)
          render json: { status: 'SUCCESS', message: 'Appointment updated successfullly', data: appointment }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Appointment not updated', data: appointment.errors }, status: :unprocessable_entity
        end
      end

      private

      def appointment_params
        params.permit(:user_id, :coach_instructor_id, :appointment_start_date, :duration, :location, :coach_name)
      end

      def appointment_valid?(new_appointment)
        coach_id = new_appointment.coach_instructor_id
        proposed_start = new_appointment.appointment_start_date
        proposed_end = proposed_start + new_appointment.duration.minutes
      
        # Fetch existing appointments for the same coach
        overlapping_appointments = Appointment.where(coach_instructor_id: coach_id)
                                             .select { |appointment| 
                                               (appointment.appointment_start_date..(appointment.appointment_start_date + appointment.duration.minutes)).overlaps?(proposed_start..proposed_end)
                                             }
      
        overlapping_appointments.empty?  # Return true if no overlaps found
      end
      

      
    end
  end
end
