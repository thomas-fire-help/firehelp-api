# API Documentation

## Index
* [Authentication](#authentication)
  * [Login](#login)
  * [Register](#register)
* [Tag](#tag)
  * [Index](#index-1)
  * [Show](#show-1)
  * [Create](#create-1)
  * [Update](#update-1)
  * [Destroy](#destroy-1)
* [Housing](#housing)
  * [Index](#index-2)
  * [Show](#show-2)
  * [Create](#create-2)
  * [Update](#update-2)
  * [Destroy](#destroy-2)

# Authentication
## Login
```
api :POST, '/auth/login'
param :login,    String, desc: 'Phone # or Username', required: true
param :password, String, desc: "User's password",     required: true
```
## Register
```
api :POST, '/auth/register'
param :username,     String, desc: 'Username',     required: true
param :phone_number, String, desc: 'Phone Number', required: true
param :password,     String, desc: "Password",     required: true
```

# Tag
## Index
```
api :GET, '/tags'
```
## Show
```
api :GET, '/tags/:id', desc: "Requires admin"
```
## Create
```
api :POST, '/tags', desc: "Requires admin"
param :name String,  required: true
param :category String, options: ['housing'], required: true
```
## Update
```
api :PATCH/PUT, '/tags/:id', desc: "Requires admin"
param :name String,  required: true
param :category String, options: ['housing'], required: true
```
## Destroy
```
api :DELETE, '/tags/:id'
```

# Housing
## Index
```
api :GET, '/housings'
```
## Show
```
api :GET, '/housings/:id'
```
## Create
```
api :POST, '/housings'
param :city           String,  required: true
param :beds           Integer, required: true
param :length_of_stay String,  options: ['short', 'long', 'permanent'], required: true
param :child_friendly Boolean, required: true
param :kid_notes      Text
param :pets_accepted  Boolean, required: true
param :pet_notes      Text
param :contact_name   String,  required: true
param :phone_number   String,  required: true
param :email_address  String,  required: true
param :notes          Text
param :tags           String,  desc: "Comma separated string of Tag IDs"
```
## Update
```
api :PATCH/PUT, '/housings/:id'
param :city           String,  required: true
param :beds           Integer, required: true
param :length_of_stay String,  options: ['short', 'long', 'permanent'], required: true
param :child_friendly Boolean, required: true
param :kid_notes      Text
param :pets_accepted  Boolean, required: true
param :pet_notes      Text
param :contact_name   String,  required: true
param :phone_number   String,  required: true
param :email_address  String,  required: true
param :notes          Text
param :tags           String,  desc: "Comma separated string of Tag IDs"
```
## Destroy
```
api :DELETE, '/housings/:id'
```
