$dirs = @(
  "lib/core/routing",
  "lib/core/theme",
  "lib/features/home/presentation/pages",
  "lib/features/home/presentation/bloc",
  "lib/features/home/domain/use_cases",
  "lib/features/home/domain/repositories",
  "lib/features/home/data/repositories",
  "lib/features/home/data/models",
  "lib/features/home/data/data_sources",
  "lib/features/wishlist/presentation/pages",
  "lib/features/wishlist/presentation/bloc",
  "lib/features/cart/presentation/pages",
  "lib/features/cart/presentation/bloc",
  "lib/features/profile/presentation/pages",
  "lib/features/profile/presentation/bloc"
)

foreach ($d in $dirs) {
  New-Item -ItemType Directory -Force -Path $d
}
