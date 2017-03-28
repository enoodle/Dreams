class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  def new
    if Rails.configuration.x.firestarter_settings['spark']
      flash[:alert] = t('sign_up_spark')
      redirect_to :new_user_session
      return
    end

    super
  end

  private
    def check_captcha
      if Rails.application.config.x.firestarter_settings['recaptcha']
        unless verify_recaptcha
          self.resource = resource_class.new sign_up_params
          respond_with_navigational(resource) { render :new }
        end 
      end
    end
end
