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
      column :name
      column "Uploaded At", :created_at
  end

  # SHOW PAGE
  show do
  end

  # FORM
  form title: 'UPLOAD NEW FILE' do |f|
    f.inputs "FILE DETAILS" do
      f.input :uploads, as: :file, required: true
      li "UPLOADED @ #{f.object.created_at}" unless f.object.new_record?
    end
    f.actions
  end
  
end

# upload.file.attach(
#   io: File.open("FILEPATH_URL"),
#   filename: "FILENAME.EXT",
#   content_type: "csv"
# )
