{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "n4cr4";
        email = "n4cr4.dev@gmail.com";
      };
      init.defaultBranch = "main";
      core = {
        editor = "nvim";
        quotepath = false;
      };
      pull.rebase = true;
      fetch.prune = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
