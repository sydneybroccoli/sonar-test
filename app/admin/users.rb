ActiveAdmin.register User do
  index do
      selectable_column
      column :id
      column :email
      column :admin
      column :created_at
  end

  form do |f|
    f.inputs "IDENTITY" do
      f.input :email
    end
    f.inputs "ADMIN" do
      f.input :admin
    end
    f.actions
  end

  permit_params :email, :admin
  
end
