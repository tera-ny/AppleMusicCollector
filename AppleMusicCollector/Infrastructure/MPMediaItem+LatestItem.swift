
import MediaPlayer

extension MPMediaItem {
    static func fetchLastPlayedMediaItem() -> MPMediaItem? {
        return MPMediaQuery.songs().items?
            .filter { $0.lastPlayedDate != nil }
            .filter { !$0.playbackStoreID.isEmpty }
            .sorted { $0.lastPlayedDate! > $1.lastPlayedDate! }
            .first
    }
}
