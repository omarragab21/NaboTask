import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalItems;
  final int itemsPerPage;
  final Function(int) onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalItems,
    this.itemsPerPage = 10,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final totalPages = (totalItems / itemsPerPage).ceil();
    final startItem = ((currentPage - 1) * itemsPerPage) + 1;
    final endItem = currentPage * itemsPerPage > totalItems
        ? totalItems
        : currentPage * itemsPerPage;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Showing $startItem to $endItem of $totalItems results',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            children: [
              // Previous button
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey.withOpacity(.5),
                  )),
                  child: const Icon(Icons.chevron_left),
                ),
              ),

              // First page
              _buildPageButton(1, currentPage, onPageChanged, context),

              // Second page
              if (currentPage <= 3)
                _buildPageButton(2, currentPage, onPageChanged, context),

              // Third page
              if (currentPage <= 3)
                _buildPageButton(3, currentPage, onPageChanged, context),

              // Ellipsis
              if (currentPage > 4) const Text('...'),

              // Current page minus 1
              if (currentPage > 3 && currentPage < totalPages - 2)
                _buildPageButton(
                    currentPage - 1, currentPage, onPageChanged, context),

              // Current page
              if (currentPage > 3 && currentPage < totalPages - 1)
                _buildPageButton(
                    currentPage, currentPage, onPageChanged, context),

              // Current page plus 1
              if (currentPage > 3 && currentPage < totalPages - 2)
                _buildPageButton(
                    currentPage + 1, currentPage, onPageChanged, context),

              // Ellipsis
              if (currentPage < totalPages - 3) const Text('...'),

              // Last three pages
              if (currentPage >= totalPages - 2 && totalPages > 3)
                _buildPageButton(
                    totalPages - 2, currentPage, onPageChanged, context),

              // Next button
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey.withOpacity(.5),
                  )),
                  child: const Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageButton(int page, int currentPage,
      Function(int) onPageChanged, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: page != currentPage ? () => onPageChanged(page) : null,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey.withOpacity(.5),
        )),
        child: Text(
          page.toString(),
          style: TextStyle(
            fontWeight:
                page == currentPage ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
