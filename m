Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5A18F769
	for <lists.virtualization@lfdr.de>; Mon, 23 Mar 2020 15:51:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 86514882B0;
	Mon, 23 Mar 2020 14:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrDivEcuSo4t; Mon, 23 Mar 2020 14:51:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D4E08829B;
	Mon, 23 Mar 2020 14:51:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 060B9C1D91;
	Mon, 23 Mar 2020 14:51:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30E6EC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1D4BE88179
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMU7q37SzYM2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E20D88175
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 14:50:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p10so5017380wrt.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtsrD/aFJQAx1LKfUnSPy4VErkcJPE9ispYy08oNiec=;
 b=FnCNYm/h3O11W73yUrrq4IYHNAT7v0gn7YNQ+I1h3OimV7UNSvAZjk+Ie4HohTgRNW
 C+AUMgdgTPIELi5S9GG5ak60t0p3b26W4AFtYB3pvT7ybeaczfLxqZVvgh9wAkkPcsl5
 uhkXubC7LmZs3Nn/bSLf32wF3UwtNtEAZucrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtsrD/aFJQAx1LKfUnSPy4VErkcJPE9ispYy08oNiec=;
 b=pHYe8XNsHgR3ecGByFu2XCv5m/Uw0nxLOfUJmJXqCxDnyFNr80D6qi8nXafDgHXgjh
 OmiNKUAba3YzVTKDwJmtGmBRSySRik42aKqmlxoun1Ngq3Inwn/ehuarTa3DKTb8Uncu
 5ZSnDd1VkPVOHZ9m8xdtbXv9DwtAf5sErDz7tsUhhYqwuZAOOFzA3NKkFFPB+OLVwP5N
 Keq73x72Ujn9J9uRp71S2TZohws/kGEzHoYeLXDmH7ZG65DxqLaNgGP6wtTjt37WmNbE
 5bw8Bc4nETmWPoUloIFM9iYdhhDZ/ZuhYEzOOaW5BdZKO6OHBhFhKKuUCculETaC9EgV
 E9sw==
X-Gm-Message-State: ANhLgQ0g3MI1xJAldSdR9GDAbSUfEvYIgtt8gnkazumSe3eO42kUTlGu
 yYMoGhJ8jODQ48ceyKrTh/L3sw==
X-Google-Smtp-Source: ADFU+vtEod6poXJM57oOycTdEiRIYy+MxMIgQeYR2m6kYJZ6RjXo9lYNGin1i7rgXBWM7aoeYwFAYw==
X-Received: by 2002:adf:82f7:: with SMTP id 110mr29802263wrc.373.1584975009633; 
 Mon, 23 Mar 2020 07:50:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:08 +0100
Message-Id: <20200323144950.3018436-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
a2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jIHwgMTQg
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXggZDJmZjYzY2U4ZWFmLi4yMjMyNTU2
Y2UzNGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAtMzUsNiArMzUsNyBAQAogI2luY2x1
ZGUgPGRybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2Zy
YW1lYnVmZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4KKyNpbmNsdWRl
IDxkcm0vZHJtX21hbmFnZWQuaD4KICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0
YWJsZXMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4KQEAgLTUyNywxMCArNTI4LDggQEAgc3RhdGljIHZv
aWQgY2lycnVzX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykK
IAogc3RhdGljIHZvaWQgY2lycnVzX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIHsK
LQlzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzID0gZGV2LT5kZXZfcHJpdmF0ZTsKLQogCWRy
bV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRldik7Ci0Ja2ZyZWUoY2lycnVzKTsKKwlkcm1fZGV2X2Zp
bmkoZGV2KTsKIH0KIAogREVGSU5FX0RSTV9HRU1fRk9QUyhjaXJydXNfZm9wcyk7CkBAIC01NzUs
OSArNTc0LDEyIEBAIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIAogCWRldiA9ICZjaXJydXMtPmRldjsKIAlyZXQgPSBkcm1fZGV2X2luaXQoZGV2LCAm
Y2lycnVzX2RyaXZlciwgJnBkZXYtPmRldik7Ci0JaWYgKHJldCkKLQkJZ290byBlcnJfZnJlZV9j
aXJydXM7CisJaWYgKHJldCkgeworCQlrZnJlZShjaXJydXMpOworCQlnb3RvIGVycl9wY2lfcmVs
ZWFzZTsKKwl9CiAJZGV2LT5kZXZfcHJpdmF0ZSA9IGNpcnJ1czsKKwlkcm1tX2FkZF9maW5hbF9r
ZnJlZShkZXYsIGNpcnJ1cyk7CiAKIAlyZXQgPSAtRU5PTUVNOwogCWNpcnJ1cy0+dnJhbSA9IGlv
cmVtYXAocGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDApLApAQCAtNjE4LDggKzYyMCw2IEBAIHN0
YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlpb3VubWFw
KGNpcnJ1cy0+dnJhbSk7CiBlcnJfZGV2X3B1dDoKIAlkcm1fZGV2X3B1dChkZXYpOwotZXJyX2Zy
ZWVfY2lycnVzOgotCWtmcmVlKGNpcnJ1cyk7CiBlcnJfcGNpX3JlbGVhc2U6CiAJcGNpX3JlbGVh
c2VfcmVnaW9ucyhwZGV2KTsKIAlyZXR1cm4gcmV0OwotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
