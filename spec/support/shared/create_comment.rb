RSpec.shared_examples "Comment: Create" do
  context "without js" do
    context "with correct data" do
      scenario "creates a comment on the correct object" do
        visit path
        expect do
          fill_in "Leave a comment", with: "My first comment"
          fill_in "Username", with: "Tom"
          click_button "Create comment"
          expect(current_path).to eq(path)
          expect(page).to have_content("My first comment")
          expect(page).to have_content("Tom")
          expect(page).to have_content("Comment saved")
        end.to change { Comment.count }.by(1)

        comment = Comment.find_by(body: "My first comment")
        expect(comment.commentable).to eq(object)
      end
    end

    context "with incorrect data" do
      scenario "does not create the comment" do
        visit path
        expect(current_path).to eq(path)

        expect do
          fill_in "Leave a comment", with: ""
          fill_in "Username", with: ""
          click_button "Create comment"
          expect(current_path).to eq(path)
          expect(page).to have_content("Comment and username required")
          expect(page).to have_no_content("My first comment")
        end.to_not change { Comment.count }
      end
    end
  end

  context "with js", :js do
    context "with correct data" do
      scenario "creates a comment on the correct object" do
        visit path
        expect(current_path).to eq(path)

        expect do
          fill_in "Leave a comment", with: "My first comment"
          fill_in "Username", with: "Tom"
          click_button "Create comment"
          within ".comments-container" do
            expect(page).to have_content("My first comment")
            expect(page).to have_content("Tom")
          end
        end.to change { Comment.count }.by(1)

        comment = Comment.find_by(body: "My first comment")
        expect(comment.commentable).to eq(object)
      end
    end

    context "with incorrect data" do
      scenario "does not create the comment" do
        visit path
        expect(current_path).to eq(path)

        expect do
          fill_in "Leave a comment", with: ""
          fill_in "Username", with: ""
          click_button "Create comment"
        end.to_not change { Comment.count }

        within ".comment-form" do
          expect(page).to have_content("Comment and username required")
        end
      end
    end
  end
end
