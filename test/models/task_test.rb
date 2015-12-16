require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "set default completed=false" do
    task = Task.create(title: 'foo')
    task.reload
    assert task.completed == false
  end

  test "validates title" do
    task = Task.new
    assert_not task.save
  end

  test "index default order is created_by DESC" do
    5.times { Task.create(title: 'foo') }
    assert (Task.first.created_at > Task.last.created_at)
  end

end
