# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# get 'sondages', :to => 'sondages#index'
get 'projects/:id/sondages/', to: 'sondages#index', as: :sondages
post 'projects/:id/sondages/:id_sondage/:reponse', :to => 'sondages#vote', as: :sondages_vote
get 'projects/:id/sondages/new', to: 'sondages#new', as: :sondages_new
post 'project/:id/sondages/create/', :to => 'sondages#create', as: :sondages_create
post 'projects/:id/sondages/:id_sondage', :to => 'sondages#supprimer', as: :sondages_supprimer
get 'projects/:id/sondages/editer/:id_sondage', :to => 'sondages#editer', as: :sondages_editer
patch 'projects/:id/sondages/:id_sondage/update', :to => 'sondages#update', as: :sondages_update
