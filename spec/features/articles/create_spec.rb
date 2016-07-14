feature "Articles: Create" do
  before do
    Tag.create(name: "film")
    Tag.create(name: "news")
  end

  context "with correct data" do
    context "with tags" do
      scenario "creates the article with tags" do
        visit new_article_path
        expect do
          fill_in "Title", with: "Wall St Journal Article"
          fill_in "Body", with: "The body of WSJ article"
          check "film"
          check "news"
          click_button "Create Article"
        end.to change { Article.count }.by(1)

        article = Article.find_by(title: "Wall St Journal Article")
        expect(article.tags.map(&:name)).to eq(%w(news film))

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content(article.title)
        expect(page).to have_content(article.body)
        expect(page).to have_content("news")
        expect(page).to have_content("film")
      end
    end

    context "without tags" do
      scenario "creates the article" do
        visit new_article_path
        expect do
          fill_in "Title", with: "Wall St Journal Article"
          fill_in "Body", with: "The body of WSJ article"
          click_button "Create Article"
        end.to change { Article.count }.by(1)

        article = Article.find_by(title: "Wall St Journal Article")
        expect(article.tags).to eq([])

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content(article.title)
        expect(page).to have_content(article.body)
      end
    end
  end

  context "with incorrect data" do
    scenario "doesn not create the article or taggings" do
      visit new_article_path
      expect do
        fill_in "Title", with: ""
        check "film"
        check "news"
        click_button "Create Article"
      end.to_not change { Article.count && Tagging.count }
    end
  end
end
