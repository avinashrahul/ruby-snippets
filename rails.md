Algorithms Neatly Explained:

http://cs.usfca.edu/~galles/visualization/flash.html

Ruby:

[2, 1, 5, 4].sort => Ruby by default uses Quick Sort Algorithm for Sorting.

Rails:

namespace :admin do
	resources :articles
end

gives - /admin/articles => Admin::ArticlesController, (namespaces admin infront of routes)

1. if we wait to redirect just /articles to Admin::ArticlesController

scope module: 'admin' do
	resources :articles
end

2. If we want to redirect /admin/articles to just Articles Controller(without the Admin Module prefix)

	scope '/admin' do
		resources :articles
	end

3. Route Constraints

	get 'photos/:id', to: 'photos#show', constraints: {id: /[A-Z]\d/}

4. Redirect /photos to /pictures

	get '/photos', to: redirect('/pictures')

5. root 'pages#index'

# Polymorphic Association?

# Rails SQL Injection Attack, Strong Params
