# Synchronize DB content with content of articles_simplified.json file.
# /!\ This is not production-ready and exists only for the sake of the test.

raw_articles_data = File.read('articles_simplified.json')
articles_data = JSON.parse(raw_articles_data)['posts']

articles_data.each do |data|
  article = Article.find_or_initialize_by(id: data['uuid'])

  all_tags_data = data['tags']
  all_tags_data << data['primary_tag'] if data['primary_tag']

  tags = all_tags_data.each_with_object(Set.new) do |tag_data, result|
    tag_name = tag_data['name']
    next if tag_name[0] == '#'

    result << tag_name
  end

  article.update!(
    title: data['title'],
    image_url: data['feature_image'],
    html_content: data['html'],
    tags: tags.to_a,
  )
end
