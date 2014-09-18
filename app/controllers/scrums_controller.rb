class ScrumsController < ApplicationController
  before_action :load_scrum, only: [:edit, :show, :update]

  def show

  end

  def index
    @scrums = Scrum.all
  end

  def new
    @scrum = Scrum.new
    @scrum.scrum_tasks.build
  end

  def edit
    @scrum.scrum_tasks.build
  end

  def update
    @scrum.update(scrum_params)
    respond_to do |format|

      @errors = @scrum.errors
      if @errors.count > 0
        format.js
      else
        format.js { render js: %(Turbolinks.visit('#{scrum_path(@scrum.id)}')) }
      end
    end
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
    @current_month_scrums = Scrum.for_current_month(Date.today.strftime("%m").to_i)

    tasks = []
    @current_month_scrums.each do |current_month_scrum|
      tasks = tasks + current_month_scrum.scrum_tasks
    end

    @task_statistic = {}
    @user_statistics = {}
    @daily_user_work = {}
    tasks.each do |task|

      if @task_statistic.has_key?(task.project.name)
        @task_statistic[task.project.name]["count"] = @task_statistic[task.project.name]["count"] + (task.hours_used*60 + task.minutes_used)

        if @task_statistic[task.project.name].has_key?(task.user.email)
          @task_statistic[task.project.name][task.user.email]["planed"] = @task_statistic[task.project.name][task.user.email]["planed"] + task.hours_planned*60 + task.minutes_planned
          @task_statistic[task.project.name][task.user.email]["used"] = @task_statistic[task.project.name][task.user.email]["used"] + task.hours_used*60 + task.minutes_used
        else
          @task_statistic[task.project.name][task.user.email] = {"planed" => task.hours_planned*60 + task.minutes_planned, "used" => task.hours_used*60 + task.minutes_used}
        end
      else
        @task_statistic[task.project.name] = {"count" => (task.hours_used*60 + task.minutes_used), task.user.email => {"planed" => task.hours_planned*60 + task.minutes_planned, "used" => (task.hours_used*60 + task.minutes_used)}}
      end

      if @user_statistics.has_key?(task.user.email)
        @user_statistics[task.user.email]["total_used"] = @user_statistics[task.user.email]["total_used"] + (task.hours_used*60 + task.minutes_used)
        @user_statistics[task.user.email]["total_planed"] = @user_statistics[task.user.email]["total_planed"] + (task.hours_planned*60 + task.minutes_planned)
      else
        @user_statistics[task.user.email] = {"total_used" => (task.hours_used*60 + task.minutes_used), "total_planed" => (task.hours_planned*60 + task.minutes_planned)}
      end

      if @daily_user_work.has_key?(task.scrum.date)
        if @daily_user_work[task.scrum.date].has_key?(task.user.email)
          @daily_user_work[task.scrum.date][task.user.email] = @daily_user_work[task.scrum.date][task.user.email] + (task.hours_used*60 + task.minutes_used)
        else
          @daily_user_work[task.scrum.date][task.user.email] = (task.hours_used*60 + task.minutes_used)
        end
      else
        @daily_user_work[task.scrum.date] = {task.user.email => (task.hours_used*60 + task.minutes_used)}
      end
    end
    puts @daily_user_work.to_yaml
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

    def load_scrum
      @scrum = Scrum.find(params[:id])
    end
end
