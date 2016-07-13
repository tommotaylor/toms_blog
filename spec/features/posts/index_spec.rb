feature "Posts: Index" do
  let!(:post) { Fabricate :post }
  let!(:post_2) { Fabricate :post }
  let!(:last_comment) do
    Fabricate :comment,
      commentable: post,
      body: "Not visible",
      created_at: 2.days.ago
  end
  let!(:comments) do
    3.times do |i|
      Fabricate :comment,
        commentable: post,
        body: "Comment #{i}"
    end
  end

  scenario "lists posts with first three comments" do
    visit posts_path
    expect(current_path).to eq(posts_path)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
    expect(page).to have_content(post_2.title)
    expect(page).to have_content(post_2.body)

    within ".post_#{post.id}" do
      expect(page).to have_content("Comment 0")
      expect(page).to have_content("Comment 1")
      expect(page).to have_content("Comment 2")
      expect(page).to have_no_content("Not visible")
    end
  end
end
