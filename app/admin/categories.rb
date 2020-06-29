ActiveAdmin.register Category do
  permit_params :name, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :parent
    actions
  end

  filter :name
  filter :parent

  form do |f|
    f.inputs do
      f.input :name
      f.input :parent
    end
    f.actions
  end

end
