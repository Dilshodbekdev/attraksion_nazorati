class ArticlesBody {
  int? page;
  int? pageSize=10;

  ArticlesBody({this.page, this.pageSize});

  ArticlesBody copyWith({
    int? page,
    int? pageSize,
  }) =>
      ArticlesBody(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
      );
}
