class TaskSerializer < ActiveModel::Serializer
  attributes :id, :date, :title, :location, :time, :beforeImage, :afterImage, :user_id, :progress
end
