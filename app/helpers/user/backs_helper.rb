module User::BacksHelper
  def optain_name(id) 
    projectn = Project.select("name").where(id: id)
    return projectn[0].name 
  end
end
