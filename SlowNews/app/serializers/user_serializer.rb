class UserSerializer < ActiveModel::Serializer
  attributes  :id, :first, :last, :email, :keywords, :sources, :exclusions
end
