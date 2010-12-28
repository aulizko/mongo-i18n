require 'helper'

describe MongoI18n::Store do
  before(:each) do
    DB.collections.each do |collection|
      collection.remove
      collection.drop_indexes
    end
  end

  let(:collection)  { DB.collection('mongo_i18n') }
  let(:store)       { MongoI18n::Store.new(collection) }

  it "has a collection" do
    store.collection.should == collection
  end

  describe "write" do
    before(:each) do
      store['foo'] = 'bar'
    end
    
    let(:document) { collection.find_one(:_id => 'foo') }

    it "should set _id to key" do
      document['_id'].should == 'foo'
    end

    it "should set value key to value" do
      store['foo'].should == 'bar'
    end

    it "should always set key as string" do
      store[:baz] = 'wick'
      doc = collection.find_one(:_id => 'baz')
      doc.should_not be_nil
      doc['_id'].should be_instance_of(String)
    end
  end

  describe "read" do
    before(:each) do
      store['foo'] = 'bar'
    end
    let(:document) { collection.find_one(:_id => 'foo') }

    it "should return nil for key not found" do
      store['non:existent:key'].should be_nil
    end

    it "should return value for existing key" do
      store['foo'] = 'bar'
      store['foo'].should == 'bar'
    end

    it "should be able to work with symbol" do
      store[:foo].should == 'bar'
    end
  end
  
  describe 'keys' do
    before(:each) do
      store['foo'] = 'bar'
    end
    
    it "should return array of existing keys" do
      store.keys.size.should == 1
      store.keys.include?('foo').should be_true
    end
    
    it "should return empty array if there is not any records" do
      collection.remove
      store.keys.size.should == 0
    end
  end
  
  describe 'available_locales' do
    before(:each) do
      store['en.foo'] = 'bar'
      store['ru.foo'] = 'russian_bar'
    end 
    
    it "should return proper locales array" do
      locales = store.available_locales
      locales.size.should == 2
      locales.include?(:en).should be_true
      locales.include?(:ru).should be_true
    end
    
    it "should return empty array if there is now records with proper keys" do
      collection.remove
      store.available_locales.size.should == 0
    end
  end
end