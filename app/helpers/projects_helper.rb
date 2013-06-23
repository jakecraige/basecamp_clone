module ProjectsHelper
  def get_status(status)
    return "Active" if status == true
    "Archived"
  end
end
