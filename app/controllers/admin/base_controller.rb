class Admin::BaseController < ApplicationController
  before_filter :authenticate_admin!, :set_title, :current_tab

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin)
  end

  def set_title
  end

  def current_tab
  end
end
