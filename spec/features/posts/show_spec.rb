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
end
