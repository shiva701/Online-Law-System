<%@page contentType="text/html" pageEncoding="UTF-8"%>
<LABEL>Victim's Name</LABEL>
<input type="text" id="vname" placeholder="Enter victim's name" name="vname">
<LABEL>Status</LABEL>
<select type="text" id="status" name="status">
    <option value="none">Select one</option>
    <option value="closed">Closed</option>
    <option value="resolved">Resolved</option>
    <option value="submitted">Submitted</option>
    <option value="under processing">Under Processing</option>
    <option value="withdrawn">Withdrawn</option>
</select>
<button class="btn btn-primary" onclick="searchmodify()">Modify Search</button>