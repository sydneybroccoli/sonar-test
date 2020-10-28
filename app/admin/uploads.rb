ActiveAdmin.register Upload, as: "Files" do
  actions :all, except: :update
  permit_params :filename, :filetype, :filepath, :user_id

  # CONTROLLER
  controller do
    def create
    end

    def destroy
    end
  end

  # INDEX PAGE
  index do
      selectable_column
      column :id
      column "Author", :user_id
      column :filename
      column :filetype
      column :filepath
      column "Uploaded At", :created_at
  end

  # SHOW PAGE
  show do
  end

  # FORM
  form title: 'UPLOAD A FILE' do |f|
    f.inputs "FILE" do
      f.input :filepath, label: "FILEPATH URL"
      li "UPLOADED @ #{f.object.created_at}" unless f.object.new_record?
    end
    f.actions
  end
  
end
