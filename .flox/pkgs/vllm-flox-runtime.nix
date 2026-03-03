{ stdenv, lib }:

stdenv.mkDerivation {
  pname = "vllm-flox-runtime";
  version = "0.1.0";

  src = ../../scripts;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    for script in vllm-serve vllm-preflight vllm-resolve-model; do
      install -m 0755 "$script" "$out/bin/$script"
    done
  '';

  meta = with lib; {
    description = "Runtime scripts for vLLM model serving with Flox";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
