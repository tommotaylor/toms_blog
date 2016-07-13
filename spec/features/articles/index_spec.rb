feature "Articles: Index" do
  let!(:article) { Fabricate :article }
  let!(:article_2) { Fabricate :article }
  let!(:last_comment) do
    Fabricate :comment,
      commentable: article,
      body: "Not visible",
      created_at: 2.days.ago
  end
  let!(:comments) do
    3.times do |i|
      Fabricate :comment,
        commentable: article,
        body: "Comment #{i}"
    end
  end

  scenario "lists articles with first three comments" do
    visit articles_path
    expect(current_path).to eq(articles_path)
    expect(page).to have_content(article.title)
    expect(page).to have_content(article.body)
    expect(page).to have_content(article_2.title)
    expect(page).to have_content(article_2.body)

    within ".article_#{article.id}" do
      expect(page).to have_content("Comment 0")
      expect(page).to have_content("Comment 1")
      expect(page).to have_content("Comment 2")
      expect(page).to have_no_content("Not visible")
    end
  end
end
