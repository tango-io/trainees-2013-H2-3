module User::BacksHelper
  def optain_name(id) 
    projectn = Project.select("name").where(id: id)
    binding.pry
    return projectn[0].name 
  end
end
