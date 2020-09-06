import 'package:document_search_dashboard/config/app_config.dart';
import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {

  final VoidCallback onClick;

  UploadButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 0,

      child: RaisedButton(
        onPressed: () => onClick,
        padding: EdgeInsets.all(AppConfig.space),
        color: AppConfig.chipColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.file_upload, color: Colors.white, size: 24,),
            SizedBox(width: AppConfig.space,),
            Text("UPLOAD DOCUMENT", style: TextStyle(color: Colors.white, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
