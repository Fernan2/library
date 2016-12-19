# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.test?
  authors = FactoryGirl.create_list(:author, Random.rand(5..10))
  authors.each { |author| FactoryGirl.create_list(:book, Random.rand(0..5) * Random.rand(0..5), author: author) }

  email_maximus = 'maximuslongitusxxxl@maximuslongitusxxxxl.com.ar'
  unless Author.find_by(email: email_maximus)
    maximuslongitus = FactoryGirl.create(
      :author,
      first_name: 'MaximusLongitus Froilán de Todos los Santos',
      last_name: 'Fitz-James Stuart y de Silva Falcó y Gurtubay',
      email: email_maximus,
      phone: 'fijo 961235462, y móvil 658224466. Mejor llamar al fijo primero.',
      city: 'Villanueva de los Infantes, en la provincia de Ciudad Real (España)',
      address: 'Glorieta Su Alteza Real don Juan de Borbón y Battemberg',
      website: 'http://comparador.rastreator.com/finanzas-hipotecas.aspx?utm_source=google&utm_medium=cpc&utm_content=e&utm_term=hipotecas&utm_campaign=MORTGAGES_FINANCES_Generics_Premium&nst=0&ckggl=AMsySZbBY_GG8MMqyiQRUFusksqx&gclid=CMGTk5H6_tACFQIM0wodxEoNzA&gclsrc=aw.ds&dclid=CJ_2sZL6_tACFSOoUQodzpIE4Q')
    FactoryGirl.create_list(:book, 50, author: maximuslongitus)
    FactoryGirl.create(
      :book,
      author: maximuslongitus,
      title: 'De cómo MaximusLongitus XXXXL decidió poner a prueba la web pero se le olvidó resumir y acabó poniendo textos demasiados largos por todas partes')
  end
end

Country.find_or_create_by(code: 'es_ES', name: 'España')
Country.find_or_create_by(code: 'en_US', name: 'USA')

puts "Seed done. Authors: #{Author.count}, books: #{Book.count}"
