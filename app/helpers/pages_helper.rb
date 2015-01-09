module PagesHelper

	def meta_description
		"Welcome to the Golden Dragon Restaurant. Our mission is to serve 
		you with excellent quality of Szechwan and Cantonese cuisine."
	end

	def welcome_message
		a = content_tag :p do
			"Welcome to the Golden Dragon Restaurant. Our mission is to serve 
			you with excellent quality of Szechwan and Cantonese cuisine."
		end
		b = content_tag :p do
			"Golden Dragon was established in 1981 by the Ng family, who 
			immigrated from China in the 1960s. Our friendly neighborhood 
			restaurant has been family ran since the very beginning. At Golden 
			Dragon, your food is specially prepared by family chefs who have 
			mastered recipes that have been passed down to them through the 
			generations. All of our ingredients are procured fresh daily, and 
			your meals are cooked after ordering. Preparing genuine Szechwan 
			and Mandarin cuisine is an art and we take great pride in our 
			family recipes."
		end
		c = content_tag :p do
			"We are all family here and so are you. With over 100 unique 
			dishes to choose from, come in and enjoy a casual, authentic, 
			and mouth watering dining experience. We are located on 1350 E 
			Vista Way Ste 10, Vista CA 92084 between Foothill Dr & Monte 
			Mar Rd."
		end
		a + b + c
	end

	def weekdays
		['Sunday', 'Monday', 'Tuesday', 'Wednesday', 
			'Thursday', 'Friday', 'Saturday']
	end

	def categories
		['Combination Dinner', 'Appetizers', 'Soup', 'Seafood', 'Beef', 
			'Pork', 'Poultry', 'Vegetable', 'Chop Suey', 'Lo/Chow Mein', 
			'Egg Foo Young', 'Fried Rice', 'Children\'s Combo Dinner', 
			'Tapioca Drinks', 'Party Tray']
	end

	def items
		[['Cream Cheese Won Ton', 5.75], ['Egg Roll', 5.65], 
		['Fried Won Ton', 5.45], ['Stir Fried Scallops', 8.95]]
	end
end