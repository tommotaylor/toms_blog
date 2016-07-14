feature "Posts: Create" do
  before do
    Tag.create(name: "film")
    Tag.create(name: "news")
  end

  context "with correct data" do
    context "with tags" do
      scenario "creates the post with tags" do
        visit new_post_path
        expect do
          fill_in "Title", with: "My Great Post"
          fill_in "Body", with: "The body of my Great Post"
          check "film"
          check "news"
          click_button "Create Post"
        end.to change { Post.count }.by(1)

        post = Post.find_by(title: "My Great Post")
        expect(post.tags.map(&:name)).to eq(%w(news film))

        expect(current_path).to eq(post_path(post))
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.body)
        expect(page).to have_content("news")
        expect(page).to have_content("film")
      end
    end

    context "without tags" do
      scenario "creates the post" do
        visit new_post_path
        expect do
          fill_in "Title", with: "My Great Post"
          fill_in "Body", with: "The body of my Great Post"
          click_button "Create Post"
        end.to change { Post.count }.by(1)

        post = Post.find_by(title: "My Great Post")
        expect(post.tags).to eq([])

        expect(current_path).to eq(post_path(post))
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.body)
      end
    end
  end

  context "with incorrect data" do
    scenario "does not create the article or taggings" do
      visit new_post_path
      expect do
        fill_in "Title", with: ""
        check "film"
        check "news"
        click_button "Create Post"
      end.to_not change { Post.count && Tagging.count }
    end
  end
end
