Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 953901766FF
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 23:27:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 114F98517E;
	Mon,  2 Mar 2020 22:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcSP2TP3FzWK; Mon,  2 Mar 2020 22:27:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8689E85361;
	Mon,  2 Mar 2020 22:27:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 668C6C013E;
	Mon,  2 Mar 2020 22:27:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF1D3C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DCAC9204C6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVQe1Ey-t9wz
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 858C12001D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:27:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 6so826651wmi.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 14:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sO0M/SWr0fp0UhDAgP8l2cpuTD7O4l6AlGlXxl6cYl4=;
 b=KAhKUBbJKZDPhg4XiRiLS0GIpX/0ip/iy8xJKxrurXgSaQXt3MWCuwyO1z1ywAiO+N
 OZFKPB1LSlDRX2mGf/65CBt6Qy6lJEyNcrWAusvvysRX1sAsegHcnNIxN6kW80SuNURc
 gUObmeOhRrKL8M0/LS1FXlfCDJARbl+5BJZoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sO0M/SWr0fp0UhDAgP8l2cpuTD7O4l6AlGlXxl6cYl4=;
 b=B1rs8g2zkM3KsBRX6Phse3UAISEF1ag4HC3ajF5zv9xDipLbP1ZU4qxZ9qyN83n3bS
 EprezAx/SVl5g3e6S1gc5HAdEhahtZ3eiXRZOQGeNC99dAmXEmzayG9sPx8/8Zqp6D/1
 srSXtaGiDE+NXn9zbM7Mjay2TZX8FvSIQtJwZUAdHGaU7tdsqjLK82ZzQKqSUtKZ8j75
 XIQsBEfOYvJYDfK3gAzFv1OUonqzWaKNStyLn616A9FdYwT7hFhVxy+kixtEDLR1sYAd
 WQU92iNmUmpCxiHZooHGvGP/SP2fM1yyk1H0KSTOgSkH2/ILIUpEN9lzJspibrzYPyKH
 GTmw==
X-Gm-Message-State: ANhLgQ33fHtFHh9xNM2jQrBZy4oLgCg46AoVPbAO2IX5MP0dW563NIOU
 ZH2OGPOP/m5VkXkpH2elzo/oJg==
X-Google-Smtp-Source: ADFU+vv/vrvv9WZQNRl7UImzwtUGhiqEwsrWqWegdDCI4TKtuGF8pyF0yi2CFD2FchLpQUQ19UpHXA==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr468289wmg.169.1583188038109; 
 Mon, 02 Mar 2020 14:27:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:17 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/51] drm/cirrus: Fully embrace devm_
Date: Mon,  2 Mar 2020 23:26:10 +0100
Message-Id: <20200302222631.3861340-31-daniel.vetter@ffwll.ch>
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
 Emil Velikov <emil.velikov@collabora.com>
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

