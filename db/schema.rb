# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130729215229) do

  create_table "shopifylandingpages", :force => true do |t|
    t.string   "producttype"
    t.string   "producttitle"
    t.string   "producthandle"
    t.string   "productimage1"
    t.string   "productimage2"
    t.string   "productimage3"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "producthtml"
    t.integer  "productid"
    t.string   "setname"
  end

  create_table "shopifyproducts", :force => true do |t|
    t.string   "producttitle"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "producthandle"
    t.string   "imageurl"
    t.string   "producttype"
    t.integer  "productid"
    t.integer  "shopifylandingpage_id"
  end

  create_table "shopifyvariants", :force => true do |t|
    t.string   "varianttitle"
    t.string   "string"
    t.integer  "variantid"
    t.string   "integer"
    t.integer  "variantinvqty"
    t.integer  "variantprice"
    t.string   "variantop1"
    t.string   "variantop2"
    t.integer  "variantgrams"
    t.string   "variantposition"
    t.string   "variantsku"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "shopifyproduct_id"
  end

end
