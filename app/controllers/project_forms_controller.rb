class ProjectFormsController < ApplicationController
  before_action :set_project_form, only: [:show, :edit, :update, :destroy]

  # GET /project_forms
  # GET /project_forms.json
  def index
    @project_forms = ProjectForm.all
  end

  # GET /project_forms/1
  # GET /project_forms/1.json
  def show
  end

  # GET /project_forms/new
  def new
    @project_form = ProjectForm.new
  end

  # GET /project_forms/1/edit
  def edit
  end

  # POST /project_forms
  # POST /project_forms.json
  def create
    @project_form = ProjectForm.new(project_form_params)

    respond_to do |format|
      if @project_form.save
        format.html { redirect_to @project_form, notice: 'Project form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_forms/1
  # PATCH/PUT /project_forms/1.json
  def update
    respond_to do |format|
      if @project_form.update(project_form_params)
        format.html { redirect_to @project_form, notice: 'Project form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_forms/1
  # DELETE /project_forms/1.json
  def destroy
    @project_form.destroy
    respond_to do |format|
      format.html { redirect_to project_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_form
      @project_form = ProjectForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_form_params
      params.require(:project_form).permit(:project_title, :project_concept, :current_stage, :author, :employee, :leader, :event, :event_name, :event_date, :security_type)
    end
end
