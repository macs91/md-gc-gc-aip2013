class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new

    @room.name = params[:room][:name]

    # retrieve image extension
    extension = params[:room][:photo].original_filename.split('.').last

    # create a tmp file
    id = 0
    images_path = Rails.root.join('app', 'assets', 'images')
    img_name = "room-#{id.to_s}"

    while File.exist?(File.join(images_path, "#{img_name}.#{extension}")) do
      id += 1
      img_name = "room-#{id.to_s}"
    end

    # create a new image
    image = Image.new
    image.name = img_name
    image.extension = extension

    # create association between designer and its image
    @room.image = image

    # save to temp file
    File.open(File.join(images_path, "#{img_name}.#{extension}"), 'wb') do |f|
      f.write params[:room][:photo].read
    end

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])

    @room.name = params[:room][:name]

    # retrieve image extension
    extension = params[:room][:photo].original_filename.split('.').last

    # create a tmp file
    id = 0
    images_path = Rails.root.join('app', 'assets', 'images')
    img_name = "room-#{id.to_s}"

    while File.exist?(File.join(images_path, "#{img_name}.#{extension}")) do
      id += 1
      img_name = "room-#{id.to_s}"
    end

    # create a new image
    image = Image.new
    image.name = img_name
    image.extension = extension

    # create association between designer and its image
    @room.image = image

    # save to temp file
    File.open(File.join(images_path, "#{img_name}.#{extension}"), 'wb') do |f|
      f.write params[:room][:photo].read
    end

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end
end
