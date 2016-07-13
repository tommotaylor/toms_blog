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
end
