class Admin::PagesController < Admin::BaseController 
  layout 'admin'
  load_and_authorize_resource 
  uses_tiny_mce :only => [:new, :create, :edit, :update]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end
  
  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:success] = "Page <b>#{@page.name}</b> successfully created."
      redirect_to(admin_pages_url)
    else
      flash[:error] = "#{@page.errors.count} error prohibited this page from being saved:"
      flash[:error_msgs] = @page.errors.full_messages
      render :action => :new
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:success] = "Page <b>#{@page.name}</b> was successfully updated."
      redirect_to admin_pages_url
    else
      render :action => :edit
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:success] = "Page <b>#{@page.name}</b> successfully deleted."
    redirect_to admin_pages_url
  end

  protected
  def set_title
    @title = "Page"
  end

  def current_tab
    @current_tab = "cms", "cms-pages"
  end

end
