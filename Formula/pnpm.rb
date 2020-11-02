class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.10.4.tgz"
  sha256 "9e4774b1f1baec04917b83b9400c1ffea25ed3ffed4ce1b80d5b2e065722cbc8"
  license "MIT"

  livecheck do
    url :stable
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "20949a0aec634511aa715b87d6b46a2fb1447278536910fe0ad382650050606c" => :catalina
    sha256 "687be0317560e4a1b634ec34a2c74b9a673387226314d23f12949c04b7a610e2" => :mojave
    sha256 "90b4c9aadc2260088777bb86521db1c3e74a2e7f9459e744124d2b51868eee7a" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
