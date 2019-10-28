
import MediaPlayer

extension MPMediaItem {
    static func fetchLatestMediaItem() -> MPMediaItem? {
        let query = MPMediaQuery.songs()
        query.addFilterPredicate(MPMediaPropertyPredicate(value: true, forProperty: MPMediaItemPropertyIsCloudItem))
        return query.items?
            .filter { $0.lastPlayedDate != nil }
            .sorted { $0.lastPlayedDate! > $1.lastPlayedDate! }
            .first
    }
}
