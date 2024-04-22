class AccountController < ApplicationController
  def index
    if cookies.encrypted[:login].blank?
      redirect_to "/login"
    end
  end

  def editSite
    flash.now[:banner] = params[:site_editor][:banner]
    @upd = ServerHead.find(1)
    @upd.banner = params[:site_editor][:banner]
    if @upd.save
      flash.now[:return] = "updated banner"
    else
      flash.now[:return] = "failed to update banner"
    end
    render "index", status: 500
  end

  def logout
    cookies.delete :login
    redirect_to "/"
  end
end
