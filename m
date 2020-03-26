Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A290194C54
	for <lists.virtualization@lfdr.de>; Fri, 27 Mar 2020 00:24:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 36FB089338;
	Thu, 26 Mar 2020 23:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FDFEXKcnPMo; Thu, 26 Mar 2020 23:24:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12BDC89339;
	Thu, 26 Mar 2020 23:24:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AD15C0177;
	Thu, 26 Mar 2020 23:24:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A016C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1771488A0E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXk2aIPT-9oe
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:24:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8627288A00
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 23:24:39 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89DBD20409;
 Thu, 26 Mar 2020 23:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265079;
 bh=JZKbPbuU2UHbrb6VuFFKYu3d0IBGpuh9U6WpdN5Q95o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q85PokZ2dhFL2w2cjl+pt4aJsxsGn8rSQqaWZN0Su9jLT7w038vLGmLXxn4iYe8J0
 HqsRRX9+JfHKQp+EGEmIwKmNx7lAYHCxh20AOVFFz5Hxj4VhrBPlZhq4RAJMtRiI5A
 069I/f0J7/hN4SFkIWC+18m8iERA/XG6Zt6NLBis=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 06/19] drm/bochs: downgrade pci_request_region
 failure from error to warning
Date: Thu, 26 Mar 2020 19:24:18 -0400
Message-Id: <20200326232431.7816-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232431.7816-1-sashal@kernel.org>
References: <20200326232431.7816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Sam Ravnborg <sam@ravnborg.org>
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

RnJvbTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA4YzM0Y2QxYTdmMDg5ZGMwMzkzMzI4OWM1ZDRhNGQxNDg5NTQ5ODI4IF0KClNodXRkb3duIG9m
IGZpcm13YXJlIGZyYW1lYnVmZmVyIGhhcyBhIGJ1bmNoIG9mIHByb2JsZW1zLiAgQmVjYXVzZQpv
ZiB0aGlzIHRoZSBmcmFtZWJ1ZmZlciByZWdpb24gbWlnaHQgc3RpbGwgYmUgcmVzZXJ2ZWQgZXZl
biBhZnRlcgpkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJz
KCkgcmV0dXJuZWQuCgpEb24ndCBjb25zaWRlciBwY2lfcmVxdWVzdF9yZWdpb24oKSBmYWlsdXJl
IGZvciB0aGUgZnJhbWVidWZmZXIKcmVnaW9uIGFzIGZhdGFsIGVycm9yIHRvIHdvcmthcm91bmQg
dGhpcyBpc3N1ZS4KClJlcG9ydGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1h
cm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+ClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1h
bm4gPGtyYXhlbEByZWRoYXQuY29tPgpBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgpMaW5rOiBodHRwOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dp
ZC8yMDIwMDMxMzA4NDE1Mi4yNzM0LTEta3JheGVsQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2No
cy9ib2Noc19ody5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hz
X2h3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwppbmRleCBlNTY3YmRmYTJh
YjhlLi5iYjEzOTE3ODRjYWYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtMTU2LDEw
ICsxNTYsOCBAQCBpbnQgYm9jaHNfaHdfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCQlz
aXplID0gbWluKHNpemUsIG1lbSk7CiAJfQogCi0JaWYgKHBjaV9yZXF1ZXN0X3JlZ2lvbihwZGV2
LCAwLCAiYm9jaHMtZHJtIikgIT0gMCkgewotCQlEUk1fRVJST1IoIkNhbm5vdCByZXF1ZXN0IGZy
YW1lYnVmZmVyXG4iKTsKLQkJcmV0dXJuIC1FQlVTWTsKLQl9CisJaWYgKHBjaV9yZXF1ZXN0X3Jl
Z2lvbihwZGV2LCAwLCAiYm9jaHMtZHJtIikgIT0gMCkKKwkJRFJNX1dBUk4oIkNhbm5vdCByZXF1
ZXN0IGZyYW1lYnVmZmVyLCBib290IGZiIHN0aWxsIGFjdGl2ZT9cbiIpOwogCiAJYm9jaHMtPmZi
X21hcCA9IGlvcmVtYXAoYWRkciwgc2l6ZSk7CiAJaWYgKGJvY2hzLT5mYl9tYXAgPT0gTlVMTCkg
ewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
