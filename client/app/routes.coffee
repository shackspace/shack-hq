module.exports = (match) ->
  match '', 'home#index'
  match 'members', 'member#index'
  match 'members/new', 'member#new'