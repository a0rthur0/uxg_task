module TaskModal
  include PageObject

  div(:task_modal, css: ".fs-modal-content")
  text_field(:task_content, id: "content")

  div(:task_due_date, css: "input.date > div#inner-editor")
  text_field(:task_due_time, css: ".time .start_at .ui-timepicker-input")
  checkbox(:due_date_toggle, css: "div.task-time > div > input")

  link(:create_task, text: "Create")
  link(:update_task, text: "Update")
  link(:cancel_task, text: "Cancel")
  link(:delete_task, text: "Delete Task")

  def change_task_owner owner
    self.div_element(css: ".chzn-container").span_element.click
    self.div_element(css: ".chzn-search").text_field_element.send_keys owner
    self.div_element(css: ".chzn-drop").list_item_elements[0].when_visible(5).text.include? owner
    self.div_element(css: ".chzn-search").text_field_element.send_keys :enter
    self.link_element(text: "#{owner}").when_visible(5).visible?
  end

  def close_modal
    self.cancel_task
    wait_until(3) do
      !self.task_modal_element.visible?
    end
  end
end
