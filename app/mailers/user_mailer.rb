class UserMailer < ActionMailer::Base

  default from: "narciso69@gmail.com"

  def project_notification(project)
    mail(:to => "ruben@tangosource.com", :subject => "The new project: #{project}, has been created")
  end

end
