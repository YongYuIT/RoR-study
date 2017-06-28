class LoginSysController < ApplicationController
  def login_pag

  end

  def check_login
    #render :text =>params[:username]+"->"+params[:password]
    #redirect_to(:controller => "staffs")

    u_name=params[:username]
    u_pwd=Digest::MD5::hexdigest(params[:password])
    str="select * from staffs where username = "+%("#{u_name}")+" and password_md5 = "+%("#{u_pwd}")
    user=Staff.find_by_sql(str)
    #render :text => user[0] == nil ?"empty":user[0].attributes
    if user[0]==nil
      redirect_to "/no_user.html"
    else
    #render :text =>user[0].attributes
      redirect_to :controller =>"leave_records"
    end

  end

end
