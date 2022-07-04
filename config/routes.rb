Rails.application.routes.draw do
  devise_for :users
  namespace :api,defaults:{format: :json} do
    namespace :v1 do
      devise_scope :user do
        post "sign_up",to: "registrations#create"
        post "sign_in",to: "sessions#create"
        post "add_job",to: "jobs#create"
        post "update_job",to: "jobs#update"
        post "delete_job",to: "jobs#destroy"
        get "show_jobs",to : "jobs#index"
        post "app_job",to: "appjobs#create"
        get "userapp_job",to: "appjobs#show_user"
        post "adminapp_job",to: "appjobs#show_admin"
      end
    end
  end
end

