class CourseOffereingsController < ApplicationController
  before_action :set_course_offereing, only: [:show, :edit, :update, :destroy]

 def filter
    @course_offerings = CourseOffering.by_name(filter_params[:course_name]).by_semester(filter_params[:semester]).by_number(filter_params[:course_number]).by_year(filter_params[:year]).by_start_time(filter_params[:start_time]).by_end_time(filter_params[:end_time])
    render :main

  end

  def main
    @course_offereings = CourseOffereing.all
  end

  # GET /course_offereings
  # GET /course_offereings.json

  def index
    @course_offereings = CourseOffereing.all
  end

  # GET /course_offereings/1
  # GET /course_offereings/1.json

  def show
  end

  # GET /course_offereings/new
  
  def new
    @course_offereing = CourseOffereing.new
    @faculties = Faculty.all
    @courses = Course.all
  end

  # GET /course_offereings/1/edit
  def edit
  end

  # POST /course_offereings
  # POST /course_offereings.json
  def create
    @course_offereing = CourseOffereing.new(course_offereing_params)

    respond_to do |format|
      if @course_offereing.save
        format.html { redirect_to @course_offereing, notice: 'Course offereing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_offereing }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_offereing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_offereings/1
  # PATCH/PUT /course_offereings/1.json
  def update
    respond_to do |format|
      if @course_offereing.update(course_offereing_params)
        format.html { redirect_to @course_offereing, notice: 'Course offereing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_offereing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_offereings/1
  # DELETE /course_offereings/1.json
  def destroy
    @course_offereing.destroy
    respond_to do |format|
      format.html { redirect_to course_offereings_url }
      format.json { head :no_content }
    end
  end


def schedule
@course_offereings = CourseOffereing.all

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_offereing
      @course_offereing = CourseOffereing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_offereing_params
      params.require(:course_offereing).permit(:id, :faculty_id, :course_id, :semester, :year, :start_time, :end_time)
    end
end
