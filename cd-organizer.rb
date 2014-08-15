require './lib/cd'

def main_menu
	system 'clear'
	puts "Welcome to the Low Tech CD Organizer!\n"
	puts "A << Add a CD"
	puts "L << List all your CD's"
	puts "N << List all the artists in your collection"
	puts "SA << Search for all albums by an artist"
	puts "ST << Search for a matching album title"
	puts "X << Exit!"
	case gets.chomp.upcase
	when 'A'
		add
	when 'L'
		all_cds
	when 'N'
		all_artists
	when 'SA'
		artist_search
	when 'ST'
		album_search
	when 'X'
		puts 'See-ya!'
		sleep 2
	else
		trippin
	end
end

main_menu
		