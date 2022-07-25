#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

teapot_version "3.0"

define_project "vulkan-linux" do |project|
	project.add_author "Samuel Williams"
	project.license = " Apache License, Version 2.0 / MIT License"

	project.version = "1.3.216"
end

define_target 'vulkan-linux-library' do |target|
	target.provides 'Library/Vulkan/Linux' do
		# append header_search_paths(target.package.path + "source")		
		append linkflags "-lvulkan"
	end

	target.provides :vulkan_library => 'Library/Vulkan/Linux'
end

define_target 'vulkan-linux-platform-xcb' do |target|
	target.depends 'Library/Vulkan/Linux', public: true
	
	target.provides 'Platform/Vulkan/Linux/XCB' do
		append buildflags "-DVK_USE_PLATFORM_XCB_KHR"
		append linkflags "-lxcb"
	end
	
	target.provides :vulkan_platform => 'Platform/Vulkan/Linux/XCB'
end
