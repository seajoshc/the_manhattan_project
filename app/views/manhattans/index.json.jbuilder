json.array!(@manhattans) do |manhattan|
  json.extract! manhattan, :id, :name, :recipe, :num_cherries, :rocks,
                :establishment, :city, :notes
  json.url manhattan_url(manhattan, format: :json)
end
