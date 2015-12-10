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
      group_by { |m| m.created_at.beginning_of_month }
    end

    def by_category(category)
      where(category: category)
    end
  end
end