
import MediaPlayer

extension MPMediaItem {
    static func fetchLastPlayedMediaItem() -> Audio? {
        return MPMediaQuery.songs().items?
            .filter { $0.lastPlayedDate != nil }
            .filter { !$0.playbackStoreID.isEmpty }
            .sorted { $0.lastPlayedDate! > $1.lastPlayedDate! }
            .first?
            .audio
    }
}

extension MPMediaItem {
    var audio: Audio {
        return Audio(storeID: self.playbackStoreID, title: self.title ?? "unknown", artist: self.artist ?? "unknown")
    }
}
