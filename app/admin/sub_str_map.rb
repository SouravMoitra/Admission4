ActiveAdmin.register SubStrMap  do
  menu label: "Stream subjects maps"
  controller do
    before_filter { @page_title = "Stream subjects maps" }
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :stream_id, :subject_id, :GEN, :SC, :ST, :OBC_A, :OBC_B

  index do
    column :id
    column :stream_id do |s|
      s.stream.name
    end
    column :subject_id do |s|
      s.subject.name
    end
    column :GEN
    column :SC
    column :ST
    column :OBC_A
    column :OBC_B
    actions
  end

end
