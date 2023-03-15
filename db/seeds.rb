require 'faker'

StampCard.destroy_all
StampCardTemplate.destroy_all
Shop.destroy_all
User.destroy_all

User.create!(
  username: "Ricky Martin",
  email: "blabla@hardcoded.com",
  password: "123qwe",
  profile_img_url: Faker::Avatar.image,
  qr_code_id: Faker::Number.unique.between(from: 1000, to: 9999)
)


20.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "123qwe",
    profile_img_url: Faker::Avatar.image,
    qr_code_id: Faker::Number.unique.between(from: 1000, to: 9999)
  )
  puts "#{User.last.username} created..."
end



  Shop.create!(
    [
      { name: "Joseph's Restaurant & Bar", # Faker::Restaurant.name
      category: "German Restaurant",
      address: "Agrippinawerft 22, 50678 Köln",
      img_url: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABWVBMVEX///+zom4AAADl5eXc29z8/PznJhT///65urrnGAC+vr7iAACqrav44+Dt7e2oqKrR0dH08ei9xcPeLB3Dx8PpkojtlZDhGwDqJQ3z8/Pj5+emoqP89OnfMCP98+2vsLHgUkW5r7PdQTPib2TbOCrhZFvhJADdTDzmgnb21s3urqPrsqubm5vy8vJzc3PT09NDQ0ONjY1eXl5/f3/K0s00NDRPT0+unmPa1ry2oG/uEQDWEwCJjoeIiYivsLeuuLg5OTloaGgbGxsVFRW3q4Lm48zRzK3HtpWyo3jp5tm/q43Y2c3WzaqolGHEwZvZ0LespGitl1SpnHHLuJ/b1LPxxrrvvrTofnzpo57XfnXaZmXusrXxy8bWVkHPU0vpoJbddFvfi3jw39Dx0b3o+/T42tqqua+YlaHptqnaPiDtpa7s///sw8bp29WVoJrrkoTb5NnioInYWVUuJXxMAAAQ/klEQVR4nO2b/VvayBbHI8nkFZLwoknAEus7MoAB1Aoia6tV99ba3Xu1tsvW1qur97br9u7//8M9kxAgvAjtum3pM599HqVmkjnfmTNzzhmyDEOhUCgUCoVCoVAoFAqFQqFQKBQKhUKhUCgUCoVCoVAoFAqFQqFQKBQKZUwQCNNRRD59bVv+FlxZx0cbG7t7AvP9SQRNh4+ePt3d2JjY3Dza//4EgsIfNyZaHD362vbcPwLzzw6FG5uPvrtZFJjDI5D2wtd4MD3KUhynYRCY6V2yBDf9Wdwf7bYx0gimPtrfndho+Wl0hJsOf/zH327Y/SIIz1pr8XBIU/jv0YvpL2PX/SEwT1ubzdOhbZ8dpcdqJRIE4efWHN7lpUSX8PRojxHQlzLtvhCiB95es7E3pGX0+dGwJt8kArPb3E2P75zDvec/vxiyUL9ZfIUbB48Oo0BwoZHcnBH+sbvx0/PxW4NNnm629hrCxMQu8Pz5s6dPj49/j1rgnscTRxPH6vgm58etrcYL/5sEV2pTMPw8Rt5kjid7HelpfzaOSbuxFcgcDlU4Md61lRAdKvDFxm50bBchED0aKhEW43evcFjS+k0jtCuowWwej+9WIzDHUCYOlfjjmMpj3KJof2O4won9R+OXdHvA3Ah+4taaSzfUb064P9xf5Ofx+E6jHxI33bTtaHPi4DmkqE+PNp9GhYOJZ/uu5M2Jw/FVePiiOXe7kIo+2iNn4BAmf34O++cxOb6J7u8eT2wejGvAEMix4sHG/r82N4PrjPzr0dFG81zmAOrHsV2H6GBjc1843NztjgcCs7+x634QhIPN6bGcQiJJeDaxsYugiHree/ngp11XV5RIHct4CEYf7k5s7k5PH20c9Tkw3dt1Dy4Oj376adg51TcKuN/uxsTRIYMO9/YGJ2bRw8P0mC5CkDi9t3/oOWA/JxSCP8aS8S3dR+f7V0ihUCijgyzr7shlWV87bI9kgcq5dLXkwhiLomjjcDjZ9y4xjG1ooGFNZDv+nuP6Y8E11PU3trNPzww20Alq38s8tO1w2JbbF1lb8y2Qc3cqxBzLsknc+Wwk4rIaOVlZWck2ItEYlrvv0XFMVTM30OD0IhqVOxqkCkm2h2RSF4lNKZZc9KSwXCEmYlsNmuEEbNXtJMDZ5LMWheu5mn9Jxroa/Tex8CQSTdq4cIfC1PTC3EI21qFQv05evZxVJIKiLE1Fyk5gbFVHT5/NVN0GFaU6c5ZOOn4P4ehcH15ZZAzYWPZ151+nfonkwrg5kVoazGjYQYWFqbnXr5HoDvppfD7ewN6FpJOMTC4pimdAfCGb7jIxqDCqGNJUh0Ici/ypeOoUw5AWJeNVOhxr38Di9Hm1fZ00eJmWU02F6bhkSF1U5nOewilJMhSfiiEpMye5midKiyiScrYdVMgtSFI86iqsr1RMpakwoaWXoRODPMuQKqZh8Ofp+sOBCtMGL022FWI2q0imUZ27yUQijZUFo8JX4o2Y3ZpBnJ6RTImfAw+OXJ1O/qpIvFS9STrNOXzA8/H5Lt4053DK4PnzrMfZq9mquajMCTXUVMhLK3a3wkXzgTuHTB2saiosaBEeLJhfPs0QC/6YVcxFaT6jpwYpnHYV+vsJZifBjOqkytUxICYjbyu8WT2N+WvNcQW+S3vXw7HcxWuFN5VJ1fEUxnnprXWodsJGk/4cmkY6Jtbrddgi9Ny/Z2FwFpDTVli3BihEYmRlZd5TuBWJm6Zxbuk2scDWc5kZieeVG04bRaFeXlF4nm+UHd0d2pyI1SwoqF5hb1MolP9X4Y2zZC3hGcPaWD1VDGUKlVhf4TJ3a7cIwxZoa2xboYZccpymCWCaknU34yEKmZqGL9+4CsXkQmVROS1vFbwlzKU060yR4r/k8oG7+ysUnIgr5zexdR3hQrbKSw+Qt4+lonHTWIputR8g4HLjzVXZsVpzuFzuu+ybClv+zqjXF1Xe/A/CIyhkmI/JP12FOALmzEVxu11ui135MxIbyUux9atpKjexQHzAyXcVE5q4+yWxxJwLSrD1aT9geAr10RQyD5OvK7xypY2kMJaczdzCiIc/wFPOcGdD5vrjpTMwYAQVZhTTnMkFb2dq6UUeTHPXC26AJXNJPdDAcfy49mkKkZ2tgK4wGq5QtVMXb3IaUXhmmNJZvXNPEphSanBy06kwkXwLNjS07gQnBruPcWaT7vGVwS/Op4Php53XfZpCb7zOf7P6Kyx0KMTsxVS6BIYhLWvw5pJQCjS967WHToVYINuMgLvb4AuFX5y5JF1p04YJk4jqONFvXXsKC6MrNPjKudxWqKI2EPHbCjX0e2zL7fH2SonDokFhrI+WFncq1DKVamW50OPRGopDBHF3BDm5DFuz9J8sYuthLBa6OmnOoR6IFmpugEJkr0jES1sKk1q4A+19W2EKh5vDplmzxIKZD4gLa1jszqjvVhheARP+G+65p1B+DW56FSafa+l5CeKRYiycZdKX5Yep2zAb8FJTWn4f08t6kzJ8yg9QqF0uQLhokOe6Ct/+kg0yu8jHkRiwhUHORdXkwYLqy2xGuNS18G09d9fZUIdClaw35UO4p41Vn5R444PrvaxjvVYgKeAXDaU6v3yTSVu/XbduIQrN2eWXy500vDHrUfhxG7zffCBcNxXyZiWY7pFuehQyejgyA4kUzCMkpUuvQObHbaenOuirkCuABypXdk8bVD8Db8p6OQNbUiMvq5WKBOPIL5JOpiI5px0tTJ43AqmpstKhcNFXiArYnp6HqciKSV8hpLrtvBWSXuijj0KmsIUaC9WKAf3zJqSnbvJf40ZTaJie03QpDHcohPjncELmfMGokrQXepGqC9PN1NtTuBRg9iYstBRWkbztURZO4+AZr73sgSg0Xv2eCfD7r30VQhaCk+nG1AwYADJdC5ZReNA0dihkdXBGaYCXLkof2nusfnu7zTKR0z+gE9djKydeluCuw1dMMoC61Z5DfpKUlTcr51NzVbhTecmUGF+htKI/7CSVXOizDj1i+DahMpHs8mwVNndiQiQ8YBYDO805fL7pDodkp1mGBZoJZLbRBL7FsZxw8o5YuliNOALTihZhOUCC8RXyfAXqpgr8UKQKVE+N93nkhrJB8ZB/0F8hoMo4dauj6ZM5AzISM245wxVqEJ6kd3rPWNjRWZOvpnviJMOKGJeFV0ocMjmuzIwQD805f/95d34aeY/9ZHJ41tYfzsbXyQiMBG+cx/pXwYGIjyATjgs9VQhJdvlZ1LsFAUK59B6cmzeY1AgK+cUcBwGEoMPotAPT5yoEUGwLQdSRZnKxvtc7Fcrg+Ga1gbuiy0cZKibpv781k89ctxfXBBgAxZ3iEbI27B9EBdR8kkK1698I8mnenEe9O4irMN2ZeZ9A5r2gdk1iLR1f5JVo081Fp3uOxffgxCMr7OsJn6RQ64l+2znIVeet/iXwVqTjFOMWLYG/fagH8jYtOUmWZ8GtJ9Qaly6kgnmu9h5CRLXDS/9WhWxNRaIctABHQeHMZd94kRRJAeMrtG4bkBHx01pHWy12qpiL8bRbAddv0Tk5lOmUwGqZKm/MJRNfRCGup5eVTPm6s2VZhvy2ch4LHu2qpIkl4vQ81Arnfrkllycr/OKDi5jT3FB15+MJZBuQB5Dsc4vLzEOUXo7WW4k9Gw5Hl8BJvdXb3GlScjfcPSnMXzbixqJyFtU0f8tnsXwYh/0j3RUtsK3hcD0ZIac4BimePZzLZaiUqitW7DZl2/iWi74jgTnrnukyVi26AGmMMX+Wg21as7dTWL5szEumMpncZloKGSvIpRWt3ZNC7nZ6FnK/ykzDKoexJoIVMesUopXyi17ueiQ6PTk5W5BIJbKgplpu7UTPYbcxHvzRiACnczw4cfWk0BwCtWadG+SW+NuVq0gkenHyv1lInJR3773UxMvaZrt5IDijKRx4mtiW6KBlyDFMZX45CxakIyeTMMKSkU12h2stXYXcFiKlqSygWjsACFvc1YxiQvbswRvVuav6tn8ZbemROQNEkRNZw1AMCZLvpQZbQr5CiVzrQkGOfyI8WKGp9Co0pJ6sTa0lM28M8CTXAMM7vJ7LFHryEVBYcU/F32RznRuHwIg4d7Lg3QmJFb+cYQOnPDJORs5nvPIB0i9jdrlhhVtJ+fSbmT4sMa7Cs6WZmUEKL5Zmlm6CCguFV0szf0Z7ooWN1czkrGchqDOW3l2pvV+ugJdmz/+YXDmJqPXrrhBupbRk7uLmfHLy/PQiV8ZdXQgyjrHpRpZcvzlJ5wq3qVYITnHJPrBJlaxDzf3cP2hdu81wcA7rLAt/7FNbPMT6x0hjZWpy8izbmFZ1HO5zpCJiuy6L4jYWuzMEojERxiJcrm9fa+Xe+llg6xjX67JMvtyqd55ksHKiLzHY+FACLsqJ/hVAmdwoxwJjbbnt5T6hRyD5qFYnAuoatgedZFgqq97xzRuCy+odhyAWOYHpf8r8hbCGWEihUCgUCuUL8j3GZEg2dJ2kS6x78oExLuAUpJey2Dw6HUNyBSJIXy9CDcOFSutFO0Tyz1qIIXO4JjMc+f4JrZdSP3hTit0SQ+d6Du6+Rdid0E4pRAqskIXWQYfOaI534rez6qbN6zrDukcMOzLz2Mu8H++4t6494Rg9n2cZ9JWU6rao9as9CFy+uO4JYGCmXLuL65b3BzvvLj8rn3fPtH/wFa5je9WVomsht6ETgrqOvBbFhorFfG1QX6qtibbe/9pfgdVyOVnEj9db1aUuiu1qjX3CiD+4n0JswfsSNB/yKm3RnSFGztdWye+WwlU75BXT+XzIFZPnQiyTJ6I5xkmpoValBB21ym55dQ2LsqVqA/R/NpbIuOPGlUJrXm8IsbJdal0PuXMFPM5rRfK7AFPhjrS87v69ZDEhYn3RZhLuZK6x8pr7oB207u45RQYmc8fzUBjIlqvmRdl/OVN/HCqR6lK2GfteXRlxmuofOOTyoaYulbx66TdZc7yJYFY5BpFtM88xRaIQaU+ITWJIlENFluw9q2ukkrRDNWvNsRDMEIMdTyGzs+NNOPO4XerWCv7RPYKu/SLUZrXh39qPioplVtTapxPcWsh31ULCt2SVc1wnZHYw564rcbXofRMuJhLucJBXeFFzZAALsQiJLCOXSokdMmXyKli/VvS0hFrlOKv7HiqHfmjpVrEmszK++3XZUeEcRrTtvF5qe74dWnUdEKVYv8+8xqyvwz/EvKPJA79kHghCSE/AM9VV14NhWfsUVO+1U3011PGOWEnfsW2RKQ1+k/QTyCPiGhhrYtsrkBNat21bY/zXjxLFHZH5DGW9uDtNvthyf5RiUtDVagh3dC+mMCY6Uf4eelSx9xoXtnGn3yOxhkWx9cL0vUew9gNZLNu4Fjhks1I29mwr3UPHLPY3lu6TJmSNevZE3udufvS2B/LG9+gm9L6FbzVXTL52H8dfxdrwNkPg1nccL7oz3ibFra+Win/5sSSU3sNDmMSa91u96x34IWCReezerq97HuGkmNVh31jfgd7cRJ/cT26TWE+wbEFMoM9/nJNvxpJSwtslHaw+/vx9UEeyWGBZef2+kjd9JyUXIIP5fJ+vleSil6qVvMTAKa31/85iJCw7wRZkvPMXvKoLxMmy/lcSwZoGuQxD/vcMJu8qc2z9yZB77kTV5X4n/F8NtVi0VzGprZxcidQguaID9eE4lIMjAgOeIC6gcjpX4AqkwLc5q8+XYOPKdzRXFAqFQqFQKBQKhUKhUCgUCoVCoVAoFAqFQqFQKBQKhUKhUCgUCoVCoVAoFAqFQqFQKBQK5R74P5IAUqO3pOdXAAAAAElFTkSuQmCC",
      user_id: User.all.sample.id,
      description: "Stylish restaurant and bar located in the trendy Friesen Quarter of Köln, offering a contemporary dining experience with a menu featuring international and Mediterranean-inspired dishes."},


      { name: "PINAR Bäckerei-Konditorei", # Faker::Restaurant.name
        category: "Bakery",
        address: "Fuldaer Str. 7, 51103 Köln",
        img_url: "https://lh3.googleusercontent.com/p/AF1QipOAnCN_hecHgphvGp95wH3ONPoqJsTGH8tSOo91",
        user_id: User.all.sample.id,
        description: "A Turkish bakery and confectionery that offers a variety of freshly baked goods such as bread, cakes, pastries, and savory snacks."},

      { name: "Kamps Bäckerei", # Faker::Restaurant.name
      category: "Bakery",
      address: "Venloer Str. 25, 50672 Köln",
      img_url:
      "https://kamps.de/_Resources/Static/Packages/Elaika.Kamps.Site/images/KAMPS_LOGO_72_RGB.png",
      user_id: User.all.sample.id,
      description: "A well-known German bakery chain that offers a variety of bread, pastries, and cakes." },

      { name: "Bäckerei Zimmermann KG", # Faker::Restaurant.name
      category: "Bakery",
      address: "Ehrenstraße 75, 50672 Köln",
      img_url:
      "https://baeckereizimmermann.de/assets/img/baeckerei-zimmermann-og-logo.jpg",
      user_id: User.all.sample.id,
      description: "A family-owned bakery that has been serving Köln for over 100 years. The bakery specializes in traditional German bread and pastries." },

      { name: "Restaurant Mama Leone", # Faker::Restaurant.name
        category: "Italian Restaurant",
        address: "Buttermarkt 38, 50667 Köln",
        img_url: "https://www.ristorante-mamaleone.de/ristoranteslider/Header1.jpg",
        user_id: User.all.sample.id,
        description: "Italian restaurant decorated in warm brown and red tones with terrace serves typical local cuisine." },

      { name: "Hà Nội 46 Restaurant", # Faker::Restaurant.name
      category: "Vietnamese restaurant",
      address: "Kempener Str. 46, 50733 Köln",
      img_url:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVV1uJnxXzuW_C9heO0wsDTJvKazhEuZTHCA&usqp=CAU",
      user_id: User.all.sample.id,
      description: "We combine traditional recipes with contemporary requirements." },

      { name: "Brauhaus Früh am Dom", # Faker::Restaurant.name
        category: "Brewery/Restaurant",
        address: "Am Hof 12-18, 50667 Köln",
        img_url:
        "https://www.frueh-am-dom.de/typo3conf/ext/wp_fruehdb/Resources/Public/Images/ci/dom/logo/logo_big.png",
        user_id: User.all.sample.id,
        description: "A traditional brewery and restaurant that serves up hearty German food, including sausages, schnitzel, and potato dishes. They also brew their own beer on-site." },

        { name: "Die Fette Kuh", # Faker::Restaurant.name
          category: "Burger Restaurant",
          address: "Bonner Str. 43, 50677 Köln",
          img_url:  "https://www.santosgrills.de/media/70/1a/f8/1662546432/Fette-Kuh_Logomac1u3cSvCX481662546432.jpg",
          user_id: User.all.sample.id,
          description: "A popular burger joint that serves up delicious burgers made with high-quality, locally-sourced ingredients." },

        { name: "Lommerzheim", # Faker::Restaurant.name
        category: "Brewery/Restaurant",
        address: "Siegesstr. 18, 50679 Köln",
        img_url: "https://www.lommerzheim.koeln/wp-content/uploads/2019/11/lommi_header_01.jpg",
        user_id: User.all.sample.id,
        description: "Traditional brewery and restaurant that has been around since 1678. They specialize in Kölsch beer and traditional German cuisine." },

        { name: "Eiscafe Il Gelato", # Faker::Restaurant.name
        category: "Ice Cream Shop",
        address: "Hahnenstr. 2, 50667 Köln",
        img_url: "data:image/jpeg;base64,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",
        user_id: User.all.sample.id,
        description: "Popular ice cream shop that serves up a wide variety of homemade ice cream flavors, as well as sorbet, gelato, and frozen yogurt." },

        { name: "Bunte Burger", # Faker::Restaurant.name
          category: "Vegan Restaurant",
          address: "Venloer Str. 448, 50825 Köln",
          img_url: "https://www.bunteburger.de/wp-content/uploads/2014/03/BunteBurgerLogoBig.png",
          user_id: User.all.sample.id,
          description: "Vegan restaurant that specializes in plant-based burgers made with natural ingredients." },

        { name: "Gaffel Haus Köln", # Faker::Restaurant.name
        category: "Brewery/Restaurant",
        address: "Alter Markt 20, 50667 Köln",
        img_url: "https://media.cylex.de/companies/2601/962/logo/logo.jpg",
        user_id: User.all.sample.id,
        description: "Popular brewery and restaurant that serves up traditional Kölsch beer and German cuisine." },

        { name: "Café Sehnsucht", # Faker::Restaurant.name
          category: "Café/Brunch Restaurant",
          address: "Körnerstr. 67, 50823 Köln",
          img_url: "https://usercontent.one/wp/www.sonahundsofern.com/wp-content/uploads/2016/07/Sehnsucht.jpg",
          user_id: User.all.sample.id,
          description: "A cozy café that serves up breakfast, brunch, and lunch dishes, as well as homemade cakes and pastries." },

          { name: "Takumi Ramen", # Faker::Restaurant.name
            category: "Japanese Restaurant",
            address: "Maastrichter Str. 12, 50672 Köln",
            img_url:
            "https://www.takumiramennoodles.com/wp-content/uploads/2022/01/Takumi-Logo-Meta.jpg",
            user_id: User.all.sample.id,
            description: "Japanese restaurant that specializes in ramen noodles, as well as other Japanese dishes like gyoza and donburi." },

            { name: "Frittenwerk", # Faker::Restaurant.name
              category: "Fast Food Restaurant",
              address: "Venloer Str. 338, 50823 Köln",
              img_url: "data:image/png;base64,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",
              user_id: User.all.sample.id,
              description: "Fast food restaurant that serves up Belgian-style fries, as well as burgers, hot dogs, and salads." },

              { name: "Cafe Buur", # Faker::Restaurant.name
                category: "Café/Breakfast Restaurant",
                address: "Venloer Str. 338, 50823 Köln",
                img_url: "data:image/png;base64,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",
                user_id: User.all.sample.id,
                description: "A trendy café that serves up breakfast, lunch, and coffee drinks, as well as cocktails in the evening. They also have a small outdoor terrace." }
    ]
  )

  puts "#{Shop.last.name} created..."

  dates = [(DateTime.now + 1.year), (DateTime.now + 2.years), (DateTime.now + 5.month), (DateTime.now + 9.months), (DateTime.now + 18.months), (DateTime.now + 3.months)]

  StampCardTemplate.create!(
    [
    { title: "Free beer on us", description: "Buy 10 beers and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Brauhaus Früh am Dom") },
    { title: "Burger for free", description: "Buy 10 burgers and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Die Fette Kuh") },
    { title: "Free Kölsch beer", description: "Buy 10 Kölsch beers and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Lommerzheim") },
    { title: "Free ice cream cone", description: "Buy 10 ice cream cones and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Eiscafe Il Gelato") },
    { title: "Vegan burger for free", description: "Buy 10 vegan burgers and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Bunte Burger") },
    { title: "Free beer on the house", description: "Buy 10 beers and get one free in our beer garden!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Gaffel Haus Köln") },
    { title: "Free coffee on us", description: "Buy 10 coffees and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Café Sehnsucht") },
    { title: "Free ramen bowl", description: "Buy 10 ramen bowls and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Takumi Ramen") },
    { title: "Free fries on the house", description: "Buy 10 orders of fries and get one free!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Frittenwerk") },
    { title: "Free coffee delight", description: "Get every 11th coffee on the house!", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Cafe Buur") },
      { title: "15% off your bill", description: "Enjoy 10% off your total bill at Joseph's Restaurant & Bar", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Joseph's Restaurant & Bar") },
      { title: "Free coffee and pastry", description: "Get a free coffee and pastry of your choice after every 10 purchases at PINAR Bäckerei-Konditorei", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "PINAR Bäckerei-Konditorei") },
      { title: "Buy 10 breads, get 1 free", description: "Buy 10 breads and get the 11th one of equal or lesser value for free at Kamps Bäckerei", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Kamps Bäckerei") },
      { title: "Every 10th coffee on the house", description: "Get a free coffee of your choice after every 10 purchases at Bäckerei Zimmermann KG", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Bäckerei Zimmermann KG") },
      { title: "Free dessert with purchase", description: "Get a free dessert of your choice after every 10 purchases of a main course at Restaurant Mama Leone", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Restaurant Mama Leone") },
      { title: "10% off your order", description: "Enjoy 10% off your total order at Hà Nội 46 Restaurant", max_stamps: 10, expiration_date: dates.sample, shop: Shop.find_by(name: "Hà Nội 46 Restaurant") }
      ]
      )
puts "Created StampCard-Template for each shop..."

# seed_stamp_card = StampCard.create!(stamp_amount: 6, user_id: User.all.sample.id, stamp_card_template_id: StampCardTemplate.all.sample.id)
# puts "Created StampCard for #{seed_stamp_card.user.username} of #{seed_stamp_card.stamp_card_template.shop.name}"
