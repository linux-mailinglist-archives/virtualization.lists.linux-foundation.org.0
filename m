Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFA71766EC
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 23:26:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 607D584FD2;
	Mon,  2 Mar 2020 22:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBWTh5vmNdlw; Mon,  2 Mar 2020 22:26:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3D7484E27;
	Mon,  2 Mar 2020 22:26:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93C4CC013E;
	Mon,  2 Mar 2020 22:26:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48998C1D8A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2FCFF84B2D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00MY9TqggfTj
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:26:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4BAFE81F17
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:26:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z12so829464wmi.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 14:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ajU8ZGbEcqkBckAYEDiRNz0MsdPI1TPZqA43HvlugAA=;
 b=H9TqljHATSEOas5/z3pB0sLxFqmY4QJ1lKcrkrm/K+nQXUIjJvkTeSloG/d4HjKzZP
 oB4t5WOyrQ9RvNccEU96AvdGiLx/bUOJoMMySLC1Rsux3YU5u8g6YSbW3taUbod67G/k
 SMDhFsGrurpKzvz7LNsG9Uxn6sc016suc/yGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ajU8ZGbEcqkBckAYEDiRNz0MsdPI1TPZqA43HvlugAA=;
 b=tt7P2rwqaTHas8Yx+oQmFSgREoc4qeGsdJIGApW1O2ojxOaRkPOqpJklAsSu1iN42c
 THqee05oRQYfeyJwbKLAk5QNpOdnkEFrVrzrtOUao+h0G+PCsVCRGs7Yz1UZOwY6KWVb
 M+uMZq858gsoTYeL0VExQVVpNW7XD6YITvZ9yQGDwGVSkWZu0X9DzEfkFEnpmgl8Vczl
 T8y0PKUKIzcKA3ZuMPNTI1DqUQ7rkz/EBGVaXt/ePI+HN2xpQa0RrkBMYNtdsyZvnGH+
 0HF2CBK6arcSruJosy3ZSpu1vatoQWL8ZYzSO73P75JOxf6qJG13CJAzWluJLvopDbQe
 UQKw==
X-Gm-Message-State: ANhLgQ3Y8cMic0HZitrwSmb9GncUVnPOkE73hbGpv/xOJLU6aqqGc3HV
 zTPr5WfodeI5glPThLQizl9OoA==
X-Google-Smtp-Source: ADFU+vt515+IoI2nlY/7PIrHtdASFHlJ4ud3mOV0GBnjzkTNUI8qKr7w0BKWovMbdZLvqVx2n7HrHg==
X-Received: by 2002:a1c:155:: with SMTP id 82mr466434wmb.99.1583188012778;
 Mon, 02 Mar 2020 14:26:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:52 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Date: Mon,  2 Mar 2020 23:25:49 +0100
Message-Id: <20200302222631.3861340-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
ZCBvdmVyc2hpcCBvZiB0aGF0IHRvCmRybV9kZXZpY2UgYW5kIHRoZSBkcm1tXyBzdHVmZi4KCkFj
a2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6ICJOb3JhbGYgVHLD
uG5uZXMiIDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IHZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9j
aXJydXMuYyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMv
Y2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCmluZGV4IGQyZmY2M2Nl
OGVhZi4uMjIzMjU1NmNlMzRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2Np
cnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKQEAgLTM1LDYgKzM1
LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2lvY3Rs
Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rl
c2V0X2hlbHBlcl92dGFibGVzLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+CkBAIC01MjcsMTAgKzUyOCw4
IEBAIHN0YXRpYyB2b2lkIGNpcnJ1c19tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBjaXJydXNfZGV2
aWNlICpjaXJydXMpCiAKIHN0YXRpYyB2b2lkIGNpcnJ1c19yZWxlYXNlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpCiB7Ci0Jc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cyA9IGRldi0+ZGV2X3By
aXZhdGU7Ci0KIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkZXYpOwotCWtmcmVlKGNpcnJ1cyk7
CisJZHJtX2Rldl9maW5pKGRldik7CiB9CiAKIERFRklORV9EUk1fR0VNX0ZPUFMoY2lycnVzX2Zv
cHMpOwpAQCAtNTc1LDkgKzU3NCwxMiBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCiAKIAlkZXYgPSAmY2lycnVzLT5kZXY7CiAJcmV0ID0gZHJtX2Rl
dl9pbml0KGRldiwgJmNpcnJ1c19kcml2ZXIsICZwZGV2LT5kZXYpOwotCWlmIChyZXQpCi0JCWdv
dG8gZXJyX2ZyZWVfY2lycnVzOworCWlmIChyZXQpIHsKKwkJa2ZyZWUoY2lycnVzKTsKKwkJZ290
byBlcnJfcGNpX3JlbGVhc2U7CisJfQogCWRldi0+ZGV2X3ByaXZhdGUgPSBjaXJydXM7CisJZHJt
bV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBjaXJydXMpOwogCiAJcmV0ID0gLUVOT01FTTsKIAljaXJy
dXMtPnZyYW0gPSBpb3JlbWFwKHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAwKSwKQEAgLTYxOCw4
ICs2MjAsNiBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBk
ZXYsCiAJaW91bm1hcChjaXJydXMtPnZyYW0pOwogZXJyX2Rldl9wdXQ6CiAJZHJtX2Rldl9wdXQo
ZGV2KTsKLWVycl9mcmVlX2NpcnJ1czoKLQlrZnJlZShjaXJydXMpOwogZXJyX3BjaV9yZWxlYXNl
OgogCXBjaV9yZWxlYXNlX3JlZ2lvbnMocGRldik7CiAJcmV0dXJuIHJldDsKLS0gCjIuMjQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
