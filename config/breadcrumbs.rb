# 情報入力
crumb :root do
  link "情報入力", new_user_cart_path(current_user.id)
end

# ご注文内容の確認
crumb :carts_index do
  link "ご注文内容の確認", user_carts_path
end

# ご注文完了
crumb :complete do
  link "ご注文完了", complete_order_path
  parent :carts_index
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
