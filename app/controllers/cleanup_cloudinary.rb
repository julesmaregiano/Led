class CleanupCloudinary
  @@public_ids = []

  def self.add_public_ids
    Attachinary::File.all.each do |image|
      @@public_ids << image.public_id

      clean if @@public_ids.count == 100
    end
  end

  def self.clean
    Attachinary::File.all.each do |image|
      @@public_ids << image.public_id

      clean if @@public_ids.count == 100
    end

    Cloudinary::Api.delete_resources(@@public_ids) if @@public_ids.count > 0

    @@public_ids = []
  end
end
