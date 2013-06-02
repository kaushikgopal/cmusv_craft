#!/usr/bin/env ruby


# this file = File.dirname(__FILE__)
# script_name = File.dirname(__FILE__)+"/"+File.basename(__FILE__)
# param_path = "/Users/kaush/Dropbox/photos_db/2013/2013-03_LA_trip/2013-03-03_Hollywood_WalkOfFame_IMG_1549.JPG"
# is_dir = true

param_path = ARGV[0]
is_dir = false

# get the directory name
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
			is_dir = true
			dir_path = param_path
		else
			is_dir = false
			dir_path = File.dirname(param_path)
		end
	else
		"Path or file doesn't exist. Boo! check again."
		exit 
	end
end


if is_dir
	# Construct the Album name
	album_name = File.basename(dir_path)
	album_name = "#{$3} #{$1} #{$2}" if album_name.strip =~ /^(\d\d\d\d)-(\d\d)_(.*)/
	# facebook command line usage [fbcmd](http://fbcmd.dtompkins.com/commands)
	# create the album alone
	# fbcmd ADDALBUM "Jamaica 2009" "My Trip To Jamaica" "Jamaica" "friends-of-friends"
	# puts "album name so far is #{album_name} "
	# system( "fbcmd ADDALBUM \"#{album_name}\"" )

	# iterate through all files
	Dir.glob(dir_path + "/*").sort.each do |f|
	    filename = File.basename(f)
	    # File.rename(f, filename.capitalize + File.extname(f))
			# fbcmd ADDPIC myfile.jpg latest "This is me at the airport"
	    # puts "file name is #{dir_path}\\#{filename}"
	    puts "#{filename} didn't upload sucessfully" unless system( "fbcmd ADDPIC \"#{dir_path}/#{filename}\" latest" )
	end
end


	
# 	# If not a directory, get directory name
# 	if !(File.directory?(param_path))
# 		dir_path = File.dirname(param_path)
# 	end



# # folder_path = "."

# # if File.dirname(__FILE__)
# # 	folder_path = File.dirname(__FILE__)
# # end


# # puts " folder path is #{folder_path}"


# # ARGV.each do|a|
# #   puts "Argument: #{a}"
# # end


# # ARGV.each do|a|
# #   puts "Argument: #{a}"
# # end

