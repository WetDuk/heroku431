Rails.application.routes.draw do
root 'collections#index'  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get 'collections/index'

resources :collections do
    member do
        get :delete
    end
end
# collection do
# get :{insert name}
# end                        

end
