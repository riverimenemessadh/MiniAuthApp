package tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class MessageTag extends SimpleTagSupport {
    private String text;
    
    public void setText(String text) {
        this.text = text;
    }
    
    @Override
    public void doTag() throws JspException, IOException {
        if (text != null && !text.isEmpty()) {
            getJspContext().getOut().print("<p style='color:red; font-weight:bold;'>" + text + "</p>");
        }
    }
}
