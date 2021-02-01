class TagsController < ApplicationController 

  def index
    @tag_lists = Tag.all.limit(3)
    @tags = Tag.all.order('tag_name')
    
  end

  
end