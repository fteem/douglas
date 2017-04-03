module Douglas
  module Rails
    # Extensions to rails controllers. Provides convenient ways to pass certain
    # information to the model layer via `the_stamper`.
    module Controller
      protected

      # Returns the user who is responsible for any changes that occur.
      # By default this calls `current_user` and returns the result.
      #
      # Override this method in your controller to call a different
      # method, e.g. `current_person`, or anything you like.
      def user_for_douglas
        return unless defined?(current_user)
        ActiveSupport::VERSION::MAJOR >= 4 ? current_user.try!(:id) : current_user.try(:id)
      rescue NoMethodError
        current_user
      end

      private

      # Tells Douglas who is responsible for any changes that occur
      def set_douglas_the_stamper
        ::Douglas.the_stamper = user_for_douglas
      end
    end
  end
end

if defined?(::ActionController)
  ::ActiveSupport.on_load(:action_controller) do
    include ::Douglas::Rails::Controller
  end
end
