package com.shop.app.modules.core.constant;

import java.security.Key;

import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

/**
 * @author Jean
 */
public class JWTConstants {

    public static final long ACCESS_TOKEN_VALIDITY_SECONDS = 5*60*60;
    // We need a signing key, so we'll create one just for this example. Usually
    // the key would be read from your application configuration instead.
    public static final Key SIGNING_KEY = Keys.secretKeyFor(SignatureAlgorithm.HS256);
    // public static final String SIGNING_KEY = "helloworld";
    public static final String TOKEN_PREFIX = "Bearer ";
    public static final String HEADER_STRING = "Authorization";
}
