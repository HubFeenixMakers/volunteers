# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :authenticate_scope!, only: [:edit_email]

  def new
    build_resource
    super
  end

  def create
    if message = math_check
      puts message
      flash.now.alert = message
      build_resource(sign_up_params)
      render :new
    else
      super
    end
  end

  def edit_email
    build_resource
    puts "EDIT"
  end

  def edit
    build_resource
    super
  end

  def update
    puts "UPDATE"
    super
  end

  protected

  def math_check
    return "no cheatin" unless bot = params[:bot]
    return "No food" unless fudder = bot[:fudder]
    key = fudder.to_i / 2
    answer = bot[:challenge]
    return "Plase enter the bot challenge" if answer.blank?
    if( (2*key + 1).to_s != answer )
      return "Check the maths, tip, it wasn't #{answer}"
    end
    nil
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    puts "after sign up"
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
