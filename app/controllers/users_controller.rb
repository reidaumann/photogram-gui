class UsersController < ApplicationController
  def index
    matching_users=User.all
    @list_of_users= matching_users.order({:username => :asc})
    render({ :template => "user_templates/index"})
  end

  def show
    url_username=params.fetch("path_username")
    matching_usernames=User.where({:username => url_username})
    @the_user=matching_usernames.at(0)

    render({ :template => "user_templates/details"})
  end

  def new_user
    new_username=params.fetch("input_username")
    a_new_user=User.new
    a_new_user.username=new_username
    a_new_user.save

    redirect_to("/users/"+new_username)
  end

  def update
    updated_username=params.fetch("input_username")
    old_username=params.fetch("path_username")

    matching_users=User.where({:username => old_username})
    the_user=matching_users.at(0)

    the_user.username=updated_username
    the_user.save
    
    redirect_to("/users/"+updated_username)
  end
end
