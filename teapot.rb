#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

define_target "vulkan-library" do |target|
	target.depends "SDK/Vulkan", public: true
	
	target.provides "Library/vulkan" do
		append linkflags "-lvulkan"
	end
end

define_target 'vulkan-platform-xcb' do |target|
	target.provides 'Vulkan/Platform/XCB' do
		append buildflags "-DVK_USE_PLATFORM_XCB_KHR"
		append linkflags "-lxcb"
	end
	
	target.provides :vulkan_platform => 'Vulkan/Platform/XCB'
end
