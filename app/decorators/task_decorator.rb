class TaskDecorator < Draper::Decorator
  delegate_all

  # def status_to_s
  #   if object.to_do?
  #     "To Do" 
  #   elsif object.doing?
  #     "Doing"
  #   else object.done?
  #     "Done"
  #   end
  # end
end
