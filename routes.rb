  get '/' do
    erb :index
  end

  # Route to show all Things, ordered like a blog
  get '/things' do
    content_type :json
    @things = Thing.all(:order => :created_at.desc)

    @things.to_json
  end

  # CREATE: Route to create a new Thing
  post '/things' do
    content_type :json

    # These next commented lines are for if you are using Backbone.js
    # JSON is sent in the body of the http request. We need to parse the body
    # from a string into JSON
    # params_json = JSON.parse(request.body.read)

    # If you are using jQuery's ajax functions, the data goes through in the
    # params.
    @thing = Thing.new(params)

    if @thing.save
      @thing.to_json
    else
      halt 500
    end
  end

  # READ: Route to show a specific Thing based on its `id`
  get '/things/:id' do
    content_type :json
    @thing = Thing.get(params[:id].to_i)

    if @thing
      @thing.to_json
    else
      halt 404
    end
  end

  # UPDATE: Route to update a Thing
  put '/things/:id' do
    content_type :json

    # These next commented lines are for if you are using Backbone.js
    # JSON is sent in the body of the http request. We need to parse the body
    # from a string into JSON
    # params_json = JSON.parse(request.body.read)

    # If you are using jQuery's ajax functions, the data goes through in the
    # params.

    @thing = Thing.get(params[:id].to_i)
    @thing.update(params)

    if @thing.save
      @thing.to_json
    else
      halt 500
    end
  end

  # DELETE: Route to delete a Thing
  delete '/things/:id/delete' do
    content_type :json
    @thing = Thing.get(params[:id].to_i)

    if @thing.destroy
      {:success => "ok"}.to_json
    else
      halt 500
    end
  end
