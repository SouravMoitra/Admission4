ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do


    columns do
      column do
        panel "Streams" do
          table do
            Stream.all.map do |stream|
              tr
                td link_to stream.name, admin_stream_path(stream)
                td stream.GEN
                td stream.SC
                td stream.ST
                td stream.OBC_A
                td stream.OBC_B
            end
          end
        end
      end
      column do
        panel "Subject" do
          table do
            Subject.all.map do |subject|
              tr
                td link_to subject.name, admin_subject_path(subject)
                td subject.tstream
            end
          end
        end
      end
      column do
        panel "Subject Stream Map" do
          table do
            SubStrMap.all.map do | substr|
              tr
                td substr.stream.name
                td substr.subject.name
                td link_to "SubStrMap", admin_sub_str_map_path(substr)
            end
          end
        end
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
  end # content
end
