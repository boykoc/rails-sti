Rails.application.routes.draw do
  root 'accepted_timesheets#index'
  
  resources :accepted_timesheets
  resources :draft_timesheets
  resources :submitted_timesheets
end
