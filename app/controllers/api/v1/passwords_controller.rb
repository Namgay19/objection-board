module Api
  module V1
    class PasswordsController < Devise::PasswordsController
      def create
        self.resource = send_instructions
        if successfully_sent?(resource)
          render json: { message: "Password reset link sent." }
        else
          render json: { error: "Failed to send password reset link." }, status: 422
        end
      end

      def update
        updater = PasswordUpdater.new(password_params, resource_class)
        if updater.update
          render json: { message: "Password updated successfully" }
        else
          render json: { error: "Failed to update password" }, status: 422
        end
      end

      private

      def send_instructions
        resource_class.send_reset_password_instructions(resource_params)
      end

      def password_params
        resource_params.permit(
          :reset_password_token,
          :password,
          :password_confirmation
        )
      end
    end
  end
end
