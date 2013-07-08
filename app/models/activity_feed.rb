class ActivityFeed < ActiveRecord::Base
  def self.feed(objects, hash = {})
    info = []
    objects.each do |obj_array|
      format(obj_array, hash).each do |obj|
        info << obj
      end
    end
    info.sort_by {|k| k[:time] }.reverse.take(5)
  end

  private
    def self.format(objects, hash = {})
      info = []
      objects.each do |object|
        obj_info(object, info, hash)
      end
      info
    end
    def self.action(object)
      return 'completed' if object.class == Task && object.complete?
      return 'updated' if object.updated_at > object.created_at
      'added'
    end
    def self.obj_info(object, info, hash = {})

        id = object.id
        type = object.class.to_s
        time = object.updated_at
        action = action(object)
        creator = ''
        
        if hash[:caller] != 'User'
          if object.class != User && object.class != List && object.class != Task
            creator = object.user.name
          end
        end

        case object.class.to_s
          when 'Discussion'
            comments = Comment.where(discussion_id: id).order('updated_at DESC').limit(5)
            comments.each do |comment|
              obj_info(comment, info)
            end
          when 'List'
            tasks = Task.where(list_id: id).order('updated_at DESC').limit(5)
            tasks.each do |task|
              obj_info(task, info)
            end
        end

        info << {id: id, type: type, creator: creator,
                time: time, action: action}
    end
end
