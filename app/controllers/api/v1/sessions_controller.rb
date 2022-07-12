module Api
  module V1
    # Sessions Controller to handle authentication
    class SessionsController < Devise::SessionsController
      include CacheCrispies::Controller

      private

      def respond_with(resource, _opts = {})
        cache_render UserSerializer, resource
      end
    end
  end
end
