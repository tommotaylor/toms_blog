feature "Posts: Comments: Create" do
  it_behaves_like "Comment: Create" do
    let(:object) { Fabricate :post }
    let(:path) { post_path(object) }
  end
end
