require "merged"

# directory inside /app/assets/images where the images are kept
Merged.images_dir = "merged"

# directory where data and styles are kept
# Notice that the data is ALWAYS inside a merged directory,
# so in the default case Rails.root/merged/*.yml
Merged.data_dir = "."
