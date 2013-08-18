class ActorDecorator < Draper::Decorator
  delegate_all
  def first_photo_big_thumb
  end
  def full_name
  end
end
