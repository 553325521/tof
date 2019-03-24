package top.tsep.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import top.tsep.pojo.UserEntity;

public class CheckLoginStatus {
	 private HttpServletRequest mRequest;

	    public CheckLoginStatus( HttpServletRequest request )
	    {
	        mRequest = request;
	    }

	    public boolean isLogin()
	    {
	        HttpSession session = mRequest.getSession();
	        if ( session.getAttribute( "SESSION_USER" ) != null )
	        {
	            return true;
	        } else
	        {
	            return false;
	        }
	    }
	    public void removeSession() {
	    	 HttpSession session = mRequest.getSession();
	         session.removeAttribute("SESSION_USER");
	    }
	    public UserEntity getUsers()
	    {
	        HttpSession session = mRequest.getSession();
	        if ( session != null )
	        {
	            if ( session.getAttribute( "SESSION_USER" ) != null )
	            {
	                return (UserEntity)session.getAttribute( "SESSION_USER" );
	            } else
	            {
	                return null;
	            }
	        } else
	        {
	            return null;
	        }
	    }

	    public void putUsers( UserEntity users )
	    {
	        HttpSession session = mRequest.getSession();
	        if ( session != null )
	        {
	            session.setAttribute( "SESSION_USER", users );
	        }
	    }
}
