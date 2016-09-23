module Authorities
class AgentController < ApplicationController

  def new
    authorize! :create, ::Agent
    @agent ||= Agent.new
  end

  def index
    redirect_to "/"
  end

  def show
    @agent = Agent.find(params[:id])
  end

  def edit
    authorize! :create, ::Agent
    @agent = Agent.find(params[:id])
  end

  def create
    authorize! :create, ::Agent

    lbl = params[:agent][:label][0]
    @agent = lookup Agent, lbl
    if !@agent.nil?
      flash[:error] = "Record with label '#{lbl}' exists."
      redirect_to new_authorities_agent_path, agent: params[:agent]
      return
    else
      @agent = Agent.new(JSON.parse(params[:agent].to_json));

      if @agent.save

        flash[:success] = "Record created!"
        redirect_to authorities_agent_path (@agent)
      else
        flash[:error] = "<b>Wait don't go!</b> There was a problem with your submission. Please review the errors below:"
        render new_authorities_agent_path @agent
      end
    end
  end

  def update
    authorize! :create, ::Agent

    lbl = params[:agent][:label][0]
    id = params[:agent][:id]
    @agent = lookup Agent, lbl
    if !@agent.nil? && @agent.id != id
      flash[:error] = "Record with label '#{lbl}' already exists!"
      redirect_to edit_authorities_agent_path @agent.id
      return
    end

    if @agent.nil?
      @agent = Agent.find id
        if @agent.nil?
        flash[:error] = "Record with id '#{id}' doesn't exists!"
        redirect_to new_authorities_agent_path agent: params[:agent]
        return
      end
    end

    obj = params[:agent].reject {|k, v| k=="id"}
    if @agent.update_attributes (JSON.parse(obj.to_json))
      flash[:success] = "Record updated successfully!"
      redirect_to authorities_agent_path @agent.id
    else
      flash[:error] = "<b>Wait don't go!</b> There was a problem with your submission. Please review the errors below:"
      render "edit"
    end
  end

  private

    def lookup (clazz, value)
      clazz.where(label: value).first
    end
end
end
