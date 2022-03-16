class StarsCounterByCategoryQuery 
  def count(category)
    @count_category = @count_category || Star.group(:category).count(:name)
    @count_category[category] || 0
  end
end
