feature "Articles: Show" do
  let!(:article) { Fabricate :article }
  let!(:other_article) { Fabricate :article }

  scenario "shows the article" do
    visit article_path(article)
    expect(current_path).to eq(article_path(article))
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.body)

    expect(page).to have_no_content(other_article.body)
    expect(page).to have_no_content(other_article.body)
  end

  context "with comments" do
    let!(:comments) do
      30.times { Fabricate :comment, commentable: article }
    end
    scenario "has 'Load more comments' link to load more comments", :js do
      visit article_path(article)
      default_per_page = 15 # set in Article.rb
      expect(page).to have_css(".comment", count: default_per_page)
      click_link "Load more comments..."
      expect(page).to have_css(".comment", count: 2 * default_per_page)
    end
  end
end
