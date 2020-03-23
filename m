Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7818F768
	for <lists.virtualization@lfdr.de>; Mon, 23 Mar 2020 15:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4F65688176;
	Mon, 23 Mar 2020 14:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wqRMWrTPfhc; Mon, 23 Mar 2020 14:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A217688185;
	Mon, 23 Mar 2020 14:50:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F966C0177;
	Mon, 23 Mar 2020 14:50:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19438C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 15FB788175
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eei5aMUpuAzm
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DA17D87F83
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:37 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a25so17466718wrd.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=atkH2g488R1CB16DuIUv15OUWez2VfrV7sgc1phFlME=;
 b=SGvCAMB98FzZ1pEOk8bLX89/7AUjmGgznzwANqTHzGZBd6Uj7gXTwmK8bvofbZbHyx
 FDy6NQ2tzfsubGxaexzHc0bZK5jM3j13LdSmbUApdq1RmkIYtXBYTBFWvyIuKXe4REOz
 jFdNYkYG5ZNj05NvZdw5WobkJGk+UMw1vh0l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=atkH2g488R1CB16DuIUv15OUWez2VfrV7sgc1phFlME=;
 b=RDgXJFQPYLI/zBuc+8uiXL5xEV9csouJW/ualf9hQlYc3e3eA/ehAJZ8dY7qVlnAjc
 p/dfvPT+zNR/uWTo8ecNarjfVkSGWom1IcqtfWgQaHPhvt6MWiai4EoDdZC7xg3oHmxT
 YF4+S3qgpEl4J5dk0RFJM3SWnF2rTLCJXmJWC6ZVs+qNkSZlE0HpyFillI8kiedLHUQF
 3UUAzcLMFTK/Y2v9Rr1NUCg8NGokEHAADEF4lI4RrfVIek3TrDF1Hnvl4YBuPfaaWKsY
 lq4s/mRsF67nmOfp8FCXsOzenvtm7HjFBOtpXQzVUeSzXGZvsqLPb3Dk9N+lo1Hb8zEN
 ijzw==
X-Gm-Message-State: ANhLgQ1BZIBpKQykI6sEbTLBaaWi64+rBbcxX9j2a6MGCEwixuLUbfR3
 1vjbNOmRmzRbNnDMp/m8r0dtgA==
X-Google-Smtp-Source: ADFU+vt5gAk+l64lCZqn/dD1TA9Jzq4OBuX5u3M5SpSxpswWHeLlcPEUYEg93xJ5RfnFHao57jEnjg==
X-Received: by 2002:adf:8385:: with SMTP id 5mr13374232wre.35.1584975036240;
 Mon, 23 Mar 2020 07:50:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/51] drm/cirrus: Drop explicit drm_mode_config_cleanup call
Date: Mon, 23 Mar 2020 15:49:28 +0100
Message-Id: <20200323144950.3018436-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
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
KExhdXJlbnQpLgoKdjM6IFVzZSBkcm1tX21vZGVfY29uZmlnX2luaXQoKSBmb3IgbW9yZSBjbGFy
aXR5IChTYW0sIFRob21hcykKCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3Jn
PgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgfCAyMSAr
KysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwppbmRleCBhOWQ3ODlhNTY1MzYu
LmJkODc4NGVhOWQ2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCkBAIC01MTAsMTEgKzUxMCwx
NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBjaXJydXNfbW9k
ZV9jb25maWdfZnVuY3MgPSB7CiAJLmF0b21pY19jb21taXQgPSBkcm1fYXRvbWljX2hlbHBlcl9j
b21taXQsCiB9OwogCi1zdGF0aWMgdm9pZCBjaXJydXNfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3Qg
Y2lycnVzX2RldmljZSAqY2lycnVzKQorc3RhdGljIGludCBjaXJydXNfbW9kZV9jb25maWdfaW5p
dChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzKQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYgPSAmY2lycnVzLT5kZXY7CisJaW50IHJldDsKKworCXJldCA9IGRybW1fbW9kZV9jb25maWdf
aW5pdChkZXYpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQlkcm1fbW9kZV9jb25maWdf
aW5pdChkZXYpOwogCWRldi0+bW9kZV9jb25maWcubWluX3dpZHRoID0gMDsKIAlkZXYtPm1vZGVf
Y29uZmlnLm1pbl9oZWlnaHQgPSAwOwogCWRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gQ0lS
UlVTX01BWF9QSVRDSCAvIDI7CkBAIC01MjIsMTUgKzUyNiwxMiBAQCBzdGF0aWMgdm9pZCBjaXJy
dXNfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzKQogCWRldi0+
bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMTY7CiAJZGV2LT5tb2RlX2NvbmZpZy5wcmVm
ZXJfc2hhZG93ID0gMDsKIAlkZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJmNpcnJ1c19tb2RlX2Nv
bmZpZ19mdW5jczsKKworCXJldHVybiAwOwogfQogCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KIAotc3RhdGlj
IHZvaWQgY2lycnVzX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsKLQlkcm1fbW9k
ZV9jb25maWdfY2xlYW51cChkZXYpOwotfQotCiBERUZJTkVfRFJNX0dFTV9GT1BTKGNpcnJ1c19m
b3BzKTsKIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7CkBAIC01
NDQsNyArNTQ1LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7
CiAKIAkuZm9wcwkJID0gJmNpcnJ1c19mb3BzLAogCURSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywK
LQkucmVsZWFzZSAgICAgICAgID0gY2lycnVzX3JlbGVhc2UsCiB9OwogCiBzdGF0aWMgaW50IGNp
cnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCkBAIC01OTEsNyArNTkxLDkgQEAg
c3RhdGljIGludCBjaXJydXNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCWlmIChj
aXJydXMtPm1taW8gPT0gTlVMTCkKIAkJZ290byBlcnJfdW5tYXBfdnJhbTsKIAotCWNpcnJ1c19t
b2RlX2NvbmZpZ19pbml0KGNpcnJ1cyk7CisJcmV0ID0gY2lycnVzX21vZGVfY29uZmlnX2luaXQo
Y2lycnVzKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl9jbGVhbnVwOwogCiAJcmV0ID0gY2lycnVz
X2Nvbm5faW5pdChjaXJydXMpOwogCWlmIChyZXQgPCAwKQpAQCAtNjEzLDcgKzYxNSw2IEBAIHN0
YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlyZXR1cm4g
MDsKIAogZXJyX2NsZWFudXA6Ci0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKIAlpb3Vu
bWFwKGNpcnJ1cy0+bW1pbyk7CiBlcnJfdW5tYXBfdnJhbToKIAlpb3VubWFwKGNpcnJ1cy0+dnJh
bSk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
