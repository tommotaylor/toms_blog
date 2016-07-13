feature "Article: Comments: Create" do
  let!(:article) { Fabricate :article }

  context "with correct data" do
    scenario "creates a comment on the correct article" do
      visit article_path(article)
      expect(current_path).to eq(article_path(article))

      expect do
        fill_in "Leave a comment", with: "My first comment"
        click_button "Create comment"
        expect(current_path).to eq(article_path(article))
        expect(page).to have_content("My first comment")
      end.to change { Comment.count }.by(1)

      comment = Comment.find_by(body: "My first comment")
      expect(comment.commentable).to eq(article)
    end
  end

  context "with incorrect data" do
    scenario "does not create the comment" do
      visit article_path(article)
      expect(current_path).to eq(article_path(article))

      expect do
        fill_in "Leave a comment", with: ""
        click_button "Create comment"
        expect(current_path).to eq(article_path(article))
        expect(page).to have_no_content("My first comment")
      end.to_not change { Comment.count }
    end
  end
end