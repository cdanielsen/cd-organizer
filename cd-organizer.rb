require './lib/cd'
require './lib/artist'

def main_menu
	system 'clear'
	image
	puts "Welcome to the l0W tE<# CD Organizer!\n\n"
	puts "A  << Add a CD"
	puts "L  << List all your CD's"
	puts "N  << List all the artists in your collection"
	puts "SA << List all albums by an artist"
	puts "ST << Search for a matching album title"
	puts "X  << Exit!"
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

def add
	puts "What's the artist name?"
	name = gets.chomp.downcase
	puts "What's the album title?"
	album = gets.chomp.downcase
	new_cd = Cd.new({album: album})
	new_cd.save
	new_artist = Artist.new({name: name})
	index = Artist.all.index { |artist| artist.name == name }
	if index != nil
		Artist.all[index].add_album(new_cd)
	else
		new_artist.save
		new_artist.add_album(new_cd)
	end
	puts "\n\n#{album} by #{name} saved to the catalog!\n\n"
	puts "Add another? (Y/N)"
	case gets.chomp.upcase
	when 'Y'
		add
	when 'N'
		main_menu
	else
		trippin
	end
end

def all_cds
	puts "Here are all the CD's in your collection:\n\n"
	Cd.all.each { |cd| puts "#{cd.album}" }
	puts ""
	gets
	main_menu
end

def all_artists
	puts "Here are all the artists in your collection\n\n"
	Artist.all.each { |artist| puts "#{artist.name}" }
	puts ""
	gets
	main_menu
end

def artist_search
	puts "What artist would you like to see albums for?"
	name = gets.chomp.downcase
	index = Artist.all.index { |artist| artist.name == name }
	if index == nil
		puts "Artist not found, bro!"
	else
		puts "Here are all the albums by that artist:\n\n"
		Artist.all[index].albums.each_with_index { |cd, i| puts "#{i + 1}. #{cd.album}"}
	end
	gets
	main_menu
end

def album_search
	puts "What album would you like to look for?"
	album = gets.chomp.downcase
	results = Cd.search_by_title(album)
	if results != []
		puts "The following albums match your search:\n\n"
		results.each_with_index { |result, index| puts "#{index + 1}. #{result.album}"}
	else
		puts "Album not found, bro!"
	end
	gets
	main_menu
end

def trippin
	puts "You're trippin'..."
	sleep 3
	main_menu
end

def image
	puts"\n\n"
	puts"               .,-:;//;:=,
          . :H@@@MM@MH/.,+#%;,
       ,/X+ +M@@M@MM%=,-%HMMM@X/,
     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-
    ;@M@@M- XM@X;. -+XXXXXHHH@M@M@/.
  ,%MM@@MH ,@%=             .---=-=:=,.
  =@@@@MX.,                -%HX$$%%%:;
 =-./@M@M$                   .;@MMMM@MM:
 X@/ -$MM/                    . +MM@@@M$
,@M@H: :@:                    . =X@@@@-
,@@@MMX,#.                    /H- ;@M@M=
.H@@@@M@+,                    %MM+..%#$.
 /MMMM@MMH/.                  XM@MH; =;
  /%+%$XHH@$=              , .H@@@@MX,
   .=--------.           -%H.,@@@@@MX,
   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.
     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=
       =%@M@M@$-.=$@MM@@@M; %M%=
         ,:+$+-,/H#MMMMMMM@= =,
               =++%%%%+/:-.\n\n\n"
end

main_menu