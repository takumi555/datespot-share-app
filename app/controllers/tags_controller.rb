class TagsController < ApplicationController 

  def index
    @tag_lists = Tag.all.limit(15)
    @tags = Tag.all.order('tag_name')
    
  end

  
end