import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Date selector widget - displays a horizontal week view with selectable dates
class DateSelector extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final dateItems = _generateDateItems(selectedDate);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Month and Year header
            Text(
              DateFormat('MMMM yyyy').format(selectedDate),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            // Date buttons (horizontal scroll)
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: dateItems.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final dateItem = dateItems[index];
                  return _DateButton(
                    dateItem: dateItem,
                    onSelected: () => onDateSelected(dateItem.date),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<_DateItem> _generateDateItems(DateTime selectedDate) {
    final items = <_DateItem>[];
    final startDate = selectedDate.subtract(const Duration(days: 4));

    for (int i = 0; i <= 8; i++) {
      final date = startDate.add(Duration(days: i));
      final dayName = DateFormat('EEE').format(date).toUpperCase();

      items.add(
        _DateItem(
          date: date,
          dayName: dayName,
          isSelected: _isSameDay(date, selectedDate),
        ),
      );
    }

    return items;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

class _DateButton extends StatelessWidget {
  final _DateItem dateItem;
  final VoidCallback onSelected;

  const _DateButton({
    required this.dateItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = dateItem.isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.surface;
    final textColor = dateItem.isSelected
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurface;

    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 48,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dateItem.dayName,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    dateItem.isSelected ? FontWeight.bold : FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              dateItem.date.day.toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: textColor.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateItem {
  final DateTime date;
  final String dayName;
  final bool isSelected;

  _DateItem({
    required this.date,
    required this.dayName,
    required this.isSelected,
  });
}
