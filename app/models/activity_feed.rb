class ActivityFeed < ActiveRecord::Base
  def self.feed(objects)
    info = []
    objects.each do |obj_array|
      format(obj_array).each do |obj|
        info << obj
      end
    end
    info
  end

  def self.format(objects)
    info = []
    objects.each do |object|
      id = object.id
      type = object.class.to_s
      creator = object.user.name
      time = object.updated_at
      action = 'added'
      
      if object.updated_at > object.created_at
        action = 'updated'
      end
      if object.class == User
        action = 'added'
      end
      info << {id: id, type: type, creator: creator,
               time: time, action: action}
    end
    info
  end
end
