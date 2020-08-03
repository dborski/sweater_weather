class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :forecast, :trails
end