package gov.eighteenf.cq;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Activator implements BundleActivator {

    /**
     * default logger
     */
    private static final Logger log = LoggerFactory.getLogger( Activator.class );

    /*
     * (non-Javadoc)
     * @see org.osgi.framework.BundleActivator#start(org.osgi.framework.BundleContext)
     */
    public void start( BundleContext context ) throws Exception {
        log.info( context.getBundle().getSymbolicName() + " started" );
        // TODO add initialization code
    }

    /*
     * (non-Javadoc)
     * @see org.osgi.framework.BundleActivator#stop(org.osgi.framework.BundleContext)
     */
    public void stop( BundleContext context ) throws Exception {
        log.info( context.getBundle().getSymbolicName() + " stopped" );
        // TODO add cleanup code
    }
}
