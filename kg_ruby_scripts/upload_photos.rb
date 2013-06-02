#!/usr/bin/env ruby

def get_dir_name(param_path)
	if param_path == nil
		dir_path = Dir.pwd
		puts "Going to run the script on whole of the current directory. You sure? Enter yes to continue"
		puts "The Directory is #{dir_path} "
		answer = gets.chomp
		exit if answer != "yes"
	else
		# check if provided parameter exists
		if File.exists?(param_path)
			# check if provided parameter is a directory
			if File.directory?(param_path)
				@is_dir = true
				dir_path = param_path
			else
				@is_dir = false
				dir_path = File.dirname(param_path)
			end
		else
			puts "Path or file doesn't exist. Boo! check again."
			exit 
		end
	end
	dir_path	
end


def construct_album_name(dir_path)
	album_name = File.basename(dir_path)
	album_name = "#{$3} #{$1} #{$2}" if album_name.strip =~ /^(\d\d\d\d)-(\d\d)_(.*)/
end

# [google command line interface](http://code.google.com/p/googlecl/wiki/Manual)
def upload_to_picasa(dir_path)
	puts "Picasa is free for images that are 2048 sized images"
	print "Shall I reduce all pics to 2048 (note that these will permanently downsize image resolution). Enter \"yes\" or \"exit\" ?"
	img_downsize_choice = STDIN.gets.chomp()
	exit if img_downsize_choice == "exit"

	if @is_dir
		system("sips -Z 2048 \"#{dir_path}\"/*") if img_downsize_choice == "yes"
		album_name = construct_album_name(dir_path)
		# puts "command is "+"google picasa create --title \"#{album_name}\" \"#{dir_path}\"/*"
		system("google picasa create --title \"#{album_name}\" \"#{dir_path}\"/*")
	else
		system("sips -Z 2048 \"#{album_name}\" \"#{dir_path}/#{@filename}\"") if img_downsize_choice == "yes"
		
		print "Enter a specific album name (Default is Miscellaneous):"
		album_name = STDIN.gets.chomp()
		album_name = "Miscellaneous" if album_name.nil? || album_name==""
		# puts "google picasa post --title \"#{album_name}\" \"#{dir_path}/#{@filename}\""
		system("google picasa post --title \"#{album_name}\" \"#{dir_path}/#{@filename}\"")
	end
end

# facebook command line usage [fbcmd](http://fbcmd.dtompkins.com/commands)
def upload_to_facebook(dir_path)
	if @is_dir
		album_name = construct_album_name(dir_path)
		
		# create the album alone
		# fbcmd ADDALBUM "Jamaica 2009" "My Trip To Jamaica" "Jamaica" "friends-of-friends"
		# puts "album name so far is #{album_name} "
		system("fbcmd ADDALBUM \"#{album_name}\"")

		# fbcmd ADDPICD c:\photos\jamaica 1		
		system("fbcmd ADDPICD \"#{dir_path}\" latest")	

		# # Doing it the manual way
		# 		# iterate through all files
		# 		Dir.glob(dir_path + "/*").sort.each do |f|
		# 	    filename = File.basename(f)
		# 	    # File.rename(f, filename.capitalize + File.extname(f))
		# 			# fbcmd ADDPIC myfile.jpg latest "This is me at the airport"
		# 	    # puts "file name is #{dir_path}\\#{filename}"
		# 	    puts "#{filename} didn't upload sucessfully" unless system( "fbcmd ADDPIC \"#{dir_path}/#{filename}\" latest" )
		# 		end
	else
		puts "sorry can't upload single facebook photos at the moment."
	end
end


#################
# Begin program
#################

@is_dir = false
param_path = ARGV[0]
dir_path = get_dir_name(param_path)
@filename = File.basename(param_path)

# get user choice
print "Do you want to upload to Picasa(p) or Facebook (f) or Both(b)?: "
param_choice = STDIN.gets.chomp()
exit if (param_choice != "f" && param_choice!= "p" && param_choice!= "b")


upload_to_facebook(dir_path) if param_choice == "f"
upload_to_picasa(dir_path) if param_choice == "p"



#################
# Facebook commands
#################

# show all album information
# fbcmd ALBUMS "=me"