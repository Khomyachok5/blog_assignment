class AdminsController < ApplicationController

  def manage
    @users = User.order(created_at: :asc)
    @articles = Article.order(created_at: :asc)
    @admin_count = User.where(is_admin: true).count
  end

  def invalidate
    unless params[:count] == 1
      if @admin
        @admin.update_attributes(is_admin: false)
        flash.notice = "#{@admin.email} has been voided of administrative privileges"
      else
        flash.alert = @admin.errors.full_messages.join('. ')
      end
    end
    redirect_to admin_path
  end


  def promote
    @admin.update_attributes(is_admin: true)
    flash.notice = "#{@admin.email} has been successfully promoted to the administrator"
    redirect_to admin_path
  end

  private
  
  def find_user
    @admin = User.find(params[:id])
  end

end
