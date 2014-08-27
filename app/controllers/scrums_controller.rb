class ScrumsController < ApplicationController

  def index
    @scrums = Scrum.all
  end

  def new
    @scrum = Scrum.new
    @scrum.scrum_tasks.build
  end

  def create
    @scrum = Scrum.new(scrum_params)
    @scrum.save
    respond_to do |format|

      @errors = @scrum.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{root_path}')) }
      end
    end
  end

  def last
    @scrum = Scrum.last
    render :show
  end

  def edit_task
    @scrum_task = ScrumTask.find(params[:id])
  end

  def update_task
    @scrum_task = ScrumTask.find(scrum_task_params[:id])
    @scrum_task.update(scrum_task_params)

    respond_to do |format|

      @errors = @scrum_task.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{last_scrums_path}')) }
      end
    end
  end

  private
    def scrum_params
      params.require(:scrum).permit!  #this will permit all post parameters!
    end

    def scrum_task_params
      params.require(:scrum_task).permit!
    end

end
