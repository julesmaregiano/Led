class Diagnostician::DiagnosticsController < ApplicationController
  def index
    @diagnostics = Diagnostic.all
    @housings = Housing.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def update

  end
end
