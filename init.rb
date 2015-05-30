Redmine::Plugin.register :sondages do
  name 'Sondages plugin'
  author 'Dimitri Dallongeville'
  description 'Plugin pour effectuer des sondages'
  version '0.0.1'
  menu :project_menu, :sondages, { :controller => 'sondages', :action => 'index' }, :caption => 'Sondages', :after => :activity
  project_module :sondages do
    permission :view_sondages, :sondages => :index
    permission :vote_sondages, :sondages => :vote
    permission :new_sondages, :sondages => :new
    permission :create_sondages, :sondages => :create
    permission :editer_sondages, :sondages => :editer
    permission :update_sondages, :sondages => :update
    permission :supprimer_sondages, :sondages => :supprimer
  end
end
