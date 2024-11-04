Just a light weight config for Neovim based on ThePrimeagen's setup.(https://www.youtube.com/watch?v=w7i4amO_zaE&t=274s)

Installation:
Git Clone the project and rename the folder to Nvim and place the folder where Neovim will look for the config files. You can find this location by opening Neovim and typing :h rtp. 

Once that's done clone packer into the nvim folder: git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

After that go into lua/og/packer.lua and shout out the file and run packer sync. 

You may need to shout out all the other lua files in the after folder. I also suggest installing and including your own LSP’s in the lsp.lua by editing line 17 and using :Mason. 

After that everything should be working, just restart neovim. (at anytime you lose the color scheme do :lua CollorMyPenCils() )
