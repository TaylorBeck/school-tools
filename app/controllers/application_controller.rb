class ApplicationController < ActionController::Base
  helper_method :breadcrumbs

  def breadcrumbs
    home_breadcrumb = Breadcrumb.new('Home', root_path)
    @breadcrumbs ||= [home_breadcrumb]
  end

  def add_breadcrumb(name, link = nil)
    breadcrumbs << Breadcrumb.new(name, link)
  end
end
