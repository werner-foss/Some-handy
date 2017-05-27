User.create!(
  email: "wernerfosspilot@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Admin User",
  roles: "site_admin"
  )
puts "1 Admin used profile was created"

User.create!(
  email: "test@test.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Regular User",
  )
puts "1 Regular used profile was created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
    )
  end
puts "3 topics were created"

10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
    topic_id: Topic.last.id
    )
  end
puts "10 blog posts were created"

3.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    precent_utilized: 15
    )
  end
puts "5 skills were created"

4.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Some text",
    main_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150",
    thumb_image: "https://placeholdit.imgix.net/~text?txtsize=6&txt=50%C3%9750&w=50&h=50"
    )
  end
5.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "Some text",
    main_image: "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150",
    thumb_image: "https://placeholdit.imgix.net/~text?txtsize=6&txt=50%C3%9750&w=50&h=50"
    )
  end
puts "9 portfolios were created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}",
    )
  end
puts "3 technologies were created"
