class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protected    
  def set_locale
    if params[:locale].blank?
      I18n.locale = :'pt-BR'
    else
      I18n.locale = params[:locale]
    end
  end

end
