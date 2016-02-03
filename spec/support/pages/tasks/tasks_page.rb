class TasksPage < AbstractPage
  include PageObject
  include TaskModal

  page_url "https://app.futuresimple.com/tasks"

  button(:add_new_task, :css => ".new-task")
  unordered_list(:tasks_list, :css => "section#main .tasks-list")
  span(:tasks_count, :css => "#tasks-count")
  text_field(:list_search, :css => '.input-medium')

  def tasks
    tasks = []
    tasks_list_element.when_visible(10).list_item_elements.each do
      |item| task = {}
      task[:content] = item.h3_element.text
      task[:related] = item.link_element(:css => ".related-object").when_visible(5).text if item.link_element(:css => ".related-object").exists?
      task[:due_date] = item.div_element(:css => "input.date > div#inner-editor").text if item.div_element(:css => "input.date > div#inner-editor").visible?
      tasks << task
    end
    tasks
  end

  def get_task(content)
    tasks_list_element.when_visible(10).list_item_elements.find { |item| item.h3_element.text == content }
  end

  def edit_task(content)
    self.h3_element(:text => content).hover
    self.h3_element(:text => content).link_element(:css => ".inline-edit").when_visible.click
  end
end
