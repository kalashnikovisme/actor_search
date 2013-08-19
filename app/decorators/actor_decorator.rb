class ActorDecorator < Draper::Decorator
  delegate_all

  def email
    model.user.email
  end

  def phone
    model.user.phone
  end

  def photos
    model.user.photos
  end

  def first_photo_big_thumb
    if model.user.photos.any?
      model.user.photos.first.file.big_thumb
    end
  end

  def full_name
    "#{model.user.first_name} #{model.user.middle_name}"
  end
end
