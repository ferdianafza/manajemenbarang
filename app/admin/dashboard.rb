# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Data Barang" do
          ul do
            Barang.all.map do |barang|
              li link_to(barang.nama_barang, admin_barang_path(barang))
            end
          end
        end
      end

      column do
        panel "Barang Masuk" do
          para "Welcome to ActiveAdmin."
        end
      end
      column do
        panel "Barang Keluar" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
