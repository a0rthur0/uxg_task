require 'spec_helper'

def get_created_task_from_list content
  on(TasksPage).task_modal_element.when_not_visible
  on(NavigationPage).tasks
  on(TasksPage).get_task content
end

shared_examples "Create a task and check it" do
  it "creates a task" do
    on(TasksPage).add_new_task_element.when_visible.click
    on(TasksPage).task_content_element.when_visible(10).value = @task_content
    on(TasksPage).uncheck_due_date_toggle if remove_date
    on(TasksPage).create_task
  end

  it "checks the task on the list" do
    created_task = get_created_task_from_list(@task_content)
    expect(created_task).not_to be_nil
  end
end

describe "Tasks" do
  before(:all) do
    login_to_autotest
    visit(TasksPage)
  end

  context "Add task without date" do
    before(:all) { @task_content = Faker::Lorem.sentence}
    let(:remove_date) { true }

    include_examples "Create a task and check it"
  end

  #add your test here

end
