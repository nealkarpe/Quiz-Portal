Rails.application.routes.draw do
  
  root 'quizzes#index'
  
  resources :quizzes do
  	resources :questions
  	resources :attempts
  end
  
  devise_for :users
  
  post '/quizzes/:quiz_id/questions/next' => 'questions#next'
  #devise_for :users, controllers: { registrations: 'users/registrations' }
end
