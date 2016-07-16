feature "Article: Comments: Create" do
  it_behaves_like "Comment: Create" do
    let(:object) { Fabricate :article }
    let(:path) { article_path(object) }
  end
end
