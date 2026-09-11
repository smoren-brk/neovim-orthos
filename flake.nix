{
  description = "orthos neovim configuration";

  outputs = { self }:
    {
      lib.luaPackage = builtins.path {
        path = ./.;
        name = "orthos";
      };
    };
}
