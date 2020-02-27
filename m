Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533317264B
	for <lists.virtualization@lfdr.de>; Thu, 27 Feb 2020 19:15:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3F8287FFB;
	Thu, 27 Feb 2020 18:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbvekZyEkz7S; Thu, 27 Feb 2020 18:15:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3CC787FE9;
	Thu, 27 Feb 2020 18:15:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8799C0177;
	Thu, 27 Feb 2020 18:15:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D696C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3951E8793D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvz6oTJ6CSjv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4C30585D26
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 18:15:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v2so4585973wrp.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q7MWd5yKDDN4kYPLlNzre71uaGPyUp7BlB0OXWxic1I=;
 b=XlccQy4CusVfgttdkI0YhmczWKi4xlIw0+IB7MXB+GER63yF9RA4HC/1AqX9AtvCi8
 jQO3TPEU7ptqXfOPoaC6BM+wk7whLqNOg2xboIJXDU4VgyxiosQQzhfk8G2u+u2wtdTv
 vPKLFTV95dzO0iSA2k79RhI6ZINEFCew4gWVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q7MWd5yKDDN4kYPLlNzre71uaGPyUp7BlB0OXWxic1I=;
 b=EcsvOSjwQEb8tLEbZ0PJ+q0u9Fyj8IcJca0V+3v6pvMtHnoAzFCg3ozIqGNXMkuNyf
 7V023zqdt3K0Hq88IAIXno/nn8FmdA5Zt2oMy9FI+KCCISKc8zBRonCwLT79fXvPnvVB
 nstMilrytWHjPzlFIVdSvbCODK+MJhoB/yGe6KpI9gJ81JPZuJFt4/6/p9y5Z3h2bsqV
 7ODrpMdwWSLIm8JFjty+eJLD+6coYLbEfTOQ2JKpqDvowOkU4Ia/aHYBjcdUYEqkiIGb
 jc3wZjFd8s1p9L2VXdoZpb6sgOyby2ki/0z0g18ubIRF1QNpeMOuYd0TfxSrLKPOjLP9
 O5Sw==
X-Gm-Message-State: APjAAAUcQAwdLi/JTPNniD1C3cGA6C6h/EAm0K6n25iZFJZFTjtkKka+
 8tb8ZD8Ryla3twjU3m6V3Y/bYw4G8qo=
X-Google-Smtp-Source: APXvYqxKlhtL3qzUiHRxm/EJhFR/2F8qOw7JJt6Mi3qILMY407qslPkxhzFMsX6GhxXifZZRR0otkw==
X-Received: by 2002:adf:e383:: with SMTP id e3mr163819wrm.10.1582827340841;
 Thu, 27 Feb 2020 10:15:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:15:40 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Date: Thu, 27 Feb 2020 19:14:40 +0100
Message-Id: <20200227181522.2711142-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>, l.stach@pengutronix.de
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
