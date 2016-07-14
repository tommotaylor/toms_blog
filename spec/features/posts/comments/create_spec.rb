feature "Posts: Comments: Create" do
  let!(:post) { Fabricate :post }

  context "with correct data" do
    scenario "creates a comment on the correct post" do
      visit post_path(post)
      expect(current_path).to eq(post_path(post))

      expect do
        fill_in "Leave a comment", with: "My first comment"
        fill_in "Username", with: "Tom"
        click_button "Create comment"
        expect(current_path).to eq(post_path(post))
        expect(page).to have_content("My first comment")
        expect(page).to have_content("Tom")
      end.to change { Comment.count }.by(1)

      comment = Comment.find_by(body: "My first comment")
      expect(comment.commentable).to eq(post)
    end
  end

  context "with incorrect data" do
    scenario "does not create the comment" do
      visit post_path(post)
      expect(current_path).to eq(post_path(post))

      expect do
        fill_in "Leave a comment", with: ""
        fill_in "Username", with: ""
        click_button "Create comment"
        expect(current_path).to eq(post_path(post))
        expect(page).to have_no_content("My first comment")
      end.to_not change { Comment.count }
    end
  end
end
