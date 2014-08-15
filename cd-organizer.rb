require './lib/cd'

def main_menu
	system 'clear'
	image
	puts "Welcome to the Low Tech CD Organizer!\n\n"
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

def add
	puts "What's the artist name?"
	artist = gets.chomp
	puts "What's the album title?"
	album = gets.chomp
	new_cd = Cd.new({album: album, artist: artist})
	new_cd.save
	puts "#{album} by #{artist} saved to the catalog!"
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