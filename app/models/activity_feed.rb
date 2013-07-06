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
      time = object.updated_at
      action = 'added'
      creator = ''
      
      if object.class != User && object.class != List
        creator = object.user.name
      end

      if object.updated_at > object.created_at
        action = 'updated'
      end

      info << {id: id, type: type, creator: creator,
               time: time, action: action}
    end
    info
  end
end
