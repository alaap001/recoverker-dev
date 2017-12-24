ActiveAdmin.register Request do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :payment_url,:payment_id,:fullname,:email,:contact,:reason,:address_1,:address_2,:state,:city,:zipcode,:enrollment_no,:batch,:course,:extras,:college_id,:institute_id,:fircopy,:year_of_exam,:semester,:fathername, :hsemployer, :hsuniversity, :hsprogramme
#

#scope :passed

index do

selectable_column

column :id , sortable: true
column :email
column :fullname
column :college
column :payment_url
column :payment_status
column "FIR COPY" , :fircopy

actions	

end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
