import 'package:flutter_test/flutter_test.dart';
import 'package:ft_intra/core/models/slot.dart';
import 'package:ft_intra/features/evaluations/slot_block.dart';

FtSlot slot(int id, String begin, String end, {Object? scaleTeam}) => FtSlot(
      id: id,
      beginAt: begin,
      endAt: end,
      scaleTeam: scaleTeam,
    );

Map<String, dynamic> bookedBy(String login) => {
      'correcteds': [
        {'login': login}
      ],
    };

void main() {
  group('mergeSlots', () {
    test('coalesces adjacent available slots into one block', () {
      final blocks = mergeSlots([
        slot(1, '2026-06-10T08:15:00.000Z', '2026-06-10T08:30:00.000Z'),
        slot(2, '2026-06-10T08:30:00.000Z', '2026-06-10T08:45:00.000Z'),
        slot(3, '2026-06-10T08:45:00.000Z', '2026-06-10T09:00:00.000Z'),
      ]);

      expect(blocks, hasLength(1));
      expect(blocks.first.begin,
          DateTime.parse('2026-06-10T08:15:00.000Z').toLocal());
      expect(blocks.first.end,
          DateTime.parse('2026-06-10T09:00:00.000Z').toLocal());
      expect(blocks.first.booked, isFalse);
    });

    test('does not merge across a time gap', () {
      final blocks = mergeSlots([
        slot(1, '2026-06-10T08:15:00.000Z', '2026-06-10T08:30:00.000Z'),
        slot(2, '2026-06-10T09:00:00.000Z', '2026-06-10T09:15:00.000Z'),
      ]);

      expect(blocks, hasLength(2));
    });

    test('does not merge available with booked', () {
      final blocks = mergeSlots([
        slot(1, '2026-06-10T08:15:00.000Z', '2026-06-10T08:30:00.000Z'),
        slot(2, '2026-06-10T08:30:00.000Z', '2026-06-10T08:45:00.000Z',
            scaleTeam: bookedBy('alice')),
      ]);

      expect(blocks, hasLength(2));
      expect(blocks[0].booked, isFalse);
      expect(blocks[1].booked, isTrue);
      expect(blocks[1].bookedBy, 'alice');
    });

    test('merges adjacent slots booked by the same person', () {
      final blocks = mergeSlots([
        slot(1, '2026-06-10T08:15:00.000Z', '2026-06-10T08:30:00.000Z',
            scaleTeam: bookedBy('alice')),
        slot(2, '2026-06-10T08:30:00.000Z', '2026-06-10T08:45:00.000Z',
            scaleTeam: bookedBy('alice')),
      ]);

      expect(blocks, hasLength(1));
      expect(blocks.first.bookedBy, 'alice');
    });

    test('does not merge slots booked by different people', () {
      final blocks = mergeSlots([
        slot(1, '2026-06-10T08:15:00.000Z', '2026-06-10T08:30:00.000Z',
            scaleTeam: bookedBy('alice')),
        slot(2, '2026-06-10T08:30:00.000Z', '2026-06-10T08:45:00.000Z',
            scaleTeam: bookedBy('bob')),
      ]);

      expect(blocks, hasLength(2));
    });

    test('sorts unordered input before merging', () {
      final blocks = mergeSlots([
        slot(3, '2026-06-10T08:45:00.000Z', '2026-06-10T09:00:00.000Z'),
        slot(1, '2026-06-10T08:15:00.000Z', '2026-06-10T08:30:00.000Z'),
        slot(2, '2026-06-10T08:30:00.000Z', '2026-06-10T08:45:00.000Z'),
      ]);

      expect(blocks, hasLength(1));
    });

    test('skips slots with unparseable timestamps', () {
      final blocks = mergeSlots([
        slot(1, 'not-a-date', 'also-bad'),
        slot(2, '2026-06-10T08:30:00.000Z', '2026-06-10T08:45:00.000Z'),
      ]);

      expect(blocks, hasLength(1));
    });

    test('returns empty list for empty input', () {
      expect(mergeSlots([]), isEmpty);
    });
  });
}
