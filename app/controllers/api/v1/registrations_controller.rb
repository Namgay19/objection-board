# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      include CacheCrispies::Controller

      before_action :configure_permitted_parameters, if: :devise_controller?

      def create
        build_resource(sign_up_params)
        resource.save!
        respond_with resource
      end

      private

      def respond_with(resource, _opts = {})
        cache_render UserSerializer, resource
      end

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :phone, :mobile, :role_id, :hashed_pin])
      end
    end
  end
end
