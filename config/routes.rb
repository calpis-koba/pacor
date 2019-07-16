Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'devise/admins/sessions',
  passwords:     'devise/admins/passwords',
  registrations: 'devise/admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'devise/users/sessions',
  passwords:     'devise/users/passwords',
  registrations: 'devise/users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
