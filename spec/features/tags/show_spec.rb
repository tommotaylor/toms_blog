feature "Tags: Show" do
  let(:tag) { Tag.create(name: "film") }
  let(:other_tag) { Tag.create(name: "music") }
  let!(:post) { Fabricate :post }
  let!(:article) { Fabricate :article }
  let!(:article_2) { Fabricate :article }

  before do
    post.tags << tag
    article.tags << tag
    article_2.tags << other_tag
  end

  scenario "displays all articles and posts for that tag" do
    visit tag_path(tag)
    within ".page-header" do
      expect(page).to have_content(tag.name)
    end
    expect(page).to have_content(post.title)
    expect(page).to have_content(article.title)
    expect(page).to have_no_content(article_2.title)
  end
end
