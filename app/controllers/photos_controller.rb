class PhotosController < ApplicationController
  def index
    matching_photos=Photo.all
    @list_of_photos=matching_photos.order({:created_at => :desc})
    render({:template => "photo_templates/index"})
  end

  def show
    url_id=params.fetch("path_id")
    matching_photos = Photo.where({:id => url_id})
    @the_photo=matching_photos.at(0)

    render({:template => "photo_templates/details"})
  end

  def delete
    the_id=params.fetch("img_id")
    matching_photos = Photo.where({:id => the_id})
    to_delete= matching_photos.at(0)
    to_delete.destroy

    redirect_to( "/photos")
  end

  def create
    input_image=params.fetch("query_image")
    input_caption=params.fetch("query_caption")
    input_owner_id=params.fetch("query_owner")

    a_new_photo=Photo.new
    a_new_photo.image=input_image
    a_new_photo.caption=input_caption
    a_new_photo.owner_id=input_owner_id

    a_new_photo.save

    redirect_to( "/photos/"+a_new_photo.id.to_s)
  end

  def update
    the_id=params.fetch("img_id")
    input_image=params.fetch("query_image")
    input_caption=params.fetch("query_caption")

    matching_photos=Photo.where({:id => the_id})
    the_photo=matching_photos.at(0)

    the_photo.image=input_image
    the_photo.caption=input_caption
    the_photo.save

    redirect_to( "/photos/"+the_photo.id.to_s)
  end

  def commenting
  #input_photo_id, input_author_id, input_comment params come from form
  commenting_photo_id=params.fetch("input_photo_id")
  matching_photos=Photo.where({:id=>commenting_photo_id})
  the_photo=matching_photos.at(0)

  comment_author_id=params.fetch("input_author_id")
  comment_text=params.fetch("input_comment")

  new_comment=Comment.new
  new_comment.photo_id=the_photo.id
  new_comment.author_id=comment_author_id
  new_comment.body=comment_text

  new_comment.save

  redirect_to("/photos/"+the_photo.id.to_s)
  end
end
