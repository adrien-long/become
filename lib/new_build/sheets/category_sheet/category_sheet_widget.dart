import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_build/main_new/component/category_button/category_button_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'category_sheet_model.dart';
export 'category_sheet_model.dart';

class CategorySheetWidget extends StatefulWidget {
  const CategorySheetWidget({super.key});

  @override
  State<CategorySheetWidget> createState() => _CategorySheetWidgetState();
}

class _CategorySheetWidgetState extends State<CategorySheetWidget> {
  late CategorySheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategorySheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(),
                    ),
                    Container(
                      width: 40.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFC9C9C9),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.check_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ot7oyfqj' /* Choose what you need the most ... */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Grift',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '5frv054p' /* You can choose one category or... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Grift',
                              color: FlutterFlowTheme.of(context).tertiary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final categoriesList = FFAppState().Categories.toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(categoriesList.length,
                                (categoriesListIndex) {
                          final categoriesListItem =
                              categoriesList[categoriesListIndex];
                          return wrapWithModel(
                            model: _model.categoryButtonModels.getModel(
                              categoriesListIndex.toString(),
                              categoriesListIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: CategoryButtonWidget(
                              key: Key(
                                'Key49q_${categoriesListIndex.toString()}',
                              ),
                              isSelected: FFAppState()
                                  .selectedCategories
                                  .contains(categoriesListItem),
                              title: categoriesListItem.title,
                              textSize: 20,
                              emodji: categoriesListItem.emoji,
                              isLock: (categoriesListItem.isPay == true) &&
                                  (revenue_cat.activeEntitlementIds.length ==
                                      0),
                              subtitle: categoriesListItem.subtitle,
                              isPay: categoriesListItem.isPay,
                              onSelect: () async {
                                if (FFAppState()
                                    .selectedCategories
                                    .contains(categoriesListItem)) {
                                  FFAppState().removeFromSelectedCategories(
                                      categoriesListItem);
                                  safeSetState(() {});

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    notificationSettings:
                                        createNotificationSettingsStruct(
                                      fieldValues: {
                                        'selectedCategories':
                                            FieldValue.arrayRemove(
                                                [categoriesListItem.title]),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                } else {
                                  FFAppState().addToSelectedCategories(
                                      categoriesListItem);
                                  safeSetState(() {});

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    notificationSettings:
                                        createNotificationSettingsStruct(
                                      fieldValues: {
                                        'selectedCategories':
                                            FieldValue.arrayUnion(
                                                [categoriesListItem.title]),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                }
                              },
                            ),
                          );
                        })
                            .divide(SizedBox(height: 12.0))
                            .addToStart(SizedBox(height: 20.0))
                            .addToEnd(SizedBox(height: 40.0)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
