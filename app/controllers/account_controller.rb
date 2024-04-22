class AccountController < ApplicationController
  def index
    if cookies.encrypted[:login].blank?
      redirect_to "/login"
    elsif cookies.encrypted[:login] == "admin"
      flash.now[:banner] = ServerHead.find(1).banner
      render "index", status: 500
    end
  end

  def editSite
    flash.now[:banner] = ServerHead.find(1).banner
    @upd = ServerHead.find(1)
    @upd.banner = params[:site_editor][:banner]
    returnMsg = ""
    if @upd.save
      returnMsg = "updated banner, "
    else
      returnMsg += "failed to update banner, "
    end
    if params[:site_editor][:delete_account].length > 0
      if Account.find_by(username: params[:site_editor][:delete_account]) != nil
        @user = Account.find_by(username: params[:site_editor][:delete_account].to_s)
        @user.destroy
        returnMsg += "deleted user " + params[:site_editor][:delete_account]
      end
    end
    flash.now[:return] = returnMsg
    render "index", status: 500
  end

  def logout
    cookies.delete :login
    redirect_to "/"
  end
end
