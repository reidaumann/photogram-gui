Rails.application.routes.draw do
  get("/", {:controller =>"users", :action =>"index"})
  get("/users", {:controller =>"users", :action =>"index"})
  get("/users/:path_username", {:controller =>"users", :action =>"show"})

  get("/photos", {:controller =>"photos", :action =>"index"})
  get("/photos/:path_id", {:controller =>"photos", :action =>"show"})
  get("/delete_photo/:img_id", {:controller =>"photos", :action =>"delete"})
  post("/add_photo", {:controller =>"photos", :action =>"create"})
  post("/update_photo/:img_id", {:controller =>"photos", :action =>"update"})

  post("/add_comment/:img_id", {:controller =>"photos", :action =>"commenting"})
end
