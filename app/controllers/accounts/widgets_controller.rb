# frozen_string_literal: true

module Accounts
  class WidgetsController < Accounts::BaseController
    before_action :find_widget, only: %i[edit update show destroy]

    def index
      @widgets = Widget.all
    end

    def new
      @widget = Widget.new
    end

    def create
      @widget = Widget.new(params[:widget_params])
      if @widget.save
        flash[:notice] = 'Widget was successfully created.'
        redirect_to(@widget)
      else
        render action: 'new'
      end
    end

    def show; end

    def edit; end

    def update
      if @widget.update(widget_params)
        flash[:notice] = 'Successfully updated widget.'
        redirect_to @widget
      else
        flash[:alert] = 'Error updating widget.'
        render :edit
      end
    end

    def destroy
      if @widget.destroy
        flash[:notice] = 'Successfully deleted widget.'
        redirect_to widget_path
      else
        flash[:alert] = 'Error deleting widget'
      end
    end

    private

    def widget_params
      params.require(:widget).permit(:name)
    end

    def find_widget
      @widget = Widget.find(params[:id])
    end
  end
end
