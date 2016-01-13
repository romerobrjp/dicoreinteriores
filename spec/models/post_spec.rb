require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:valid_attributes) {
    {title: 'test01', body: '123123123'}
  }

  let(:invalid_attributes) {
    {title: '', body: 'asdsadadsd'}
  }

  describe "when valid_attributes" do
    it "creates post with required params" do
      expect {
        Post.create! valid_attributes
      }.to change(Post, :count).by(1)
    end
  end

  describe "testing tags" do
    it "creates tags passing a list of strings" do
      post = Post.create! valid_attributes
      post.tag_list.add('tag01', 'tag02', 'tag03')
      post.save
      expect(Post.find(1).tag_list.to_a).to eq(%w( tag01 tag02 tag03 ))
    end

    it "creates tags passing a string csv" do
      post = Post.create! valid_attributes
      post.tag_list.add('tag04, tag05, tag06', parse: true)
      post.save
      expect(Post.find(1).tag_list.to_a).to eq(%w( tag04 tag05 tag06 ))
    end

    it "tags counter with 2 posts" do
      post = Post.create! valid_attributes
      post.tag_list.add('tag01, tag02', parse: true)
      post.save
      post = Post.create! valid_attributes
      post.tag_list.add('tag02, tag03', parse: true)
      post.save
      expect(ActsAsTaggableOn::Tag.most_used[0].name).to eq('tag02')
      expect(Post.tagged_with('tag01').count).to eq(1)
      expect(Post.tagged_with('tag02').count).to eq(2)
      expect(Post.tagged_with('tag03').count).to eq(1)
    end

  end

end
