get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
end

post '/events/create' do
  current_event = Event.new(organizer_name: params[:organizer_name],
  	organizer_email: params[:organizer_email], title: params[:title],
  	date: params[:date])
  if current_event.save
    redirect '/'
  else
  	@error_message = current_event.errors.messages
  	@name = params[:organizer_name]
  	@email = params[:organizer_email]
  	@title = params[:title]
  	@date = params[:date]
  	erb :new_event
  end
end

# get /dosometing 
# redirect '/events?msg="hello"'
# end
