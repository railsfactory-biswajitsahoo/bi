class ProjectController < ApplicationController

def new
 @project = Project.new
 @project.task.build
end

def create
  @project = Project.new(params[:project])
  if @project.save
    flash[:notice] = "Successfully created project and tasks."
    redirect_to projects_path
  else
    render :action => 'new'
  end
end

def edit
  @project = Project.find(params[:id])
end

def update
  params[:project][:existing_task_attributes] ||= {}
  @project = Project.find(params[:id])
  if @project.update_attributes(params[:project])
    flash[:notice] = "Successfully updated project and tasks."
    redirect_to project_path(@project)
  else
    render :action => 'edit'
  end
end


end
