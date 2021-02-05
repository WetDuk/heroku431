Rails.application.routes.draw do
root 'collection#index'  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get 'collection/index'

resources :collections do
    member do
        get :delete
    end
end
# collection do
# get :{insert name}
# end                        

end
