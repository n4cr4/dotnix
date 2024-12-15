{
  programs.git = {
    enable = true;
    userName = "n4cr4";
    userEmail = "n4cr4.dev@gmail.com";

    delta.enable = true;

    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "nvim";
        quotepath = false;

      };
      pull.rebase = true;
      fetch.prune = true;
    };
  };
}
