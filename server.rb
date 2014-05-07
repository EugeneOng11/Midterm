require 'sinatra'
require './expense'

expenses = []

get '/' do
	erb :index
end

get '/new' do
	erb :new
end

post '/save' do
	if expenses.any?
		expense_id = expenses.last
		expense_id += 1
   else
		expense_id = 1
	end
	expense = Expense.new(expense_id, :name, :amount)
	expenses << expense
	redirect to '/'
end

get '/show/:id' do
	erb :show
end
