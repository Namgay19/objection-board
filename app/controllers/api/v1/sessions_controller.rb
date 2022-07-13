module Api
  module V1
    # Sessions Controller to handle authentication
    class SessionsController < Devise::SessionsController
      include CacheCrispies::Controller

      def create
        if params["user"]["via_pin"]
          user = User.find_by(hashed_pin: params["user"]["pin"])
          if user
            jti = SecureRandom.uuid
            user.update_column(:jti, jti)
            payload = { "jti" => jti, "sub": user.id, "scp" => "user", "aud" => nil }
            token = Warden::JWTAuth::TokenEncoder.new.call(payload)
            response.headers["Authorization"] = token

            respond_with(user)
          else
            render json: { error: 'Pin does not match any user' }, status: 401
          end
        else
          super
        end
      end

      private

      def respond_with(resource, _opts = {})
        cache_render UserSerializer, resource
      end
    end
  end
end
