module User::BacksHelper
  def optain_name(id)
    project_name = Project.select("name").where(id: id).send(params[:scope])
    unless project_name[0].nil?
      return project_name[0].name
    end
    nil
  end
end
