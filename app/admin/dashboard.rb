ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    section "Recent Requests" do

        table_for Request.order("created_at desc").limit(6) do
            column :id , sortable: true  do |req|
                link_to req.id , admin_request_path(req)
            end
            column :user do |user|
                link_to user.user.firstname+user.user.lastname , admin_user_path(user.user)
            end
            column :email
            column :created_at, sortable: true
            column :updated_at, sortable: true
        end
        strong {link_to "View All Requests" , admin_requests_path}
      end
      div class: "margin" do
      
      end

    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
   # content
end
