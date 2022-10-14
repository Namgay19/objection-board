module Api
  module V1
    class ConfirmationsController < Devise::ConfirmationsController
      def show
        self.resource = resource_class.confirm_by_token(params[:confirmation_token])

        if resource.errors.empty?
          redirect_to root_url
        else
          render :new
        end
      end
    end
  end
end
