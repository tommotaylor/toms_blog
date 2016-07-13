feature "Posts: Index" do
  let!(:post) { Fabricate :post }

  scenario "lists all posts" do
    visit posts_path
    expect(current_path).to eq(posts_path)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
  end
end
