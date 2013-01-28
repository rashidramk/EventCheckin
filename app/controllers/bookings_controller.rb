class BookingsController < ApplicationController
  # GET /bookings
  # GET /bookings.json
  protect_from_forgery :except => [:create,:find_booking_data]
  def index
    restaurant = Restaurant.find_by_id(params[:restaurant_id])
    @bookings = restaurant.bookings
   render :json=> @bookings

  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    debugger
    @booking = Booking.new(params[:booking])
    @booking.table_id= params[:table_id]
    @booking.restaurant_id = params[:restaurant_id]
    @booking.guests = params[:guests]
    @booking.user_id = current_user.id if current_user
    time = params[:b_time]
    hour= time.split(":")[0]
    min= time.split(":")[1]
    date1 = params[:date]
    year= date1.split("/")[2]
    month = date1.split("/")[1]
    day = date1.split("/")[0]
    date_time= Time.utc(year,month,day,hour,min)
    @booking.start_time = date_time
    @booking.end_time = date_time+2.hours
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :ok }
    end
  end
  def make_booking
    @restaurants = Restaurant.all
  end
  def find_booking_data
    #debugger
    guests= params[:guests]
    date = params[:date]
    restaurant_id = params[:restaurant_id]
    time = params[:time]
    restaurant = Restaurant.find_by_id(restaurant_id)
    @tables = restaurant.tables.where("max_covers> ?",guests)
    render :json =>@tables
  end
  def checkin
    @restaurants = Restaurant.all

  end
end
