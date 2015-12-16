require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create" do
    post :create, task: {title: 'hello world'}
    assert_redirected_to tasks_path
  end

  test "should update 'title'" do
    task = Task.create(title: 'hello')
    patch :update, id: task.id, task: {title: 'world'}
    assert_redirected_to tasks_path
    task.reload
    assert task.title == 'world', 'changed in db'
  end

  test "should update 'completed'" do
    task = Task.create(title: 'foo')
    patch :update, id: task.id, task: {completed: true}
    assert_redirected_to tasks_path
    task.reload
    assert task.completed == true, 'changed in db'
  end

  test "should destroy" do
    task = Task.create(title: 'foo')
    delete :destroy, id: task.id
    assert_redirected_to tasks_path
  end

end
