require 'test_helper'

class ProjectFormsControllerTest < ActionController::TestCase
  setup do
    @project_form = project_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_form" do
    assert_difference('ProjectForm.count') do
      post :create, project_form: { author: @project_form.author, current_stage: @project_form.current_stage, employee: @project_form.employee, event: @project_form.event, event_date: @project_form.event_date, event_name: @project_form.event_name, leader: @project_form.leader, project_concept: @project_form.project_concept, project_title: @project_form.project_title, security_type: @project_form.security_type }
    end

    assert_redirected_to project_form_path(assigns(:project_form))
  end

  test "should show project_form" do
    get :show, id: @project_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_form
    assert_response :success
  end

  test "should update project_form" do
    patch :update, id: @project_form, project_form: { author: @project_form.author, current_stage: @project_form.current_stage, employee: @project_form.employee, event: @project_form.event, event_date: @project_form.event_date, event_name: @project_form.event_name, leader: @project_form.leader, project_concept: @project_form.project_concept, project_title: @project_form.project_title, security_type: @project_form.security_type }
    assert_redirected_to project_form_path(assigns(:project_form))
  end

  test "should destroy project_form" do
    assert_difference('ProjectForm.count', -1) do
      delete :destroy, id: @project_form
    end

    assert_redirected_to project_forms_path
  end
end
