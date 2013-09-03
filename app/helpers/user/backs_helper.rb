module User::BacksHelper
  def optain_name(id)
    project_name = Project.select("name").where(id: id).send(params[:scope])
    unless project_name[0].nil?
      return project_name[0].name
    end
    nil
  end

  def load_li_active
    list = ["","",""]
    if params[:scope] == "non_closed"
      list[0] = "active"
    elsif params[:scope] == "closed"
      list[1] = "active"
    else
      list[2] = "active"
    end
    list
  end
end
