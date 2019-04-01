<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Notes</title>
  <jsp:include page="../include/top.jsp" flush="false">
		<jsp:param value="" name="top" />
	</jsp:include>
  <style type="text/css">
  body.bggrey {
  background-color: white;
}
.margin {
  margin-top: 25px;
}
.grayout {
  opacity: .45;
}
.headingcolor {
  color: #333;
  background-color: lightgreen;
  border-color: #ddd;
  padding: 10px 15px;
  border-bottom: 1px solid transparent;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
}
.border {
  border-bottom: 1px solid #ebebeb;
  border-top: 1px solid #ebebeb;
}
.panel {
  transition: box-shadow 200ms;
}
.panel:hover {
  box-shadow: 2px 1px 6px 4px grey;
}
.glyphicon:after {
  pointer-events: none;
}
  </style>
  <script type="text/javascript">
  var id;
  var i = 1;

  $(document).ready(function () {
    document.getElementById("saveButton").onclick = function () {
      if (CheckNote("notename", "notecontent")) {
        var element = CreateNote();
        element.setAttribute("id", i++);
        var insert = document.getElementById("container");

        if (insert != null)
          insert.insertBefore(element, insert.firstChild);
        else
          document.getElementById("container").appendChild(element);
        return false;
      }
      return true;
    };

    document.getElementById("deleteButton").onclick = function () {
      var toRemove = document.getElementById(id);
      toRemove.parentElement.removeChild(toRemove);

      var insert = document.getElementById("deteledContainer");

      if (insert != null)
        insert.insertBefore(toRemove, insert.firstChild);
      else
        document.getElementById("deletedContainer").appendChild(toRemove);

      document.getElementById("g0" + toRemove.id).remove();
      document.getElementById("g1" + toRemove.id).remove();
      document.getElementById("g2" + toRemove.id).remove();
      document.getElementById("glyphContainer" + toRemove.id).appendChild(RestoreGlyph(toRemove.id));

      toRemove.className += " grayout";
    };

    document.getElementById("yesButton").onclick = function () {
      var toMove = document.getElementById(id);
      toMove.parentElement.removeChild(toMove);
      toMove.className += " grayout";

      document.getElementById("container").appendChild(toMove);
      var glyph = document.getElementById("g1" + toMove.id);
      glyph.removeAttribute("data-toggle");
      glyph.removeAttribute("data-target");
    };

    document.getElementById("restoreYes").onclick = function () {
      var toMove = document.getElementById(id);
      toMove.parentElement.removeChild(toMove);
      toMove.className = "col-sm-4 margin";

      var insert = document.getElementById("container");

      if (insert != null)
        insert.insertBefore(toMove, insert.firstChild);
      else
        document.getElementById("container").appendChild(toMove);

      document.getElementById("g3" + toMove.id).remove();
      var cont = document.createElement("div");
      cont.style.position = "absolute";
      cont.style.bottom = "0";
      cont.style.right = "0";
      cont.style.marginRight = "5px";
      cont.style.marginBottom = "5px";
      cont.appendChild(YesGlyph(toMove.id));
      cont.appendChild(NoGlyph(toMove.id));

      document.getElementById("glyphContainer" + toMove.id).insertBefore(EditGlyph(toMove.id), document.getElementById("glyphContainer" + toMove.id).firstChild);
      document.getElementById("glyphContainer" + toMove.id).appendChild(cont);
    };

    document.getElementById("editButton").onclick = function () {
      if (CheckNote("editname", "editcontent")) {
        var newTitle = document.getElementById("heading" + id);
        newTitle.textContent = document.getElementById("editname").value;

        var newBody = document.getElementById("glyphContainer" + id);
        newBody.textContent = document.getElementById("editcontent").value;
        newBody.innerHTML += '<br/><br/>';

        if (newBody.parentElement.parentElement.parentElement.id == "container")
          newBody = createGlyphs(newBody, id);
        else {
          newBody.appendChild(RestoreGlyph(id));
        }
        return false;
      };
      return true;
    };

    document.getElementById("notecontent").onkeypress = function (e) {
      if (e.keyCode == 13)
        document.getElementById("saveButton").click();
    };
  });

  function YesGlyph(currentId) {
    var span1 = document.createElement("span");
    span1.className = "glyphicon glyphicon-ok pull-right";
    span1.setAttribute("id", 'g1' + currentId);
    span1.setAttribute("onclick", "okGlyphInDiv(this)");
    span1.setAttribute("data-toggle", "modal");
    span1.setAttribute("data-target", "#okModal");
    return span1;
  };

  function NoGlyph(currentId) {
    var span2 = document.createElement("span");
    span2.className = "glyphicon glyphicon-remove pull-right";
    span2.setAttribute("id", 'g2' + currentId);
    span2.setAttribute("onclick", "okGlyphInDiv(this)");
    span2.setAttribute("data-toggle", "modal");
    span2.setAttribute("data-target", "#deleteModal");
    return span2;
  };

  function RestoreGlyph(currentId) {
    var glyph = document.createElement("span");
    glyph.className = "glyphicon glyphicon-refresh pull-right";
    glyph.setAttribute("id", 'g3' + currentId);
    glyph.setAttribute("onclick", "okGlyph(this)");
    glyph.setAttribute("data-toggle", "modal");
    glyph.setAttribute("data-target", "#restoreModal");
    glyph.style.position = "absolute";
    glyph.style.top = "initial";
    glyph.style.bottom = "0";
    glyph.style.right = "0";
    glyph.style.marginRight = "5px";
    glyph.style.marginBottom = "5px";
    return glyph;
  };

  function EditGlyph(currentId) {
    var glyph = document.createElement("span");
    glyph.className = "glyphicon glyphicon-edit pull-right";
    glyph.setAttribute("id", 'g0' + currentId);
    glyph.setAttribute("onclick", "okGlyph(this)");
    glyph.setAttribute("data-toggle", "modal");
    glyph.setAttribute("data-target", "#editModal");
    glyph.style.position = "absolute";
    glyph.style.top = "0";
    glyph.style.right = "0";
    glyph.style.marginRight = "5px";
    glyph.style.marginTop = "5px";

    return glyph;
  };

  function okGlyph(that) {
    id = that.parentElement.parentElement.parentElement.id;
  };

  function okGlyphInDiv(that) {
    id = that.parentElement.parentElement.parentElement.parentElement.id;
  };

  function CreateNote() {
    var note = document.createElement("div");
    note.className = "col-sm-4 margin";
    note.setAttribute("id", "notehover");
    var panel = document.createElement("div");
    panel.className = "panel panel-default";
    panel.style.height = "200px";
    var heading = document.createElement("div");
    heading.className = "panel-body headingcolor";
    heading.setAttribute("id", "heading" + i);
    heading.textContent = document.getElementById("notename").value;
    var body = document.createElement("div");
    body.className = "panel-body";
    body.setAttribute("id", "glyphContainer" + i);
    body.style.overflow = "hidden";
    body.style.position = "relative";
    body.style.height = "73%";
    body.textContent = document.getElementById("notecontent").value;
    body.innerHTML += '<br/><br/>';
    body = createGlyphs(body, i);
    panel.appendChild(heading);
    panel.appendChild(body);
    note.appendChild(panel);
    return note;
  };

  function createGlyphs(body, id) {
    var cont = document.createElement("div");
    cont.style.position = "absolute";
    cont.style.bottom = "0";
    cont.style.right = "0";
    cont.style.marginRight = "5px";
    cont.style.marginBottom = "5px";
    body.insertBefore(EditGlyph(id), body.firstChild);
    cont.appendChild(YesGlyph(id));
    cont.appendChild(NoGlyph(id));
    body.appendChild(cont);
    return body;
  };

  function CheckNote(nameId, contentId) {
    if (document.getElementById(nameId).value == "" || document.getElementById(contentId).value == "")
      return false;
    return true;
  };
  </script>
