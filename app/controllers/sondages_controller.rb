# -*- coding: utf-8 -*-
class SondagesController < ApplicationController
  unloadable
  before_filter :find_project, :authorize
  def index
    @sondages = Sondage.where(id_project: @project[:id])
  end
  
  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:id])
  end
  
  def vote
    sondage = Sondage.find(params[:id_sondage])
    sondage_uniques = SondageUnique.vote_effectuer(params[:id_sondage])
    if sondage_uniques == 0
      SondageUnique.creer_vote(params[:id_sondage])
      sondage.vote(params[:reponse])
      if sondage.save
        flash[:notice] = 'Vote enregistré.'
      end
    else
      flash[:notice] = 'Vous avez déja voté.'
    end
    redirect_to :back
  end
  
  def new
    @sondages = Sondage.new
  end
  
  def create
    sondages = Sondage.new(params[:sondage])
    sondage = Sondage.new_sondage(sondages, params[:id])
    if sondage.save
      flash[:notice] = 'Question enregistré avec succès'
    else
      flash[:notice] = 'Votre question n''a pas été enregistré'
    end
    #redirect_to :back
    redirect_to :action => 'index'
  end
  
  def supprimer
    Sondage.destroy(params[:id_sondage])
    SondageUnique.where(:id_quest => params[:id_sondage]).destroy_all
    redirect_to :action => 'index'
  end

  def editer
    @sondages = Sondage.find(params[:id_sondage])
  end

  def update
    @sondages = Sondage.find(params[:id_sondage])
    if @sondages.update_attributes(params[:sondage])
      flash[:success] = "Question actualisé."
      redirect_to :action => 'index'
    end
  end
end
