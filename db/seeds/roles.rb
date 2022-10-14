Role.destroy_all
[
  {
    id: 1,
    name: :admin
  },
  {
    id: 2,
    name: :manager
  },
  {
    id: 3,
    name: :entrepreneur
  }
].each do |role|
  Role.create!(role)
end
