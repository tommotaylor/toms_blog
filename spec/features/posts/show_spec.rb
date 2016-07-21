feature "Posts: Show" do
  let!(:post) { Fabricate :post }
  let!(:other_post) { Fabricate :post }

  scenario "shows the post" do
    visit post_path(post)
    expect(current_path).to eq(post_path(post))
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)

    expect(page).to have_no_content(other_post.body)
    expect(page).to have_no_content(other_post.body)
  end

  context "with comments" do
    let!(:comments) do
      30.times { Fabricate :comment, commentable: post }
    end
    scenario "has 'Load more comments' link to load more comments", :js do
      visit post_path(post)
      default_per_page = 15 # set in Post.rb
      expect(page).to have_css(".comment", count: default_per_page)
      click_link "Load more comments..."
      expect(page).to have_css(".comment", count: 2 * default_per_page)
    end
  end
end
