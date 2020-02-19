Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DE16416C
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 11:21:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 92F12203CF;
	Wed, 19 Feb 2020 10:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHg81hFlMfWO; Wed, 19 Feb 2020 10:21:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C42BA20365;
	Wed, 19 Feb 2020 10:21:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADF14C013E;
	Wed, 19 Feb 2020 10:21:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA494C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A94D085E35
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WAUozIu9kWpJ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:21:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3B6F385E2B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 10:21:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so27554420wrw.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 02:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q7MWd5yKDDN4kYPLlNzre71uaGPyUp7BlB0OXWxic1I=;
 b=AeNQV7eBOj/i2PYBxTDonIQ5b0NKlHA4aEpnSVoeRIgjMpNOu4Y2eApIy/WZTLPxo/
 kqyv1ZmYW/PzuzxEA6fH3XnM5aP6t1R9w2HWuJfZTwaytp+7OV2NCIDF511LUpMJ/fkM
 9enUh/YE6iQjhk3GyscpMVS/YtHT/5WkZY1NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q7MWd5yKDDN4kYPLlNzre71uaGPyUp7BlB0OXWxic1I=;
 b=LCRpcW2EplvsL4PYMJ86Q0iOA87JRnVy8YjlJUx3nvzLHsk7iC2qcXHte8IAVM5I5E
 lyRdefg49FW2bpcoxJTf97lui2KY3vIsnpzEP/8rAFNoGLwzUbPVtkeSWiVbDGbaDcxg
 SSwnw8AfORelbmL+u9ygn/xGyS+sEkPW6tj8bpBSp367GR6gUPSqZDeiMSwp5k5TF2zL
 JGCNoJCIP2fxfIOphRRMWZ9XFM3tVQ7zNPhQNgvtm8nlWF9BHuUQnYPwlriDWPOiwS7q
 SY1O12BySi3o9k8N3aU3AekYEQbjMzjqhDL+X8wov6oFQAEghhNX3xsTOuVE2/F5uNzE
 MbRA==
X-Gm-Message-State: APjAAAVtxCBvNGPVQXPMw/5+DxN1nbJn5XdU/Bhl86m1LRL/JFHHtoom
 IaaKf0CbuM5im4c+fPdZiC51Yg==
X-Google-Smtp-Source: APXvYqwcR9BZ9vyzKsz05L+F48RilhfhZlGPMjpJrbLG6395Wb2vlQBf1POvYlcVj8oeRZ/B7YBA2A==
X-Received: by 2002:adf:f44a:: with SMTP id f10mr36409031wrp.16.1582107703538; 
 Wed, 19 Feb 2020 02:21:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:42 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/52] drm/cirrus: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:40 +0100
Message-Id: <20200219102122.1607365-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>
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

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKSSBhbHNvIG5vdGljZWQgdGhhdCBjaXJydXMgZm9yZ290IHRvIGNhbGwgZHJtX2Rl
dl9maW5pKCkuCgp2MjogRG9uJ3QgY2FsbCBrZnJlZShjaXJydXMpIGFmdGVyIHdlJ3ZlIGhhbmRl
ZCBvdmVyc2hpcCBvZiB0aGF0IHRvCmRybV9kZXZpY2UgYW5kIHRoZSBkcm1tXyBzdHVmZi4KClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzog
RGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
Q2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6
IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCi0tLQogZHJpdmVycy9n
cHUvZHJtL2NpcnJ1cy9jaXJydXMuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5j
CmluZGV4IGQyZmY2M2NlOGVhZi4uMjIzMjU1NmNlMzRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVz
LmMKQEAgLTM1LDYgKzM1LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIu
aD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX2lvY3RsLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+CiAjaW5jbHVk
ZSA8ZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9w
cm9iZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+CkBA
IC01MjcsMTAgKzUyOCw4IEBAIHN0YXRpYyB2b2lkIGNpcnJ1c19tb2RlX2NvbmZpZ19pbml0KHN0
cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMpCiAKIHN0YXRpYyB2b2lkIGNpcnJ1c19yZWxlYXNl
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1
cyA9IGRldi0+ZGV2X3ByaXZhdGU7Ci0KIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkZXYpOwot
CWtmcmVlKGNpcnJ1cyk7CisJZHJtX2Rldl9maW5pKGRldik7CiB9CiAKIERFRklORV9EUk1fR0VN
X0ZPUFMoY2lycnVzX2ZvcHMpOwpAQCAtNTc1LDkgKzU3NCwxMiBAQCBzdGF0aWMgaW50IGNpcnJ1
c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAKIAlkZXYgPSAmY2lycnVzLT5kZXY7
CiAJcmV0ID0gZHJtX2Rldl9pbml0KGRldiwgJmNpcnJ1c19kcml2ZXIsICZwZGV2LT5kZXYpOwot
CWlmIChyZXQpCi0JCWdvdG8gZXJyX2ZyZWVfY2lycnVzOworCWlmIChyZXQpIHsKKwkJa2ZyZWUo
Y2lycnVzKTsKKwkJZ290byBlcnJfcGNpX3JlbGVhc2U7CisJfQogCWRldi0+ZGV2X3ByaXZhdGUg
PSBjaXJydXM7CisJZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBjaXJydXMpOwogCiAJcmV0ID0g
LUVOT01FTTsKIAljaXJydXMtPnZyYW0gPSBpb3JlbWFwKHBjaV9yZXNvdXJjZV9zdGFydChwZGV2
LCAwKSwKQEAgLTYxOCw4ICs2MjAsNiBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCiAJaW91bm1hcChjaXJydXMtPnZyYW0pOwogZXJyX2Rldl9wdXQ6
CiAJZHJtX2Rldl9wdXQoZGV2KTsKLWVycl9mcmVlX2NpcnJ1czoKLQlrZnJlZShjaXJydXMpOwog
ZXJyX3BjaV9yZWxlYXNlOgogCXBjaV9yZWxlYXNlX3JlZ2lvbnMocGRldik7CiAJcmV0dXJuIHJl
dDsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