V2l0aCB0aGUgZHJtX2RldmljZSBsaWZldGltZSBmdW4gY2xlYW5lZCB1cCB0aGVyZSdzIG5vdGhp
bmcgaW4gdGhlIHdheQphbnltb3JlIHRvIHVzZSBkZXZtXyBmb3IgZXZlcnl0aGluZyBodyByZWxl
YXRlZC4gRG8gaXQsIGFuZCBpbiB0aGUKcHJvY2VzcywgdGhyb3cgb3V0IHRoZSBlbnRpcmUgb25p
b24gdW53aW5kaW5nLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJy
dXMuYyB8IDQ0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1
cy5jCmluZGV4IGJkODc4NGVhOWQ2NC4uYTM2MjY5NzE3YzNiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2ly
cnVzLmMKQEAgLTU1OCw3ICs1NTgsNyBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHBj
aV9lbmFibGVfZGV2aWNlKHBkZXYpOworCXJldCA9IHBjaW1fZW5hYmxlX2RldmljZShwZGV2KTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC01NjksMzkgKzU2OSwzOCBAQCBzdGF0aWMg
aW50IGNpcnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJcmV0ID0gLUVOT01F
TTsKIAljaXJydXMgPSBremFsbG9jKHNpemVvZigqY2lycnVzKSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KGNpcnJ1cyA9PSBOVUxMKQotCQlnb3RvIGVycl9wY2lfcmVsZWFzZTsKKwkJcmV0dXJuIHJldDsK
IAogCWRldiA9ICZjaXJydXMtPmRldjsKLQlyZXQgPSBkcm1fZGV2X2luaXQoZGV2LCAmY2lycnVz
X2RyaXZlciwgJnBkZXYtPmRldik7CisJcmV0ID0gZGV2bV9kcm1fZGV2X2luaXQoJnBkZXYtPmRl
diwgZGV2LCAmY2lycnVzX2RyaXZlcik7CiAJaWYgKHJldCkgewogCQlrZnJlZShjaXJydXMpOwot
CQlnb3RvIGVycl9wY2lfcmVsZWFzZTsKKwkJcmV0dXJuIHJldDsKIAl9CiAJZGV2LT5kZXZfcHJp
dmF0ZSA9IGNpcnJ1czsKIAlkcm1tX2FkZF9maW5hbF9rZnJlZShkZXYsIGNpcnJ1cyk7CiAKLQly
ZXQgPSAtRU5PTUVNOwotCWNpcnJ1cy0+dnJhbSA9IGlvcmVtYXAocGNpX3Jlc291cmNlX3N0YXJ0
KHBkZXYsIDApLAotCQkJICAgICAgIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkpOworCWNpcnJ1
cy0+dnJhbSA9IGRldm1faW9yZW1hcCgmcGRldi0+ZGV2LCBwY2lfcmVzb3VyY2Vfc3RhcnQocGRl
diwgMCksCisJCQkJICAgIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgMCkpOwogCWlmIChjaXJydXMt
PnZyYW0gPT0gTlVMTCkKLQkJZ290byBlcnJfZGV2X3B1dDsKKwkJcmV0dXJuIC1FTk9NRU07CiAK
LQljaXJydXMtPm1taW8gPSBpb3JlbWFwKHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAxKSwKLQkJ
CSAgICAgICBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDEpKTsKKwljaXJydXMtPm1taW8gPSBkZXZt
X2lvcmVtYXAoJnBkZXYtPmRldiwgcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDEpLAorCQkJCSAg
ICBwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIDEpKTsKIAlpZiAoY2lycnVzLT5tbWlvID09IE5VTEwp
Ci0JCWdvdG8gZXJyX3VubWFwX3ZyYW07CisJCXJldHVybiAtRU5PTUVNOwogCiAJcmV0ID0gY2ly
cnVzX21vZGVfY29uZmlnX2luaXQoY2lycnVzKTsKIAlpZiAocmV0KQotCQlnb3RvIGVycl9jbGVh
bnVwOworCQlyZXR1cm4gcmV0OwogCiAJcmV0ID0gY2lycnVzX2Nvbm5faW5pdChjaXJydXMpOwog
CWlmIChyZXQgPCAwKQotCQlnb3RvIGVycl9jbGVhbnVwOworCQlyZXR1cm4gcmV0OwogCiAJcmV0
ID0gY2lycnVzX3BpcGVfaW5pdChjaXJydXMpOwogCWlmIChyZXQgPCAwKQotCQlnb3RvIGVycl9j
bGVhbnVwOworCQlyZXR1cm4gcmV0OwogCiAJZHJtX21vZGVfY29uZmlnX3Jlc2V0KGRldik7CiAK
QEAgLTYwOSwzMyArNjA4LDE4IEBAIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwKIAlwY2lfc2V0X2RydmRhdGEocGRldiwgZGV2KTsKIAlyZXQgPSBkcm1f
ZGV2X3JlZ2lzdGVyKGRldiwgMCk7CiAJaWYgKHJldCkKLQkJZ290byBlcnJfY2xlYW51cDsKKwkJ
cmV0dXJuIHJldDsKIAogCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRldiwgZGV2LT5tb2RlX2Nv
bmZpZy5wcmVmZXJyZWRfZGVwdGgpOwogCXJldHVybiAwOwotCi1lcnJfY2xlYW51cDoKLQlpb3Vu
bWFwKGNpcnJ1cy0+bW1pbyk7Ci1lcnJfdW5tYXBfdnJhbToKLQlpb3VubWFwKGNpcnJ1cy0+dnJh
bSk7Ci1lcnJfZGV2X3B1dDoKLQlkcm1fZGV2X3B1dChkZXYpOwotZXJyX3BjaV9yZWxlYXNlOgot
CXBjaV9yZWxlYXNlX3JlZ2lvbnMocGRldik7Ci0JcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIHZv
aWQgY2lycnVzX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CiAJc3RydWN0IGRy
bV9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQlzdHJ1Y3QgY2lycnVzX2Rl
dmljZSAqY2lycnVzID0gZGV2LT5kZXZfcHJpdmF0ZTsKIAogCWRybV9kZXZfdW5wbHVnKGRldik7
CiAJZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oZGV2KTsKLQlpb3VubWFwKGNpcnJ1cy0+bW1p
byk7Ci0JaW91bm1hcChjaXJydXMtPnZyYW0pOwotCWRybV9kZXZfcHV0KGRldik7Ci0JcGNpX3Jl
bGVhc2VfcmVnaW9ucyhwZGV2KTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNl
X2lkIHBjaWlkbGlzdFtdID0gewotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
