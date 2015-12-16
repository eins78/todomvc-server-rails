# CRUD for "Todo" Resources, as HTML and JSON
class TasksController < ApplicationController
  include TasksHelper

  def index
    represent case filter_mode(params)
              when :active then Task.where(completed: false)
              when :completed then Task.where(completed: true)
              else
                Task.all
              end
  end

  def create
    title = task_params.require(:title)
    Task.create title: title
    redirect_to(tasks_path)
  end

  def update
    props = coerce_bools(task_params)
    task = find_task
    task.update(props)
    redirect_to(tasks_path)
  end

  def destroy
    task = find_task
    task.destroy
    redirect_to(tasks_path)
  end

  private

  def find_task
    id = params.require(:id)
    Task.find(id)
  end

  def task_params
    params.require(:task)
      .permit(:title, :completed)
  end

  def coerce_bools(hash)
    bools = 'completed'
    hash.map { |k, v| [k, (bools.include?(k)) ? v.present? : v] }.to_h
  end

  def represent(resource)
    respond_to do |f|
      f.html { @get = resource } # renders the rails default
      f.json { render json: resource }
      f.yaml { render plain: resource.as_json.to_yaml }
    end
  end
end