</head>
<body class="bggrey">
  <div class="container-fluid" style="height: 95vh">
    <div class="row content" style="height: 100%">
      <div class="col-sm-6" style="height: 100%">
        <h1>메모</h1>
        <div class="row border" style="height: 50%; overflow:auto">
          <div class="col-sm-12" id="container">

          </div>
        </div>
        <div class="row" style="height: 50%; overflow:auto">
          <div class="col-sm-12">
            <h1>쪽지</h1>
            <div class="row" id="deletedContainer">

            </div>
          </div>
        </div>
      </div>
<!--       <div class="col-sm-6" style="height: 100%; border-left: 1px solid #eee;"> -->
<!--         <h1 style="margin-top:15px">Add a sticky note</h1> -->
<!--         <div class="col-sm-7 border"> -->
<!--           <form role="form" name="addNote" id="addSticky"> -->
<!--             <div class="control-group form-group"> -->
<!--               <div class="controls"> -->
<!--                 <br /><br /> -->
<!--                 <label for="title">Title</label> -->
<!--                 <input type="text" class="form-control" id="notename" required data-validation-required-message="You must enter a title" /> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="control-group form-group"> -->
<!--               <div class="controls"> -->
<!--                 <label for="content">Content</label> -->
<!--                 <textarea id="notecontent" class="form-control" maxlength="999" rows="10" cols="100" required style="resize: none;"></textarea> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div id="success"></div> -->
<!--             <button type="submit" class="btn btn-primary pull-right" id="saveButton" style="margin-bottom:10px">Add note</button> -->
<!--           </form> -->
<!--         </div> -->
<!--       </div> -->
    </div>
  </div>
  <div class="modal fade" id="deleteModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete</h4>
        </div>
        <div class="modal-body">
          <p>Are you sure you want to delete this note?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="deleteButton" data-dismiss="modal">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="okModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Solved</h4>

        </div>
        <div class="modal-body">
          <p>Are you sure you don't need this note anymore?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="yesButton" data-dismiss="modal">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="restoreModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Restore</h4>
        </div>
        <div class="modal-body">
          <p>Do you want to restore this note?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" id="restoreYes" data-dismiss="modal">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="editModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Edit</h4>
        </div>
        <div class="modal-body">
          <form role="form" name="editNote" id="editSticky">
            <div class="control-group form-group">
              <div class="controls">
                <label for="title">Edit Title</label>
                <input type="text" class="form-control" id="editname" required />
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label for="content">Content</label>
                <textarea id="editcontent" class="form-control" maxlength="999" rows="10" cols="100" required style="resize: none;"></textarea>
              </div>
            </div>
            <div id="success"></div>
            <button type="button" class="btn btn-primary pull-right" id="editButton" style="margin-bottom:10px" data-dismiss="modal">Save</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>