import 'package:ft_intra/core/models/slot.dart';

/// A contiguous run of 42 slots merged into one availability block.
///
/// 42 stores availability as granular (typically 15-min) `Slot` records.
/// Adjacent records with the same booking state belong to the same real-world
/// availability window, so we coalesce them for display.
class SlotBlock {
  final DateTime begin;
  final DateTime end;
  final bool booked;
  final String? bookedBy;

  const SlotBlock({
    required this.begin,
    required this.end,
    required this.booked,
    this.bookedBy,
  });
}

/// Who booked a slot. When someone books your availability you become the
/// corrector and they the corrected, so the booker is in `scale_team.correcteds`.
String? bookerLogin(FtSlot slot) {
  final st = slot.scaleTeam;
  if (st is Map<String, dynamic>) {
    final correcteds = st['correcteds'];
    if (correcteds is List && correcteds.isNotEmpty) {
      final first = correcteds.first;
      if (first is Map<String, dynamic>) return first['login'] as String?;
    }
  }
  return null;
}

/// Coalesce adjacent slots into [SlotBlock]s.
///
/// Two slots merge when the earlier one's end equals the later one's begin and
/// they share the same booking state (both available, or both booked by the
/// same login). Unparseable timestamps are skipped.
List<SlotBlock> mergeSlots(List<FtSlot> slots) {
  final parsed = <_ParsedSlot>[];
  for (final s in slots) {
    final begin = DateTime.tryParse(s.beginAt)?.toLocal();
    final end = DateTime.tryParse(s.endAt)?.toLocal();
    if (begin == null || end == null) continue;
    final booked = s.scaleTeam != null;
    parsed.add(_ParsedSlot(begin, end, booked, booked ? bookerLogin(s) : null));
  }
  parsed.sort((a, b) => a.begin.compareTo(b.begin));

  final blocks = <SlotBlock>[];
  _ParsedSlot? cur;
  DateTime? curEnd;
  for (final p in parsed) {
    final extends_ = cur != null &&
        curEnd!.isAtSameMomentAs(p.begin) &&
        cur.booked == p.booked &&
        cur.bookedBy == p.bookedBy;
    if (extends_) {
      curEnd = p.end;
    } else {
      if (cur != null) {
        blocks.add(SlotBlock(
            begin: cur.begin,
            end: curEnd!,
            booked: cur.booked,
            bookedBy: cur.bookedBy));
      }
      cur = p;
      curEnd = p.end;
    }
  }
  if (cur != null) {
    blocks.add(SlotBlock(
        begin: cur.begin,
        end: curEnd!,
        booked: cur.booked,
        bookedBy: cur.bookedBy));
  }
  return blocks;
}

class _ParsedSlot {
  final DateTime begin;
  final DateTime end;
  final bool booked;
  final String? bookedBy;
  _ParsedSlot(this.begin, this.end, this.booked, this.bookedBy);
}
