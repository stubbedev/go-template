{self, ...}: {
  perSystem = {
    lib,
    pkgs,
    ...
  }: {
    packages.default = pkgs.buildGo127Module {
      pname = "go-template";
      version = "0-unstable-${self.lastModifiedDate or "0"}";

      src = lib.fileset.toSource {
        root = ../.;
        fileset = lib.fileset.difference (lib.fileset.gitTracked ../.) (
          lib.fileset.unions [
            ../flake.nix
            ../flake.lock
            ../nix
          ]
        );
      };

      vendorHash = null;

      env.CGO_ENABLED = 0;

      doCheck = true;

      meta = {
        description = "Starting point for new Go projects";
        homepage = "https://github.com/stubbedev/go-template";
        license = lib.licenses.mit;
        mainProgram = "go-template";
        platforms = lib.platforms.unix;
      };
    };
  };
}
