crumb :admin_root do
  link '管理画面トップ(プロジェクト一覧)', admin_projects_path
end

crumb :admin_project_show do
  link 'プロジェクト詳細', admin_project_path
  parent :admin_root
end

crumb :admin_company_edit do
  link '企業情報編集', edit_admin_company_path
  parent :admin_root
end

crumb :admin_project_edit do
  link '機種情報編集', edit_admin_project_path
  parent :admin_root
end

crumb :admin_project_transmission_setting do
  link '送信設定', transmission_setting_admin_project_path
  parent :admin_root
end

crumb :admin_project_simulation_result do
  link '初期費用回収シミュレーション結果', simulation_result_admin_project_path
  parent :admin_root
end

