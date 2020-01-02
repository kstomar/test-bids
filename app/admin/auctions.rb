ActiveAdmin.register Auction do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :start_time, :end_time, items_attributes: [:id, :_destroy, :minimum_bid_value, :name, :description]

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :start_time, as: :date_time_picker
      f.input :end_time, as: :date_time_picker
      f.has_many :items do |item|
        item.input :name
        item.input :description
        item.input :minimum_bid_value
      end

    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :start_time
      row :end_time
    end
    div :class => "panel" do
      h3 "Items"
      if auction.items and auction.items.count > 0
        items = auction.items
        div :class => "panel_contents" do
          div :class => "attributes_table" do
            table do
              tbody do
                tr do
                  th do
                    "Item Name"
                  end
                  th do
                    "Description"
                  end
                  th do
                    "Min bid value"
                  end
                end
                items.each do |item|
                  tr do
                    td do
                      item.name
                    end
                    td do
                      item.description
                    end
                    td do
                      item.minimum_bid_value
                    end
                  end
                end
              end
            end
          end
        end
      else
        h3 "No items available"
      end
    end
  end

end
