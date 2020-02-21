Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAEA1688A1
	for <lists.virtualization@lfdr.de>; Fri, 21 Feb 2020 22:04:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7392686B68;
	Fri, 21 Feb 2020 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZ0hQfl0rlxK; Fri, 21 Feb 2020 21:04:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A830F86BCF;
	Fri, 21 Feb 2020 21:04:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CD95C013E;
	Fri, 21 Feb 2020 21:04:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12D83C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0239886B68
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 21:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FuJDa6W8w5ls
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 21:04:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BED978620B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 21:04:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so3165056wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8MykfXoZv4RMC4YeXLKl7BIFZZ0Ny74Kd3gytdkuYM=;
 b=LleKOXH95g8GyMdG1Jy31f6vvwdY7WGDBb6P+a7mmv2VXdnEk2YOw4iM/p8lz1l6mX
 W65PRiQmr9UY2uCKVcNNvENlPFp4aSqDAgU57LobPbwUCNuIo1ikGW9IOHl9jLGljHIl
 4Wkh8Wqe47O6wQqCFKXXvQEPbOEYE4P/5tDLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8MykfXoZv4RMC4YeXLKl7BIFZZ0Ny74Kd3gytdkuYM=;
 b=D2YmpL7BIOVfe5H5r+l1jiVSj+GdR9sQdnd3vjJTqR2Bu7wwoxRJcBQ2UUks5B7vbJ
 djVeEooZjezv44hxa7Z1SVQYMHQIHPF21kmtxpSH0LPbKyzi7BNM2TdTKP8VxfYbK/l+
 bYO0ReaiDIiNgEwwMj7r8YqFShvi59tTilFhuJFPiYcwqVg7n0ai+fhNz3dArsFJVcrK
 ayuNuuw14dy1kv7IOagFZf7Z0yC2oqyRvT9mgEBsDvFwPoOZ9wZgFVBks7HmDudSeMD4
 YjreobUvrcIJAqUouQinHPyrMS4uwBk008aZfEqOQOqM8+urjDUnFqQbbFlQNfOlIiGB
 gV1g==
X-Gm-Message-State: APjAAAXmLbuNhU7e/UPiF4yzG29b8vgyY5eKrzY6wzaNaUCvQxQnLmRS
 twqIlFVjA7Frj7WOafLTPX16BA==
X-Google-Smtp-Source: APXvYqzEU0Wr4XFOu1nRzN2rE2Luhw9/C/9t9Xk8nlFxjcUfuIoi5P26Lh7Idw9eHPYj59oVnGvSkQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr5684120wml.55.1582319046109; 
 Fri, 21 Feb 2020 13:04:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:05 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/51] drm/cirrus: Drop explicit drm_mode_config_cleanup call
Date: Fri, 21 Feb 2020 22:02:57 +0100
Message-Id: <20200221210319.2245170-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

V2UgY2FuIGV2ZW4gZGVsZXRlIHRoZSBkcm1fZHJpdmVyLnJlbGVhc2UgaG9vayBub3chCgpUaGlz
IGlzIG1hZGUgcG9zc2libGUgYnkgYSBwcmVjZWVkaW5nIHBhdGNoIHdoaWNoIGFkZGVkIGEgZHJt
bV8KY2xlYW51cCBhY3Rpb24gdG8gZHJtX21vZGVfY29uZmlnX2luaXQoKSwgaGVuY2UgYWxsIHdl
IG5lZWQgdG8gZG8gdG8KZW5zdXJlIHRoYXQgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKSBpcyBy
dW4gb24gZmluYWwgZHJtX2RldmljZQpjbGVhbnVwIGlzIGNoZWNrIHRoZSBuZXcgZXJyb3IgY29k
ZSBmb3IgX2luaXQoKS4KCnYyOiBFeHBsYWluIHdoeSB0aGlzIGNsZWFudXAgaXMgcG9zc2libGUg
KExhdXJlbnQpLgoKQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
Q2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jIHwgMjEgKysr
KysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXggYTlkNzg5YTU2NTM2Li42
YWMwMjg2ODEwZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAtNTEwLDExICs1MTAsMTUg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgY2lycnVzX21vZGVf
Y29uZmlnX2Z1bmNzID0gewogCS5hdG9taWNfY29tbWl0ID0gZHJtX2F0b21pY19oZWxwZXJfY29t
bWl0LAogfTsKIAotc3RhdGljIHZvaWQgY2lycnVzX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGNp
cnJ1c19kZXZpY2UgKmNpcnJ1cykKK3N0YXRpYyBpbnQgY2lycnVzX21vZGVfY29uZmlnX2luaXQo
c3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gJmNpcnJ1cy0+ZGV2OworCWludCByZXQ7CisKKwlyZXQgPSBkcm1fbW9kZV9jb25maWdfaW5p
dChkZXYpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQlkcm1fbW9kZV9jb25maWdfaW5p
dChkZXYpOwogCWRldi0+bW9kZV9jb25maWcubWluX3dpZHRoID0gMDsKIAlkZXYtPm1vZGVfY29u
ZmlnLm1pbl9oZWlnaHQgPSAwOwogCWRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gQ0lSUlVT
X01BWF9QSVRDSCAvIDI7CkBAIC01MjIsMTUgKzUyNiwxMiBAQCBzdGF0aWMgdm9pZCBjaXJydXNf
bW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzKQogCWRldi0+bW9k
ZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMTY7CiAJZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJf
c2hhZG93ID0gMDsKIAlkZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJmNpcnJ1c19tb2RlX2NvbmZp
Z19mdW5jczsKKworCXJldHVybiAwOwogfQogCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KIAotc3RhdGljIHZv
aWQgY2lycnVzX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsKLQlkcm1fbW9kZV9j
b25maWdfY2xlYW51cChkZXYpOwotfQotCiBERUZJTkVfRFJNX0dFTV9GT1BTKGNpcnJ1c19mb3Bz
KTsKIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7CkBAIC01NDQs
NyArNTQ1LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7CiAK
IAkuZm9wcwkJID0gJmNpcnJ1c19mb3BzLAogCURSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywKLQku
cmVsZWFzZSAgICAgICAgID0gY2lycnVzX3JlbGVhc2UsCiB9OwogCiBzdGF0aWMgaW50IGNpcnJ1
c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCkBAIC01OTEsNyArNTkxLDkgQEAgc3Rh
dGljIGludCBjaXJydXNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCWlmIChjaXJy
dXMtPm1taW8gPT0gTlVMTCkKIAkJZ290byBlcnJfdW5tYXBfdnJhbTsKIAotCWNpcnJ1c19tb2Rl
X2NvbmZpZ19pbml0KGNpcnJ1cyk7CisJcmV0ID0gY2lycnVzX21vZGVfY29uZmlnX2luaXQoY2ly
cnVzKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl9jbGVhbnVwOwogCiAJcmV0ID0gY2lycnVzX2Nv
bm5faW5pdChjaXJydXMpOwogCWlmIChyZXQgPCAwKQpAQCAtNjEzLDcgKzYxNSw2IEBAIHN0YXRp
YyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlyZXR1cm4gMDsK
IAogZXJyX2NsZWFudXA6Ci0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKIAlpb3VubWFw
KGNpcnJ1cy0+bW1pbyk7CiBlcnJfdW5tYXBfdnJhbToKIAlpb3VubWFwKGNpcnJ1cy0+dnJhbSk7
Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
