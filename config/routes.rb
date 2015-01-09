Menyou::Application.routes.draw do

	resources :categories
	resources :chefs
	resources :comments do
		member do
			get :read
			get :unread
		end
	end
	resources :items
	resources :photos
	resources :sessions

	root to: 'pages#home'

	# Pages
	match '/about' => 'pages#about', as: :about
	match '/menu' => 'pages#menu', as: :menu
	match '/test' => 'pages#test', as: :test
	match '/test-upload' => 'pages#test_upload', as: :test_upload

	# Photos
	match '/gallery' => 'photos#gallery', as: :gallery
	match '/upload' => 'photos#upload', as: :upload
	match '/upload-photo' => 'photos#upload_photo', as: :upload_photo

	# Sessions
	match '/sign-in' => 'sessions#new', as: :signin
	match '/sign-out' => 'sessions#destroy', as: :signout
end