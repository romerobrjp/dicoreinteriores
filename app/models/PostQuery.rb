class PostQuery
  def initialize(relation = Post.all)
    @relation = relation.extending(Scopes)
  end
  
  def search
    @relation
  end

  module Scopes
    def popular
      last(5)
    end

    def archives
      order(created_at: :desc).limit(5)
    end
  end
end