# API Documentation

## Index
* [Authentication](#authentication)
  * [Login](#login)
  * [Register](#register)
* [User](#user)
  * [Index](#index-1)
  * [Show](#show)
  * [Update](#update)
  * [Destroy](#destroy)
  * [Resend Verification](#resend-verification)
  * [Verify](#verify)
* [Tag](#tag)
  * [Index](#index-2)
  * [Show](#show-1)
  * [Create](#create)
  * [Update](#update-1)
  * [Destroy](#destroy-1)
* [Housing](#housing)
  * [Index](#index-3)
  * [Show](#show-2)
  * [Create](#create-1)
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

# User
## Index
```
api :GET, '/users', desc: "Requires admin"
param :page     Integer, desc: "What page to get"
param :per_page Integer, default: 25 desc: "How many results per page"
```
## Show
```
api :GET, '/users/:id', desc: "Requires admin"
```
## Update
`required` will only be enforced if it does not previously exist
```
api :PATCH/PUT, '/users/:id'
param :username,     String, desc: 'Username',     required: true
param :phone_number, String, desc: 'Phone Number', required: true
param :password,     String, desc: "Password",     required: true
```
## Destroy
```
api :DELETE, '/users/:id', desc: "Requires admin"
```
## Resend Verification
```
api :POST, '/users/:id/resend_verification', desc: 'Resend text message verification for a user'
```
## Verify
```
api :POST, '/users/:id/verify', desc: "Verify a user's phone number via pin"
param :pin Integer, desc: "4 digit pin for user's phone verification", required: true
```

# Tag
## Index
```
api :GET, '/tags'
param :page     Integer, desc: "What page to get"
param :per_page Integer, default: 25 desc: "How many results per page"
param :category String, desc: "Filter by tag's category"
```
## Show
```
api :GET, '/tags/:id', desc: "Requires admin"
```
## Create
```
api :POST, '/tags', desc: "Requires admin"
param :name     String,  required: true
param :category String, options: ['housing'], required: true
```
## Update
`required` will only be enforced if it does not previously exist
```
api :PATCH/PUT, '/tags/:id', desc: "Requires admin"
param :name     String,  required: true
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
param :page     Integer, desc: "What page to get"
param :per_page Integer, default: 25 desc: "How many results per page"
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
param :has_animals    Boolean, required: true
param :paid           Boolean, required: true
param :neighborhood   String
param :housing_type   String, options: ['house', 'room'], required: true
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
param :user_id        Integer, desc: "DO NOT CHANGE, which user the housing post belongs to"
param :status         String,  options: ['available', 'claimed', 'archived'], default: 'available', desc: 'Shouldn't be changed via create, only via update. Status of the posting'
params :verified      Boolean, default: false, desc: 'Shouldn't be changed via create, only via update. Whether the posting is verified or not'
```
## Update
`required` will only be enforced if it does not previously exist
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
param :user_id        Integer, desc: "DO NOT CHANGE, which user the housing post belongs to"
param :status         String,  options: ['available', 'claimed', 'archived'], default: 'available', desc: 'Status of the posting'
params :verified      Boolean, default: false, desc: 'Whether the posting is verified or not'
```
## Destroy
```
api :DELETE, '/housings/:id'
```
